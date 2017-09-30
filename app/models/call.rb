class Call < ApplicationRecord

  validates :state, :from, :to, :call_parameters, presence: true

  scope :with_state, -> (state) { where(state: state) }

  def duration
    completed_at ? (completed_at - created_at).round(2) : ''
  end

  def self.create_or_update_from_params(params)
    call = Call.find_or_initialize_by(call_id: params['CallSid'])
    call.assign_attributes(
        state: params['CallStatus'],
        from: params['From'],
        to: params['To'],
        call_parameters: params
    )
    call.save!
    call
  end

end
