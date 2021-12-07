# frozen_string_literal: true

module ResponseTemplate
  def self.template_error(code, message)
    { code: code, message: message }
  end

  def self.error(code, message)
    template_error(code, message)
  end
end
