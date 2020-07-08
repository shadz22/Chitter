def post_peep(text = 'A test peep')
  visit '/peeps/new'
  fill_in :peep, with: text
  click_button 'Submit'
end
