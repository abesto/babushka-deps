dep 'scala' do
  requires 'sbt.bin', 'scalastyle.aur',
           'symlink dotfile'.with(:what => '.gradle/init.gradle'),
           'symlink dotfile'.with(:what => '.sbt/0.13/plugins/plugins.sbt')
end

dep 'scalastyle.aur'
dep 'sbt.bin'
