feature 'Registeration' do
  scenario 'user signs up' do
    visit '/'
    click_button 'Sign up'

    expect(current_path).to eq '/users/new'

    fill_in :name, with: 'Shadi Khazaei'
    fill_in :email, with: 'test@testing.com'
    fill_in :username, with: 'shadz'
    fill_in :password, with: 'password123'
    click_button 'Submit'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome, shadz!'
  end
end
