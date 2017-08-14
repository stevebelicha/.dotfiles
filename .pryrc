if defined?(PryByebug) || defined?(PryDebugger) || defined?(PryNav)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
  Pry.commands.alias_command 'b', 'backtrace'

  Pry.config.history.should_save = true
  Pry.config.history.should_load = true

  # Hit Enter to repeat last command
  Pry::Commands.command /^$/, "repeat last command" do
    _pry_.run_command Pry.history.to_a.last
  end if defined?(PryByebug)
end

#require 'awesome_print'
#AwesomePrint.pry!

#class Object
  #def to_hash
    #hash = {}
    #instance_variables.each {|var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
    #hash
  #end
#end
