require_relative '../spec_helper'

describe Dolphy::Settings do
  let(:settings) { Dolphy::Settings.new }

  it "is an instance of Dolphy::Settings" do
    expect(settings).to be_a(Dolphy::Settings)
  end

  describe "#initialize" do
    it "initializes an empty configuration hash" do
      expect(settings.settings).to eq(
        {
          template_engine: :erb,
          view_path: "./views/"
        }
      )
    end
  end

  describe "#[]" do
    it "finds the selected element from the settings hash" do
      expect(settings[:template_engine]).to eq :erb
    end
  end
end
