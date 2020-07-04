require_relative './../spec_helper'

feature 'Post a peep' do
  scenario 'User posts a peep' do

    visit '/peeps/new'
    fill_in :peep, with: 'A test peep'
    click_button 'Submit'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'A test peep'
  end
end
