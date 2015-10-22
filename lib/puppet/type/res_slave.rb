Puppet::Type.newtype(:res_slave,
:doc => <<-'ENDOFDOC'
Test slave resource
ENDOFDOC
) do
  ensurable

  newparam :name, :namevar => true do
    desc 'the name of resource'
  end

  newparam :param do
    desc 'Test param'
    defaultto 'value from default'

    validate do |val|
      puts "validate: #{val}"
      raise 'no value word in param' unless val =~ /value/
    end

    munge do |val|
      puts "munge: #{val}. will be upcased"
      val.upcase unless val.nil?
    end

  end

end
