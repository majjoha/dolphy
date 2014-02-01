require "#{File.dirname(__FILE__)}/lib/dolphy"

class MyApp < Dolphy::Core
end

run MyApp.new
