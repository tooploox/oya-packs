# Inno Setup pack

Innosetup pack allows you to build windows installer for your tools.
We use InnoSetup executed with wine in docker container.
Pack Requires that you already have windows binnaries in your project dir.
It uses [InnoSetup](http://www.jrsoftware.org/isinfo.php). 
It requires `docker`.

## Usage

Let say we have a project.

```
.
....
└── dist
    ├── binary.exe
    └── binary32.exe
```

    $ oya init WindowsCliTool
    $ oya import github.com/tooploox/oya-packs/innosetup
    $ oya run innosetup.prepare
    
Set correct `Values` for innosetup pack. Espacially thouse starting with `app`.

    $ oya run innosetup.renderSetupFiles
    $ oya run innosetup.compile
    $ oya run innosetup.sign
    
## Values

In your project Oyafile set correct values for setup.

```
Values:
  innosetup:
    appId: 'C06341D8-9A5F-47C9-823C-4A336C83EC7F' # Windows UUID
    appVer: 'v0.0.1'               # App Ver
    appName: 'WindowsCliTool'      # App name
    appPublisher: 'Oya.sh'         # App publisher
    appUrl: 'https://example.com/' # Your page
    appBin64:                      # List of files for 64bit systems - REQUIRED
      - 'dist/binary.exe'    
    appBin32:                      # List of files for 32bit systems - REQUIRED
      - 'dist/binary32.exe'
    
    outputPath: 'dist/'        # Path for installer binnary
    outputFile: 'installer'    # Installer name `installer.exe`
    setupFilesPath: 'setup/'   # Setup files path
    
    certFile: 'cert/setup.cert' # Cert file for sign task
    keyFile: 'cert/setup.key'   # Key file for sign task
    dockerImageName: 'oya_innosetup' # docker image name for innosetup
    dockerVolPath: '/project'   # docker volumen name
```

### Tasks

- prepare
- renderSetupFiles
- compile
- sign

#### Prepare

We use docker + wine to run InnoSetup. Prepare tasks builds docker image with Inno Setup

    $ oya run innosetup.prepare

#### RenderSetupFiles

Each time you change a Values for innosetup you should rerender your setup files.

    $ oya run innosetup.renderSetupFiles

#### compile

Compiles installer from config files.

    $ oya run innosetup.compile


#### sign

Sign installer files. It requires `certFile` and `keyFile` values to be set to correct files.

    $ oya run innosetup.sign
