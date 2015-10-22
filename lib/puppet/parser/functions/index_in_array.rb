Puppet::Parser::Functions::newfunction(
:index_in_array,
:type => :rvalue,
:doc => <<-EOS
Get element index in array
EOS
) do |args|
  unless args.size == 2
    raise Puppet::ParseError, "You should give array and element!"
  end
  
end
