Puppet::Parser::Functions::newfunction(:create_echo, :doc => <<-EOS
Get the default provider of a type
EOS
) do |argv|
data = {
  'test_echo' => {
    'param' => {
       :a => 1,
       'b' => 2,
     }
  }
}
function_create_resources ['echo', data]
end
