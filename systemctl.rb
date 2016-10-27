dep 'systemctl enable', :service, :use_sudo do
  use_sudo.default! yes
  extra_args = yesno(use_sudo) ? '' : '--user'
  met? {
    shell?("systemctl #{extra_args} is-enabled #{service}", :sudo => yesno(use_sudo)).tap { |result|
      log "systemd #{yesno(use_sudo) ? '' : 'user '}unit #{service} is #{result ? 'enabled' : 'disabled'}"
    }
  }
  meet { shell "systemctl #{extra_args} enable #{service}", :sudo => yesno(use_sudo) }
end
