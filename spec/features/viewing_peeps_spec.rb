require_relative './../spec_helper'

feature 'Viewing peeps' do
  scenario 'see all the peeps' do
    visit '/peeps'

    expect(page).to have_content 'My first peep'
    expect(page).to have_content 'This is the second one'
  end
end