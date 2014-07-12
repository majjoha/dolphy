$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'dolphy/core'

class DolphyApp
# This returns a DolphyApplication defined by what is passed in the block.
#
# An application could for instance be defined in this way
#
# DolphyApp.app do
#   DolphyApp.router do
#     get '/hello' do
#       haml :index, body: "Hello"
#     end
#   end
# end.serve!
#
  def self.app(&block)
    Dolphy::Core.new(&block)
  end

  def self.router(&block)
    yield
  end
end
