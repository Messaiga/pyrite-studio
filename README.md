# Pyrite Studio

Pyrite Studio is a built-for-purpose music production studio in an Arch Linux based OCI, powered by Distrobox!  Currently a WIP.

# Usage

```
distrobox-create --image ghcr.io/messaiga/pyrite-studio:latest --name pyrite-studio -Y
```

For accessing the software from the application menu, you'll want to export the bundled applications to your host OS using:
```
distrobox-enter -n pyrite-studio -- '  distrobox-export --app ardour8'
distrobox-enter -n pyrite-studio -- '  distrobox-export --app carla'
distrobox-enter -n pyrite-studio -- '  distrobox-export --app pipecontrol'
distrobox-enter -n pyrite-studio -- '  distrobox-export --app qpwgraph'
distrobox-enter -n pyrite-studio -- '  distrobox-export --app raysession'
```

# RaySession

RaySession relies on OSC (Open Sound Control), which relies on the localhost address to communicate between programs properly.  We need to add our container to our list of loopback addresses.  

-----

1. After the image has downloaded, `distrobox-enter pyrite-studio` and run `hostname`.

2. Take the output of `hostname` and append it to the first loopback entry of /etc/hosts

Before: `127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4`

After: `127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4 [output of step 1]`

And you're done!

The goal is to automate this part of the setup in the future, but for now this is required.
