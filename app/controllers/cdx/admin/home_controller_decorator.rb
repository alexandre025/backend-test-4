Cdx::Admin::HomeController.class_eval do

  helper Cdx::Admin::CallsHelper

  def index
    @completed_calls_count = Call.with_state(:completed).count

    @calls = Call.order(created_at: :desc).page(params[:page])
  end

end