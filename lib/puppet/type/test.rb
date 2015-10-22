Puppet::Type.newtype(:test,
:doc => <<-'ENDOFDOC'
Test resource
ENDOFDOC
) do
  ensurable

  newparam :name, :namevar => true do
    desc 'the name of resource'
  end

  newproperty :prop do
    desc 'Test prop'
  end

end
