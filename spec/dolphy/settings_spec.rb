require_relative '../spec_helper'

describe Dolphy::Settings do
  let(:settings) { Dolphy::Settings.new }

  describe "#initialize" do
    it "initializes an empty configuration hash" do
      expect(settings.settings).to eq(
        {
          template_engine: :erb,
          view_path: "./views/"
        }
      )
    end

    it "is an instance of Dolphy::Settings" do
      expect(settings).to be_a(Dolphy::Settings)
    end
  end

  describe "#[]" do
    it "finds the selected element from the settings hash" do
      expect(settings[:template_engine]).to eq :erb
    end
  end

  describe "#[]=" do
    it "sets the key value pair in the settings hash properly" do
      settings[:checkout] = 12
      expect(settings[:checkout]).to be 12
    end
  end
end
