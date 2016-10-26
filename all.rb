dep 'all' do
  requires 'VirtualBox Guest Additions',
           'lightdm', 'xmonad', 'xfce', 'xclip.bin', 'xterm', 'urxvt',
           'ssh client', 'vim', 'fish', 'ag.bin',
           'java',
           'symlink dotfile'.with('.gitconfig'),
           'firefox',
           'spell checking',
           'abesto user', 'colemak'
end

dep 'xclip.bin'
dep 'ag.bin' do
  installs 'the_silver_searcher'
end
