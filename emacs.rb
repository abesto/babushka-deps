dep 'spacemacs' do
	requires 'emacs.bin',
		'symlink dotfile'.with('.spacemacs'),
		'emacs server on login',
    'nodejs-tern.aur'  # for nodejs code analysis
	met? { shell('cd ~/.emacs.d; git remote -v').include?('spacemacs') }
	meet { shell 'git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d' }
end

dep 'emacs server systemd unit' do
	requires 'file contents'.with(
		:path => Dir.home / '.config/systemd/user/emacs.service',
		:contents => """[Unit]
Description=Emacs: the extensible, self-documenting text editor

[Service]
Type=forking
ExecStart=/usr/bin/emacs --daemon
ExecStop=/usr/bin/emacsclient --eval \"(kill-emacs)\"
Restart=always

[Install]
WantedBy=default.target
""")
end

dep 'emacs server on login' do
	requires 'emacs server systemd unit',
		'systemctl enable'.with(:service => 'emacs', :use_sudo => no)
end

dep 'emacs.bin'
dep 'nodejs-tern.aur'
