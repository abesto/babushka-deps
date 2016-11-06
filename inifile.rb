# options: hash of section name => hash of key-value pairs
dep 'ini contains', :path, :section, :key, :value, :use_sudo do
  requires 'inifile.gem'
  use_sudo.default! no

  met? {
    require 'inifile'
    ini = IniFile.load(path)
    if not ini.has_section?(section.to_s)
      log "#{path} doesn't have section #{section}"
      false
    elsif not ini[section].has_key?(key.to_s)
      log "#{path} section #{section} doesn't have key #{key}"
      false
    elsif ini[section][key.to_s] != value.to_s
      log "#{path} section #{section} has #{key} = #{ini[section][key]}, want #{value}"
      false
    else
      true
    end
  }

  meet {
    require 'inifile'
    ini = IniFile.load(path)
    ini[section_name] = {} unless ini.has_section?(section)
    ini[section][key] = value
    if yesno(use_sudo)
      require 'tempfile'
      file = Tempfile.new
      ini.write(:filename => file.path)
      file.close
      sudo "cat #{file.path} > #{path}"
      file.unlink
    else
      ini.write()
    end
  }
end

dep 'inifile.gem' do
  provides []
end
