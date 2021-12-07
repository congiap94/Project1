# frozen_string_literal: true

class ClientPolicy
  def initialize(id, office_id)
    @id = id
    @office_id = office_id
  end

  def admin?
    admin = OfficeManager.find_by!(user_id: @id)
    return false if admin.nil? || admin.office_id != @office_id.to_i

    true
  end
end
