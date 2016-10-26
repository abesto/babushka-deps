dep 'urxvt.bin' do
	installs 'rxvt-unicode'
end

dep 'urxvt' do
	requires 'urxvt.bin'
end
