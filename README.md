Prereqs: base 64-bit ArchLinux install with working network. Then run, as root:

```sh
sh -c "`curl https://babushka.me/up`"  # or otherwise, from https://babushka.me/installing
babushka 'abesto:as root'
passwd abesto
su - abesto
# Manually add SSH key
babushka abesto:all
```
