dep 'file contents', :path, :contents, :use_sudo do
  use_sudo.default! no
  met? {
    (path.p.read == contents).tap { |result|
      log "File #{path} #{result ? 'has' : 'doesn\'t have'} the expected content"
    }
  }
  meet {
    if yesno use_sudo
      require 'tempfile'
      file = Tempfile.new
      file.write(contents)
      file.close
      sudo "cat #{file.path} > #{path}"
      file.unlink
      log "Created #{path} as root"
    else
      path.p.write contents
      log "Created #{path}"
    end
  }
end

dep 'file contains', :path, :string, :use_sudo do
  use_sudo.default! no
  requires 'file exists'.with(path, use_sudo)
  met? {
    path.p.read.include?(string).tap { |result|
      log "#{path} #{result ? 'contains' : 'does not contain'} expected string '#{string}'"
    }
  }
  meet {
    if yesno use_sudo
      sudo "echo -n '#{string}' >> #{path}"
    else
      path.p.append string
    end
    log "Appended #{string} to #{path}#{yesno(use_sudo) ? ' as root' : ''}"
  }
end

dep 'directory exists', :dir, :use_sudo do
  use_sudo.default! no
  met? {
    Dir.exists?(dir).tap { |result|
      log "Directory #{dir} #{result ? '' : 'does not '}exist#{result ? 's' : ''}"
    }
  }
  meet {
      shell "mkdir -p '#{dir}'", :sudo => yesno(use_sudo)
      log "Created directory #{dir}#{yesno(use_sudo) ? ' as root' : ''}"
  }
end

dep 'file exists', :path, :use_sudo do
  use_sudo.default! no
  requires 'directory exists'.with(:dir => File.dirname(path), :use_sudo => use_sudo)

  met? {
    File.exists?(path).tap { |result|
      log "File #{path} #{result ? 'exists' : 'does not exist'}"
    }
  }
  meet {
    shell "touch '#{path}'", :sudo => yesno(use_sudo)
    log "Created file #{path}#{yesno(use_sudo) ? ' as root' : ''}"
  }
end
