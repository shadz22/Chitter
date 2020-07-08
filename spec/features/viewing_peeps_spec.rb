feature 'Viewing peeps' do
  scenario 'see all the peeps' do
    post_peep
    expect(page).to have_content 'A test peep'
  end

  scenario 'see the time the peep was posted' do
    post_peep
    time = Time.now.strftime("%d-%m-%y %H:%M")
    expect(page).to have_content time
  end

end
