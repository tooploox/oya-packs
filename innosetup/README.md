# Inno Setup pack

Innosetup pack allows you to build windows installer for your project.
It uses [InnoSetup](http://www.jrsoftware.org/isinfo.php). 
It requires `docker`.

## Import

    $ oya import github.com/tooploox/oya-packs/innosetup
    
### Tasks

- build
- sign
- gui


#### build
Build installer

    $ oya run innosetup.build

- projectName
- projectWebsite
- binPath
- distPath
- setupFile

#### sign
Sign installer files.

    $ oya run innosetup.sign

- certs

#### gui
Run innosetup GUI. It allows you to create and test custom setupFiles

    $ oya run innosetup.gui
