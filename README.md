cf-exe-buildpack
================

Cloud Foundry build pack for Windows executables.

The app requires a `run.bat` file to be detected and it uses that file as the default start command. The run command can be overridden with an extra `Procfile` file or the `-c` argument from the cf cli.

Example usage:
--------------

Pushing the sample app:
```
cd sample-app/

cf push pshttp  -s win2012r2  -m 256M  -b https://github.com/hpcloud/cf-exe-buildpack
```

Pushing a ping app:

```
mkdir ping-app
cd ping-app
echo ping  -t  8.8.8.8  >  run.bat

cf push ping-app  --no-route  --no-start  -s win2012r2  -m 256M  -b https://github.com/hpcloud/cf-exe-buildpack
cf set-health-check ping-app none
cf start ping-app

cf logs ping-app --recent
```

