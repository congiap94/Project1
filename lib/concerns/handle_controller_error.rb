# frozen_string_literal: true

module HandleControllerError
  extend ActiveSupport::Concern
  include ActiveSupport::Rescuable
  included do
    rescue_from ActiveRecord::RecordInvalid, with: :show_errors
    rescue_from ActiveRecord::RecordNotFound, with: :show_errors_not_found
  end

  def success_message(message, seralizer, content = {})
    ResponseTemplate.success(message, content, seralizer)
  end

  def error_message(code, message)
    ResponseTemplate.error(code, message)
  end
end
