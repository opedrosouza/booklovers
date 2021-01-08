module FeatureHelpers
  def sign_in_admin
    @admin = FactoryBot.create(:admin)
    visit '/admin/entrar'
    fill_in "email", with: @admin.email
    fill_in "password", with: @admin.password
    click_button "Entrar"
  end

  def sign_in_user
    @user = FactoryBot.create(:user)
    visit '/entrar'
    fill_in "email", with: @user.email
    fill_in "password", with: @user.password
    click_button "Entrar"
  end
end