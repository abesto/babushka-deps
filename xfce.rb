dep 'xfce4.bin' do
  provides 'xfce4-session'
end

dep 'xfce' do
  requires 'xfce4.bin'
end
