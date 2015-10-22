Puppet::Parser::Functions::newfunction(:test, :doc => <<-EOS
tst function
    EOS
) do |argv|
  module_path = Puppet.settings[:modulepath]
  manifest_path = File.join(File.dirname(module_path), 'manifests')
  puts module_path
  puts manifest_path
end
