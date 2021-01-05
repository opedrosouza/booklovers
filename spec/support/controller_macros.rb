module ControllerMacros
  def login_admin
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:admin]
      subject.sign_in FactoryBot.create(:admin)
    end
  end
end