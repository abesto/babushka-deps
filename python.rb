dep 'python' do
  requires 'python.bin', 'python2.bin',
           'python-virtualenv.bin', 'python2-virtualenv.bin'
end

dep 'python.bin'
dep 'python2.bin'
dep 'python-virtualenv.bin' do
  provides 'virtualenv'
end
dep 'python2-virtualenv.bin' do
  provides 'virtualenv2'
end
