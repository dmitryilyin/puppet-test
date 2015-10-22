Puppet::Type.type(:test).provide :test do
  desc 'install ssh keys'

  commands :false => '/bin/false'

  def exists?
    puts "call exists?"
    #return true
    return false
  end

  def create
    puts 'Create. true'
    begin
      self.false
    rescue Puppet::ExecutionFailure => e
      puts e.class
    end
    #puts "prop to create: #{@resource[:prop]}"
    true
  end

  def destroy
    puts 'Destroy. true'
  end

  def prop
    puts "get old prop"
    'value from existing state'
  end

  def prop=(value)
    puts "set new prop"
    puts "set param to: #{value}"
    true
  end

end
