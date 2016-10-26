dep 'sudo.bin'

dep 'sudo' do
  requires 'sudo.bin', 'group sudo'.with(:group => 'wheel')
end

dep 'group sudo', :group do
  sudoers = "/etc/sudoers.d/babushka_group_sudo_#{group}"
  line = "%#{group}  ALL=(ALL) ALL\n"
  met? { sudoers.p.read == line }
  meet { sudoers.p.write line }
end

# helpers for deps that have :use_sudo params
module Babushka
  module GitHelpers
    # Make these helpers directly callable, and private when included.
    module_function

    def yes
      'yes'
    end

    def no
      'no'
    end

    def yesno(s)
      return true if s == yes
      return false if s == no
      raise "yesno got #{s}, which is not #{yes} or #{no}"
    end
  end
end
