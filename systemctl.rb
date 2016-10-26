dep 'systemctl enable', :service do
	met? { shell? "systemctl is-enabled #{service}", :sudo => true }
	meet { sudo "systemctl enable #{service}" }
end

dep 'systemctl disable', :service do
	met? { not shell? "systemctl is-enabled #{service}", :sudo => true }
	meet { sudo "systemctl disable #{service}" }
end
