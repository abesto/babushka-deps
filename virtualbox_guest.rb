dep 'virtualbox-guest-utils.lib'
dep 'virtualbox-guest-modules-arch.lib'

dep 'VirtualBox Guest Additions' do
	requires 'virtualbox-guest-modules-arch.lib', 'virtualbox-guest-utils.lib',
		'systemctl enable'.with(:service => 'vboxservice')
end
