dep 'arch repo', :repo_name, :server do
	requires 'file contains'.with(
		:use_sudo => true,
		:path => '/etc/pacman.conf',
		:string => """
[xyne-x86_64]
SigLevel = Required
Server = http://xyne.archlinux.ca/repos/xyne
"""
		)
end
