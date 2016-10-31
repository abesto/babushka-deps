dep 'yubikey' do
  requires 'yubioath-desktop.pip', 'pcsc'
end

# The AUR package for yubioath is borken, let's install from pip instead
dep 'yubioath-desktop.pip' do
  installs 'yubioath-desktop[cli]'
  met? { pkg_manager.has? 'yubioath-desktop' }
  requires 'swig.bin', 'yubikey-personalization-git.aur'
end

dep 'swig.bin'
dep 'yubikey-personalization-git.aur'

# To make the yubikey visible
dep 'pcsc' do
  requires 'pcsc-tools.lib', 'ccid.lib', 'libusb-compat.lib',
           'systemctl enable'.with(:service => 'pcscd')
end
dep 'pcsc-tools.lib'
dep 'ccid.lib'
dep 'libusb-compat.lib'
