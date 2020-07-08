def post_peep
  visit '/peeps/new'
  fill_in :peep, with: 'A test peep'
  click_button 'Submit'
end
