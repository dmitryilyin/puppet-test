Puppet::Parser::Functions::newfunction(:get_backends, :type => :rvalue, :doc => <<-EOS
Get beckends list grom cinder_backends structure
EOS
) do |argv|
  if argv.length < 1
    raise Puppet::ParseError, "No argumnet given!"
  end

  cinder_backends = argv[0]

  if !cinder_backends.is_a? Hash
    raise Puppet::ParseError, "Argument should be cinder_backends structure!"
  end

  all_backends = []
  cinder_backends.each do |k,v|
    next unless v.is_a? Hash
    v.each do |k,v|
      all_backends << k
    end
  end
  all_backends
end
