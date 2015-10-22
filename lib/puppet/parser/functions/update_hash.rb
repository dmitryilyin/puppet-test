Puppet::Parser::Functions::newfunction(:update_hash, :doc => <<-EOS
EOS
) do |argv|
  hash = argv.first
  hash = '1'
 # break unless hash.is_a? Hash
 # break unless hash['a']
 # hash['a']['b']['c'] = '2' 
end
