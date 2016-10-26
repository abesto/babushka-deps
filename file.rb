dep 'file contents', :path, :contents, :use_sudo do
	use_sudo.default! no
	met? { path.p.read == contents }
	meet { 
		if yesno use_sudo
			require 'tempfile'
			file = Tempfile.new
			file.write(contents)
			file.close
			sudo "cat #{file.path} > #{path}"
			file.unlink
		else
			path.p.write contents 
		end
	}
end

dep 'file contains', :path, :string, :use_sudo do
	use_sudo.default! no
	met? { path.p.read.include? string }
	meet { 
		if yesno use_sudo
			sudo "echo -n '#{string}' >> #{path}"
		else
			path.p.append string 
		end
	}
end

dep 'directory exists', :dir, :use_sudo do
	use_sudo.default! no
	met? { Dir.exists?(dir) }
	meet { 
		cmd = "mkdir -p '#{dir}'"
		shell cmd, :sudo => yesno(use_sudo)
	}
end
