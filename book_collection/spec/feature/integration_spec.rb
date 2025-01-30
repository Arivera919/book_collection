# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in "book[title]", with: 'harry potter'
    fill_in "book[author]", with: 'J.K. Rowling'
    fill_in "book[price]", with: '20.00'
    fill_in "book[publisheddate]", with: '1997-06-26'
    click_on "Create Book"
    #visit books_path
    expect(page).to have_content('Book Added')
    expect(page).to have_content('harry potter')
    expect(page).to have_content('J.K. Rowling')
    expect(page).to have_content('20.00')
    expect(page).to have_content('1997-06-26')
  end

  scenario 'invalid inputs' do
    visit new_book_path
    fill_in "book[title]", with: ''
    click_on "Create Book"
    visit books_path
    expect(page).not_to have_content('Book Added')
    expect(page).not_to have_content('harry potter')
    expect(page).not_to have_content('J.K. Rowling')
    expect(page).not_to have_content('20.00')
    expect(page).not_to have_content('1997-06-26')
  end
end