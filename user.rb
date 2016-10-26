dep 'user exists', :username do
  met? { '/etc/passwd'.p.grep(/#{username}:/) }
  meet {
    sudo "useradd -m -s /bin/bash -G wheel #{username}"
    sudo "chmod 701 /home/#{username}"
  }
end

dep 'abesto user' do
  requires 'user exists'.with(:username => 'abesto')
end
