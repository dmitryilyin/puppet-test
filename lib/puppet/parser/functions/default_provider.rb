Puppet::Parser::Functions::newfunction(:default_provider, :type => :rvalue, :doc => <<-EOS
Get the default provider of a type
EOS
) do |argv|
  type_name = argv[0]
  fail 'No type name provided!' unless type_name
  type_name = type_name.capitalize.to_sym
  return unless Puppet::Type.const_defined? type_name
  type = Puppet::Type.const_get type_name
  provider = type.defaultprovider
  return unless provider
  provider.name.to_s
end

