feature 'Post a peep' do
  scenario 'User posts a peep' do
    post_peep
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'A test peep'
  end
end
