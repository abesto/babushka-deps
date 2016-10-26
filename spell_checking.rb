dep 'hunspell.bin'
dep 'hunspell-en.lib'

dep 'spell checking' do
	requires 'hunspell.bin', 'hunspell-en.lib'
end
