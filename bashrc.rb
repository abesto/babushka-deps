dep 'source .bashrc.d from .bashrc' do
	requires 'file contents'.with(
		:path => File.join(Dir.home, '.bashrc'),
		:contents => """#!/bin/bash
for file in $(ls ~/.bashrc.d); do
	. ~/.bashrc.d/$file
done
""")
end

dep 'bashrc', :priority, :filename, :contents do
	requires 'directory exists'.with(:dir => Dir.home / '.bashrc.d'),
		'source .bashrc.d from .bashrc',
		'file contents'.with(
			:path => File.join(Dir.home, '.bashrc.d', "#{priority}#{filename}"),
			:contents => contents
		)
end
