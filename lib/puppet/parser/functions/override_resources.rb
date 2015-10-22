Puppet::Parser::Functions::newfunction(:override_resources, :arity => -2, :doc => <<-EOS
Creates of updates resources according to the provided data the same way as
create_resources work.

file { '/tmp/1' :
  ensure  => 'absent',
  content => 'old content',
}

$override_data = {
  '/tmp/1' => {
    'content' => 'a',
  },
  '/tmp/2' => {
    'content' => 'b',
  },
  '/tmp/3' => {
    'content' => 'c',
  }
}

$optional_defaults_data = {
  'ensure' => 'present',
}

override_resources('file', $override_data, $optional_defaults_data)

# we have 3 files with content 'a', 'b' and 'c' and ensure set to 'present'

EOS
) do |argv|
  type = argv[0]
  data = argv[1] || {}
  defaults = argv[2] || {}
  fail 'First argument should be the type of the resource!' unless type and not type.empty?
  fail 'Second arguments should contain resource data hash!' unless data.is_a? Hash
  fail 'Third arguments should contain resource defaults hash!' unless defaults.is_a? Hash

  Puppet::Parser::Functions.autoloader.load(:update_resource) unless Puppet::Parser::Functions.autoloader.loaded?(:update_resource)
  Puppet::Parser::Functions.autoloader.load(:create_resources) unless Puppet::Parser::Functions.autoloader.loaded?(:create_resources)

  data.each do |title, parameters|
    parameters = defaults.merge parameters
    resource = catalog.resource type, title
    if resource
      debug "override_resources: '#{type}[#{title}]': found in the catalog, updating it"
      function_update_resource [type, title, parameters]
    else
      debug "override_resources: '#{type}[#{title}]': was not found in the catalog, creating it"
      function_create_resources [type, { title => parameters }]
    end
  end
end
