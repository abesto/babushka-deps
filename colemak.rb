dep 'colemak' do
  met? {
    output = shell 'localectl'
    output.include?('VC Keymap: colemak') and
      output.include?('X11 Layout: us') and
      output.include?('X11 Model: pc104') and
      output.include?('X11 Variant: colemak')
  }
  meet {
    sudo 'localectl set-x11-keymap us pc104 colemak'
    sudo 'localectl set-keymap colemak'
  }
end
