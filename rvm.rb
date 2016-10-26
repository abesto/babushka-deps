dep 'rvm' do
	requires 'bashrc'.with(
		:priority => 20,
		:filename => 'rvm',
		:contents => 'source $HOME/.rvm/scripts/rvm'
	), 'rvm.fisher'

	met? { (Dir.home / '.rvm/scripts/rvm').p.file? }
	meet { 
		shell 'gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3'
		shell 'curl -sSL https://get.rvm.io | bash -s stable'
	}
end

dep 'rvm.fisher'
