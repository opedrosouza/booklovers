require 'rails_helper'

RSpec.feature "Authentication Feature Tests", type: :feature do

  it 'login as admin' do
    admin = create(:admin)
    visit new_admin_session_path
    fill_in 'Email',	with: admin.email
    fill_in 'Password', with: '123123'  
    click_button 'Entrar'
    expect(page).to have_text 'Signed in successfull' 
  end

  it 'register a new admin' do
    visit new_admin_registration_path
    fill_in 'Email',	with: Faker::Internet.email
    fill_in 'Password', with: '123123'  
    fill_in 'Password confirmation', with: '123123'  
    click_button 'Criar conta'
    expect(page).to have_text 'Welcome! You have signed up successfully' 
  end

  it 'login as user' do
    user = create(:user)
    visit new_user_session_path
    fill_in 'Email',	with: user.email
    fill_in 'Password', with: '123123'  
    click_button 'Entrar'
    expect(page).to have_text 'Signed in successfull' 
  end

  it 'register a new user' do
    visit new_user_registration_path
    fill_in 'Name',	with: Faker::Name.name
    fill_in 'Email',	with: Faker::Internet.email
    fill_in 'Password', with: '123123'  
    fill_in 'Password confirmation', with: '123123'  
    click_button 'Criar conta'
    expect(page).to have_text 'Welcome! You have signed up successfully' 
  end
end
