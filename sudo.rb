dep 'sudo.bin'

dep 'sudo' do
	requires 'sudo.bin', 'group sudo'.with(:group => 'wheel')
end

dep 'group sudo', :group do
	sudoers = "/etc/sudoers.d/babushka_group_sudo_#{group}"
	line = "%#{group}	ALL=(ALL) ALL\n"
	met? { sudoers.p.read == line }
	meet { sudoers.p.write line }
end
