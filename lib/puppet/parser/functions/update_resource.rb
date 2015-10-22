Puppet::Parser::Functions::newfunction(:update_resource, :arity => -3, :doc => <<-EOS
Update the resource parameters

file { '/tmp/1' :
  ensure  => 'present',
  content => 'a',
}

$new_parameters = {
  'content' => 'b',
}

update_resource('file', '/tmp/1', $new_parameters)
# => file will have content: 'b'
EOS
) do |argv|
  type = argv[0]
  title = argv[1]
  parameters = argv[2] || {}
  fail 'First argument should be the type of the resource!' unless type and not type.empty?
  fail 'First argument should be the type of the resource!' unless title and not title.empty?
  fail 'Second arguments should contain resource parameters hash!' unless parameters.is_a? Hash
  resource = catalog.resource type, title
  unless resource
    debug "update_resource: '#{type}[#{title}]': was not found in the catalog!"
    break
  end
  parameters.each do |parameter, value|
    # debug "update_resource: '#{type}[#{title}]': set parameter: '#{parameter}' to: '#{value}'"
    resource[parameter] = value
  end
  true
end
