dep 'xmonad' do
  requires 'xmonad.bin', 'xmonad-contrib.lib',
           'dmenu.bin', 'xmobar.bin',
           'symlink dotfile'.with('.xmonad'),
           'symlink dotfile'.with('.config/xmobar/xmobarrc')
end

dep 'xmonad.bin'
dep 'xmonad-contrib.lib'
dep 'dmenu.bin'
dep 'xmobar.bin'
