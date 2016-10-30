dep 'imagemagick' do
  requires 'imagemagick.bin'
end

dep 'imagemagick.bin' do
  provides 'import'
end
