dep 'quick key repeat' do
  requires 'quick key repeat under LightDM'
end

dep 'quick key repeat under LightDM' do
  requires 'lightdm',
           'ini contains'.with(
             :path => '/etc/lightdm/lightdm.conf',
             :section => 'Seat:*',
             :key => 'xserver-command',
             :value => 'X -ardelay 200 -arinterval 33',
             :use_sudo => yes
           )
end
