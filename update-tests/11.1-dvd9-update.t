repo @System 0 testtags 11.1-dvd9-system.repo.gz

repo factory 0 solv ../trees/openSUSE:@PROJ@-standard-x86_64.solv
repo nonoss 0 solv ../trees/openSUSE:@PROJ@:NonFree-standard-x86_64.solv

system x86_64 rpm @System

namespace namespace:language(de_DE) @SYSTEM
namespace namespace:language(de) @SYSTEM

# DROPS
job erase name syslog-ng

job distupgrade all packages
