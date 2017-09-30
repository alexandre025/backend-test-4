module Cdx
  module Admin
    module CallsHelper

      def call_state_tag(call)
        color = ''
        if %w(failed canceled).include? call.state
          color = 'bg-red'
        elsif %w(ringing in-progress).include? call.state
          color = 'bg-blue'
        elsif call.state == 'completed'
          color = 'bg-green'
        end

        tag.span call.state, class: %w(badge) << color
      end

    end
  end
end
