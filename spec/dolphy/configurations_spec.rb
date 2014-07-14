require_relative '../spec_helper'

describe Dolphy::Configurations do
  let(:configurations) { Dolphy::Configurations.new }

  it "is an instance of Dolphy::Configurations" do
    expect(configurations).to be_a(Dolphy::Configurations)
  end

  describe "#initialize" do
    it "initializes an empty configuration hash" do
      expect(configurations.configurations).to eq({ template_engine: :erb }) 
    end
  end

  describe "#[]" do
    it "finds the selected element from the configurations hash" do
      expect(configurations[:template_engine]).to eq :erb
    end
  end
end
