dep 'dotfiles' do
	git 'git@github.com:abesto/dotfiles', :to => '~/dotfiles'
end

dep 'symlink dotfile', :what do
	requires 'dotfiles'
	from = File.join(Dir.home, 'dotfiles', what)
	to = File.join(Dir.home, what)
	met? { File.symlink?(to) and File.readlink(to) == from }
	meet { File.symlink from, to }
end
