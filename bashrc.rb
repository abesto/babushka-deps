dep 'bashrc', :priority, :filename, :contents do
  requires 'directory exists'.with(:dir => Dir.home / '.bashrc.d'),
           'symlink dotfile'.with(:what => '.bashrc'),
           'file contents'.with(
             :path => File.join(Dir.home, '.bashrc.d', "#{priority}#{filename}"),
             :contents => contents
           )
end

dep 'bashrc flavor', :flavor do
  requires 'symlink dotfile'.with(:what => '.bashrc', :where => '.bashrc-nofish')
end

dep 'bashrc skip', :flavor, :priority, :filename do
  requires 'file exists'.with(:path => Dir.home / ".bashrc-#{flavor}.skip" / "#{priority}#{filename}")
end
