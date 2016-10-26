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

  met? { File.exists? '/var/lib/pacman/sync' / "#{repo_name}.db" }
  meet { sudo 'pacman -Sy' }
end
