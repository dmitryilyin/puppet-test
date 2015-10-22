Puppet::Parser::Functions::newfunction(:create_backends, :doc => <<-EOS
Create cinder backends from cinder_backends structure
EOS
) do |argv|
  if argv.length < 1
    raise Puppet::ParseError, "No argumnet given!"
  end

  cinder_backends = argv[0]

  if !cinder_backends.is_a? Hash
    raise Puppet::ParseError, "Argument should be cinder_backends structure!"
  end

  cinder_backends.each do |k,v|
    resource_type = "cinder::backends::#{k}"
    resource_params = v
    function_create_resources [resource_type, resource_params] 
  end
end
