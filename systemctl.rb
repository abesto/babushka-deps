dep 'systemctl enable', :service, :use_sudo do
  use_sudo.default! no
  extra_args = yesno(use_sudo) ? '' : '--user'
  met? { shell? "systemctl #{extra_args} is-enabled #{service}", :sudo => yesno(use_sudo) }
  meet { shell "systemctl #{extra_args} enable #{service}", :sudo => yesno(use_sudo) }
end

dep 'systemctl disable', :service, :use_sudo do
  use_sudo.default! no
  extra_args = yesno(use_sudo) ? '': '--user'
  met? { not shell?("systemctl #{extra_args} is-enabled #{service}", :sudo => yesno(use_sudo)) }
  meet { sudo "systemctl #{extra_args} disable #{service}", :sudo => yesno(use_sudo) }
end
