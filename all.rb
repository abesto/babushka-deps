dep 'all' do
  requires 'VirtualBox Guest Additions',
           'lightdm', 'xmonad', 'xfce', 'xclip.bin', 'xterm', 'st',
           'firefox', 'slack', 'yubikey', 'imagemagick',
           'ssh client', 'vim', 'git', 'fish', 'ag.bin',
           'java', 'go', 'python', 'scala',
           'spell checking', 'quick key repeat',
           'abesto user', 'colemak',
           'symlink dotfile'.with(:what => 'bin')
end

dep 'xclip.bin'
dep 'ag.bin' do
  installs 'the_silver_searcher'
end
