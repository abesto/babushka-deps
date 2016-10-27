dep 'dotfiles' do
  git 'git@github.com:abesto/dotfiles', :to => '~/dotfiles'
end

dep 'symlink dotfile', :what do
  requires 'dotfiles'
  from = File.join(Dir.home, 'dotfiles', what)
  to = File.join(Dir.home, what)
  met? {
    (File.symlink?(to) and File.readlink(to) == from).tap { |result|
      log "'#{from}' is #{result ? '' : 'not '}a symlink to '#{to}'"
    }
  }
  meet {
    File.symlink from, to
    log "Symlinked '#{from}' to '#{to}'"
  }
end
