Puppet::Parser::Functions::newfunction(
:vmware_backend_config,
:type => :rvalue,
:doc => <<-EOS
Generate backends config structure
EOS
) do |args|
  unless args.size > 0
    raise Puppet::ParseError, "You should give an array of backends!"
  end

  backend_names = args[0]
  index_param = args[1] || 'index'
 
  resources = {} 
  backend_names.split(',').each_with_index do |name, index|
    resource = {
      index_param => index.to_s,
    }
    resources[name] = resource
  end
  resources
end
