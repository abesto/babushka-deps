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


dep 'fish' do
	requires 'fish.bin',
		'fisherman',
		'symlink dotfile'.with('.config/fish/functions/fish-abesto'),
		'z.fisher', 'metro.fisher',
		'bashrc'.with(
			:priority => 99,
			:filename => 'fish',
			:contents => 'exec fish'
	)
end

dep 'z.fisher'
dep 'metro.fisher' do
	requires 'powerline-fonts.lib'
end

dep 'powerline-fonts.lib' do
	requires 'arch repo'.with(:repo_name => 'community')
end
