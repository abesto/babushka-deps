dep 'xmonad.bin'
dep 'xmonad-contrib.lib'

dep 'xmonad' do
	requires 'xmonad.bin', 'xmonad-contrib.lib',
		'symlink dotfile'.with('.xmonad')
end
