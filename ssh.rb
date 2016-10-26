dep 'ssh.bin' do
	installs 'openssh'
end

dep 'keychain.bin'

dep 'keychain' do
	requires 'keychain.bin',
		'bashrc'.with(
			:priority => 10,
			:filename => 'keychain',
			:contents => "eval $(keychain --eval --quiet id_rsa)\n"
	)
end

dep 'ssh client' do
	requires 'ssh.bin', 'keychain'
end
