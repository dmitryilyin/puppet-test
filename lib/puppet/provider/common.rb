require 'puppet'
require 'open3'

class Puppet::Provider::Common < Puppet::Provider
  def self.has_command(name, path)
    name = name.intern
    command = lambda do |*args|
      cmd = "#{path} #{args.flatten.join ' '}"
      stdout, stderr, process_status = Open3.capture3 cmd
      if process_status.exitstatus != 0
        output = stdout + stderr
        raise Puppet::ExecutionFailure, "Execution of '#{cmd}' returned #{process_status.exitstatus}: #{output}"
      end
      stdout
    end

    @commands[name] = name

    create_class_and_instance_method(name) do |*args|
      command.call *args
    end
  end

  # def self.commands(command_specs)
  #   puts "self commands: #{command_specs.inspect}"
  #   command_specs.each do |name, path|
  #     has_command(name, path)
  #   end
  # end
  #
  # def commands(command_specs)
  #   self.class.commands(command_specs)
  # end
end
