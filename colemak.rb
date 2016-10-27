dep 'colemak' do
  met? {
    output = shell 'localectl'
    ['VC Keymap: colemak', 'X11 Layout: us', 'X11 Model: pc104', 'X11 Variant: colemak'].all? { |entry|
      output.include?(entry).tap { |result|
        log "localectl output #{result ? 'contains' : 'does not contain'} expected entry '#{entry}'"
      }
    }
  }

  meet {
    sudo 'localectl set-x11-keymap us pc104 colemak'
    sudo 'localectl set-keymap colemak'
    log "Enabled Colemak for both X11 and raw console"
  }
end
