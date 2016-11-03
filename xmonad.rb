dep 'xmonad' do
  requires 'xmonad.bin', 'xmonad-contrib.lib',
           'dmenu.bin', 'xmobar.bin',
           'symlink dotfile'.with(:what => '.xmonad'),
           'symlink dotfile'.with(:what => '.config/xmobar/xmobarrc')
end

dep 'xmonad.bin'
dep 'xmonad-contrib.lib'
dep 'dmenu.bin'
dep 'xmobar.bin'
