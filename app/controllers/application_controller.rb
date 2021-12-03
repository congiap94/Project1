class ApplicationController < ActionController::API
  def success_message(message, content = {}, seralizer)
    ResponseTemplate.success(message, content, seralizer)
  end

  def error_message(message, content = {})
    ResponseTemplate.error(message, content)
  end
end
