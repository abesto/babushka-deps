dep 'fish.bin'

dep 'fisherman' do
	met? { shell? 'fish -c "fisher help > /dev/null"' }
	meet { shell 'curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher' }
end

meta :fisher do
	template {
		package = File.basename(name, '.fisher')
		met? { shell? "fish -c 'fisher ls | grep -F \'#{package}\''" }
		meet { shell "fish -c 'fisher \'#{package}\''" }
	}
end

dep 'custom fish stuff' do
	requires 'dotfiles'
	met? { shell('fish -c "fisher list"').include?('abesto') }
	meet { shell 'fish -c "fisher install ~/dotfiles/fish-abesto"' }
end

dep 'fish' do
	requires 'fish.bin', 'fortune.bin', 'most.bin',
		'fisherman',
		'z.fisher', 'metro.fisher', 'rvm.fisher',
		'custom fish stuff',
		'symlink dotfile'.with('bin'),
		'bashrc'.with(
			:priority => 99,
			:filename => 'fish',
			:contents => 'exec fish'
	)
end

dep 'z.fisher'
dep 'git.fisher'
dep 'metro.fisher' do
	requires 'powerline-fonts.lib'
end

dep 'powerline-fonts.lib'
dep 'fortune.bin' do
	installs 'fortune-mod'
end
dep 'most.bin'
