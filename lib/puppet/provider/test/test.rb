require File.join File.dirname(__FILE__), '../common'

Puppet::Type.type(:test).provide(:test, :parent => Puppet::Provider::Common) do
  desc 'install ssh keys'

  # commands :false => '/bin/false'
  # commands :true => '/bin/true'
  commands :tst => '/tmp/1.sh'

  def exists?
    puts 'call exists?'
    require 'pry'
    binding.pry
    return false
  end

  def create
    puts 'Create. true'
    true
  end

  def destroy
    puts 'Destroy. true'
    true
  end

  def prop
    puts 'get old prop'
    'value from existing state'
  end

  def prop=(value)
    puts 'set new prop'
    puts "set param to: #{value}"
    true
  end

end
