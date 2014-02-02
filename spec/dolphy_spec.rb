require 'spec_helper'

describe 'DolphyApplication' do
  include Rack::Test::Methods

  describe '#get' do
    it 'should return "Hello" on /hello' do
      visit '/hello'
      expect(page).to have_content "Hello"
    end
  end
end
