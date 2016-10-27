dep 'user exists', :username do
  met? {
    '/etc/passwd'.p.grep(/#{username}:/).tap { |result|
      log "#{username} is #{result ? '' : 'not '}in /etc/passwd"
    }
  }
  meet {
    sudo "useradd -m -s /bin/bash -G wheel #{username}"
    sudo "chmod 701 /home/#{username}"
    log "Created user #{username}"
  }
end

dep 'abesto user' do
  requires 'user exists'.with(:username => 'abesto')
end
