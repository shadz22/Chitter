require_relative './../spec_helper'
require 'pg'

feature 'Viewing peeps' do
  scenario 'see all the peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'My first peep');")
    connection.exec("INSERT INTO peeps VALUES(2, 'This is the second one');")

    visit '/peeps'

    expect(page).to have_content 'My first peep'
    expect(page).to have_content 'This is the second one'
  end
end