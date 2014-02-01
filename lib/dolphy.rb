$LOAD_PATH.unshift(File.dirname(__FILE__))
require "dolphy/core"

class DolphyApplication
# This returns a DolphyApplication defined by what is passed in the block.
#
# An application could for instance be defined in this way
#
# app = DolphyApplication.app do
#   get '/hello' do
#     haml :index, :body => "Hello"
#   end
# end
#
# run app
  class << self
    def app(&block)
      Dolphy::Core.new(&block)
    end
  end
end
