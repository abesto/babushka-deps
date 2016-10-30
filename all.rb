dep 'all' do
  requires 'VirtualBox Guest Additions',
           'lightdm', 'xmonad', 'xfce', 'xclip.bin', 'xterm', 'st',
           'firefox', 'imagemagick',
           'ssh client', 'vim', 'fish', 'ag.bin',
           'java', 'go',
           'symlink dotfile'.with('.gitconfig'),
           'spell checking',
           'abesto user', 'colemak'
end

dep 'xclip.bin'
dep 'ag.bin' do
  installs 'the_silver_searcher'
end
