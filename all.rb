dep 'all' do
	requires 'VirtualBox Guest Additions',
		'lightdm', 'xmonad', 'xfce', 'xclip.bin',
		'xterm', 'urxvt', 'java',
		'symlink dotfile'.with('.gitconfig'),
		'ssh client', 'vim', 'fish',
	       	'firefox',
		'spell checking',
		'abesto user', 'colemak'
end

dep 'xclip.bin'
