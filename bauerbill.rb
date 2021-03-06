dep 'bauerbill.bin' do
  requires 'base-devel.bin',
           'arch repo'.with(
             :repo_name => 'xyne-x86_64',
             :server => 'http://xyne.archlinux.ca/repos/xyne')
end

meta :aur do
  accepts_block_for :pre_build
  accepts_block_for :post_build

  template {
    requires 'jq.bin', 'bauerbill.bin'
    package = File.basename(name, '.aur')
    met? {
      /^#{package}/.match(shell("bauerbill -Q #{package}")).tap { |result|
        log "system #{result ? 'has' : 'does not have'} AUR package #{package}"
      }
    }
    meet {
      log_shell "Installing AUR package #{package}", """
      tmpdir=$(mktemp -d) && \
      cd $tmpdir && \
      cat /etc/bauerbill/bauerbill.json | jq '.[\"makepkg commands\"].build.default += [\"--noconfirm\"]' > ./bauerbill.json && \
      bauerbill --aur -S #{package} --bb-config ./bauerbill.json && \
      yes P | ./build/download.sh && \
      #{invoke :pre_build} && \
      yes P | ./build/build.sh && \
      #{invoke :post_build} && \
      cd - && \
      rm -rf $tmpdir
      """
    }
  }
end

dep 'jq.bin'
dep 'base-devel.bin' do
  provides %w[gcc g++ make ld autoconf automake libtoolize]
end
