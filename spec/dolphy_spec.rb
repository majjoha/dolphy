require 'spec_helper'

describe 'DolphyApplication' do
  include Rack::Test::Methods

  describe '#get' do
    it 'returns a page saying Hello on a correct path' do
      visit '/'
      expect(page).to have_content "Hello"
    end

    it 'does not have this route' do
      visit '/fail'
      expect(page).to have_content "Page not found."
    end
  end

  describe '#post' do
    it 'returns a page saying Hello Mathias' do
      visit '/'
      fill_in('message[name]', with: 'Mathias')
      click_button('Submit')
      expect(page).to have_content "Hello Mathias"
    end
  end
end
