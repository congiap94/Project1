module ResponseTemplate
  def self.template(code, message, content, seralizer)
      response = { code: code, message: message, data: ActiveModelSerializers::SerializableResource.new(content, each_serializer: seralizer) }
  end
  def self.template_error(code, message, content)
    response = { code: code, message: message, data: content }
  end

  def self.success(message, content, seralizer)
      template(200, message, content, seralizer)
  end

  def self.error(message, content)
    template_error(500, message, content)
  end
end