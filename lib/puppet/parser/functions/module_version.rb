Puppet::Parser::Functions::newfunction(:echo, :doc => <<-EOS
Get version of puppet module if it's present
EOS
) do |args|
  unless args.size == 1
    raise Puppet::ParseError, "You should give module's name"
  end
  module_name = argv[0]
  environment = Puppet::Node::Environment.new
  environment.modules_by_path.each do |module_path, modules|
    modules.select { |m| m.name == module_name }.each { |m| return m.version.to_s if m.version }
  end
  return False
end
