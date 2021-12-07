# frozen_string_literal: true

module HandleControllerError
  extend ActiveSupport::Concern
  include ActiveSupport::Rescuable
  included do
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_error
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_error
  end

  def error_message(code, message)
    ResponseTemplate.error(code, message)
  end
end
