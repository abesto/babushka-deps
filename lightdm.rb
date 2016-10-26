dep 'lightdm.bin'
dep 'lightdm-gtk-greeter.lib'

dep 'lightdm' do
	requires 'lightdm.bin', 'lightdm-gtk-greeter.lib',
	       	'systemctl enable'.with(:service => 'lightdm')
end
