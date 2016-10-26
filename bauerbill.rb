dep 'bauerbill.bin' do
	requires 'arch repo'.with(
		:repo_name => 'xyne-x86_64',
		:server => 'http://xyne.archlinux.ca/repos/xyne')
end

meta :aur do
	template {
		package = File.basename(name, '.aur')
		met? { shell("bauerbill -Q #{package}").include?('error:') }
		meet { 
			shell """
			tmpdir=$(mktemp -d)
			cd $tmpdir
			echo P | bauerbill --aur -S #{package}
			echo P | ./build/download.sh
			echo -n 'P\nY\n' | ./build/build.sh
			cd -
			rm -rf $tmpdir
			"""
		}
	}
end

dep 'python-powerline-git.aur'
