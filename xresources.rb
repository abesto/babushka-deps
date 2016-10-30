xresources_d = Dir.home / '.Xresources.d'

dep 'Xresources.d exists' do
  requires 'directory exists'.with(:dir => xresources_d)
end

dep 'Xresources', :module_name, :contents do
  file = Dir.home / '.Xresources.d' / module_name

  requires 'Xresources.d exists',
           'file contains'.with(:path => Dir.home / '.Xresources', :string => "#include \"#{file}\"\n"),
           'file contents'.with(:path => file, :contents => contents)
end
