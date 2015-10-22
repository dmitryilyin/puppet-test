Puppet::Parser::Functions::newfunction(:tst, :doc => <<-EOS
tst
EOS
) do |argv|
  require 'pry'
  binding.pry
end
