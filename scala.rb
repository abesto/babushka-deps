dep 'scala' do
  requires 'sbt.bin', 'scalastyle.aur',
           'symlink dotfile'.with('.gradle/init.gradle')
end

dep 'scalastyle.aur'
dep 'sbt.bin'
