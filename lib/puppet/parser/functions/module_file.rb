Puppet::Parser::Functions::newfunction(
:module_file,
:type => :rvalue,
:doc => <<-EOS
Get a file content from a module
EOS
) do |args|
  unless args.size == 2
    raise Puppet::ParseError, "You should give module's name and file path!"
  end
  
  module_path = Puppet.settings[:modulepath]
  module_name = args[0]
  file_path = args[1]
  module_file_path = File.join module_path, module_name, 'files', file_path

  raise Puppet::ParseError, "File: '#{module_file_path}' doesn't exist!" unless File.exist? module_file_path
  File.read module_file_path
end
