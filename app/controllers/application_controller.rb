class ApplicationController < ActionController::API
  def success_message(message, content = {})
    ResponseTemplate.success(message, content)
  end

  def error_message(message, content = {})
    ResponseTemplate.error(message, content)
  end

  def unauthorized_message(message, content = {})
    ResponseTemplate.unauthorized(message, content)
  end
end
