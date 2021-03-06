require 'spec_helper'

describe Dolphy do
  include Rack::Test::Methods

  describe "#get" do
    it "returns a page saying Hello on a correct path" do
      visit '/'
      expect(page).to have_content "Hello"
    end

    it "does not have this route" do
      visit '/fail'
      expect(page).to have_content "Page not found."
    end

    it "returns regular strings (without calling render)" do
      visit '/hello'
      expect(page).to have_content "hello world!"
    end

    it "returns the content of the last defined route" do
      visit '/hello/login'
      expect(page).to have_content "this is a login"
      expect(page).to_not have_content "hello login"
    end

    it "returns a page using the input from the matcher" do
      visit '/hello/davis'
      expect(page).to have_content "hello davis"
    end
  end

  describe "#post" do
    it "returns a page saying Hello Mathias" do
      visit '/'
      fill_in('message[name]', with: 'Mathias')
      click_button('Submit')
      expect(page).to have_content "Hello Mathias"
    end
  end

  describe "#redirect_to" do
    it "redirects to the given path" do
      visit '/wat'
      expect(current_path).to eq "/hello"
      expect(page).to have_content "hello world!"
    end
  end
end
