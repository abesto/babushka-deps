## DEPRECATED

It looks like babushka development has been dead for a while. Content in this repo has been migrated to https://github.com/abesto/chef-devenv

---

Prereqs: base 64-bit ArchLinux install with working network. Currently has VirtualBox-guest-specific features, might get smarter over time.

Run as root:

```sh
sh -c "`curl https://babushka.me/up`"  # or otherwise, from https://babushka.me/installing
babushka 'abesto:as root'
passwd abesto
su - abesto
# Manually add SSH key
babushka abesto:all
```
