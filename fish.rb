dep 'fisherman' do
  met? {
    shell?('fish -c "functions -n | grep fisher"').tap { |result|
      log "fisherman is #{result ? '' : 'not '}installed"
    }
  }
  meet { log_shell 'Installing fisher', 'curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher' }
end

exec_fish_priority = 99
exec_fish_filename = 'fish'

dep '.bashrc-nofish' do
  requires 'bashrc flavor'.with('nofish'),
           'bashrc skip'.with(:flavor => 'nofish',
                              :priority => exec_fish_priority,
                              :filename => exec_fish_filename)
end

meta :fisher do
  accepts_value_for :source

  template {
    package = File.basename(name, '.fisher')
    met? {
      shell?("fish -c 'fisher ls | grep -F \'#{package}\''").tap { |result|
        log "fisher package #{package} is #{result ? '' : 'not '}installed"
      }
    }
    meet {
      log_shell "Installing fisher package #{package}", "fish -c 'fisher \'#{source || package}\''"
    }
  }
end

dep 'fish' do
  requires 'fish.bin', 'fortune.bin', 'most.bin',
           'fisherman',
           'z.fisher', 'metro.fisher', 'rvm.fisher',
           'abesto.fisher',
           'bashrc'.with(
             :priority => exec_fish_priority,
             :filename => exec_fish_filename,
             :contents => 'exec fish'
           ),
           '.bashrc-nofish'
end

dep 'fish.bin'
dep 'z.fisher'
dep 'git.fisher'
dep 'metro.fisher' do
  source 'abesto/metro'
  requires 'powerline-fonts.lib'
end
dep 'abesto.fisher' do
  requires 'dotfiles'
  source '~/dotfiles/fish-abesto'
end

dep 'powerline-fonts.lib'
dep 'fortune.bin' do
  installs 'fortune-mod'
end
dep 'most.bin'
