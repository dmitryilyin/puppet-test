Puppet::Parser::Functions::newfunction(:pry, :doc => <<-EOS
EOS
) do |argv|

require 'pry'
binding.pry

end
