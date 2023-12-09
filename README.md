# Pyrite Studio

Pyrite Studio is a built-for-purpose music production studio in an Arch Linux based OCI, powered by Distrobox!  Currently a WIP.

# Usage

```
distrobox-create --image ghcr.io/messaiga/pyrite-studio:latest --name pyrite-studio -Y
```
For accessing the software from the application menu, you'll want to export the bundled applications to your host OS using:
```
distrobox-enter -n pyrite-studio -- '  distrobox-export --app ardour8'
distrobox-enter -n pyrite-studio -- '  distrobox-export --app audacity'
distrobox-enter -n pyrite-studio -- '  distrobox-export --app carla'
distrobox-enter -n pyrite-studio -- '  distrobox-export --app pipecontrol'
distrobox-enter -n pyrite-studio -- '  distrobox-export --app qpwgraph'
distrobox-enter -n pyrite-studio -- '  distrobox-export --app raysession'
```
