require_relative '../spec_helper'

describe Dolphy::TemplateEngine do
  let(:template_engine) do
    Dolphy::TemplateEngine.new(
      Dolphy::TemplateEngines::ErbEngine,
      "./spec/views/"
    )
  end

  describe "#initialize" do
    it "is an instance of Dolphy::TemplateEngine" do
      expect(template_engine).to be_a(Dolphy::TemplateEngine)
    end
  end

  describe "#render" do
    it "renders the page with the locals" do
      expect(template_engine.render(:what, body: "wat")).to eq "wat"
    end

    it "renders the page without the locals" do
      expect(template_engine.render(:not_found, {})).to eq <<-HTML
<img src="http://upload.wikimedia.org/wikipedia/en/thumb/8/86/Eric_Dolphy.jpg/220px-Eric_Dolphy.jpg" alt="">
<h1>Dolphy says no!</h1>
<h2>HTTP 404 Page not found.</h2>
HTML
    end
  end
end
