# frozen_string_literal: true

module ResponseTemplate
  def self.template_serializer(code, message, seralizers, content = {})
    { code: code, message: message,
      data: ActiveModelSerializers::SerializableResource.new(content, serializer: seralizers) }
  end

  def self.template_error(code, message)
    { code: code, message: message }
  end

  def self.success(message, seralizer, content = {})
    template_serializer(200, message, content, seralizer)
  end

  def self.error(code, message)
    template_error(code, message)
  end
end
