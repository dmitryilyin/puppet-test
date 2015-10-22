Puppet::Type.type(:res_slave).provide :ruby do
  desc 'test slave resource'

  def echo(*cmd)
    cmd = ['echo'] + cmd
    output = Puppet::Util::Execution.execute(cmd, :failonfail => false, :combine => true)
    [output,$CHILD_STATUS.exitstatus]
  end

  def exists?
    puts "Exists? false"
    return false
  end

  def create
    puts 'Create. true'
    puts "param to create: #{@resource[:param]}"
  end

  def destroy
    puts 'Destroy. true'
  end

  def param
    'value from existing state'
  end

  def param=
    "set param to: #{@resource[:param]}"
  end

end
