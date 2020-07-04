feature 'Viewing peeps' do
  scenario 'see all the peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    Peep.create(message: 'My first peep')
    Peep.create(message: 'This is the second one')

    visit '/peeps'

    expect(page).to have_content 'My first peep'
    expect(page).to have_content 'This is the second one'
  end
end