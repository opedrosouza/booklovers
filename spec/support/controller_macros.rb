module ControllerMacros
  def login_admin
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:admin]
      subject.sign_in FactoryBot.create(:admin)
    end
  end

  def login_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      subject.sign_in FactoryBot.create(:user)
    end
  end
end