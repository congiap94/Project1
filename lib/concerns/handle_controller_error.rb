# frozen_string_literal: true

module HandleControllerError
  extend ActiveSupport::Concern
  include ActiveSupport::Rescuable
  included do
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_error
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_error
  end

  def render_error_message(code, message)
    render json: { code: code, message: message }
  end

  def render_invalid_error(exception)
    render_error_message(400, exception)
  end

  def render_not_found_error(exception)
    render_error_message(404, exception)
  end
end
