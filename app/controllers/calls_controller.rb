class CallsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :create_or_update_call

  # POST /calls/handle
  # Incoming calls are handled by this method
  def handle
    response = Twilio::TwiML::VoiceResponse.new do |r|
      r.say t('calls.messages.handle')
    end
    response.append Twilio::TwiML::Gather.new(num_digits: 1, action: calls_action_url)

    render xml: response
  end

  # POST /calls/action
  # Execute to the proper action, selected by a digits
  def action
    response = \
      case params['Digits']
                       when '1'
                         Twilio::TwiML::VoiceResponse.new do |r|
                           r.dial(action: calls_complete_url) do |dial|
                             dial.number('+33 7 50 33 25 63')
                           end
                         end
                       when '2'
                         Twilio::TwiML::VoiceResponse.new do |r|
                           r.say t('calls.messages.record')
                           r.record(timeout: 10, transcribe: true, action: calls_complete_url)
                         end
                       else
                         Twilio::TwiML::VoiceResponse.new do |r|
                           r.redirect calls_handle_url, method: :post
                         end
      end

    render xml: response
  end

  # POST /calls/complete
  # Mark with a timestamp a completed call
  def complete
    @call.update(completed_at: DateTime.now)
  end


  private

  # Create or update a call from request parameters
  def create_or_update_call
    @call = Call.create_or_update_from_params(params)
  end

end

