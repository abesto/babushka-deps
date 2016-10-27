dep 'sudo.bin'

dep 'sudo' do
  requires 'sudo.bin', 'group sudo'.with(:group => 'wheel')
end

dep 'group sudo', :group do
  requires 'file contents'.with(
             :path => "/etc/sudoers.d/babushka_group_sudo_#{group}",
             :contents => "%#{group}  ALL=(ALL) ALL\n"
           )
end

# helpers for deps that have :use_sudo params
module Babushka
  module SudoHelpers
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

  class DepContext
    include SudoHelpers
  end
end
