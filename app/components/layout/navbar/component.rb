# frozen_string_literal: true

class Layout::Navbar::Component < ViewComponent::Base
  def initialize(member: nil)
    @member = member
  end

  def is_user?
    @member.class == User
  end

  def is_admin?
    @member.class == Admin
  end
end
