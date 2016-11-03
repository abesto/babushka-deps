dep 'git' do
  requires 'symlink dotfile'.with(:what => '.gitconfig')
end

dep 'git clone once', :repo, :to do
  met? {
    shell("cd #{to}; git remote -v").include?(repo).tap { |result|
      log "#{to} is #{result ? '' : 'not '}a clone of #{repo}"
    }
  }
  meet { log_shell "Cloning #{repo} into #{to}", "git clone #{repo} #{to}" }
end
