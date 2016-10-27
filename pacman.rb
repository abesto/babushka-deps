dep 'arch repo', :repo_name, :server do
  # This is terrible. Should be built properly by parsing
  # and reconstructing the config file.
  server.default!('')

  content = "[#{repo_name}]\n"
  if server != ''
    content += "SigLevel = Required\nServer = #{server}\n"
  else
    content += "Include = /etc/pacman.d/mirrorlist\n"
  end
  requires 'file contains'.with(
             :use_sudo => true,
             :path => '/etc/pacman.conf',
             :string => content)

  met? {
    db = '/var/lib/pacman/sync' / "#{repo_name}.db"
    File.exists?(db).tap { |result|
      log "DB file for repo #{repo_name} #{result ? 'exists' : 'does not exist'} at #{db}"
    }
  }
  meet { log_shell 'Updating package lists', 'pacman -Sy', :sudo => true }
end
