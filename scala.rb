dep 'scala' do
  requires 'scalastyle.aur',
           'symlink dotfile'.with('.gradle/init.gradle')
end

dep 'scalastyle.aur'
