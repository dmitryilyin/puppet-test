module Puppet::Parser::Functions
  newfunction(:parse_yaml_file, :type => :rvalue, :doc => <<-EOS
This function accepts YAML file name and converts it into the correct
Puppet structure.
    EOS
  ) do |arguments|

    if (arguments.size != 1) then
      raise(Puppet::ParseError, "parseyaml(): Wrong number of arguments "+
        "given #{arguments.size} for 1")
    end
    require 'yaml'
    yaml = YAML::load_file arguments[0]
  end
end

# vim: set ts=2 sw=2 et :
