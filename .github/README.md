# Nixmoment

## Aether shell version
![banner-aether.png](./assets/banner-aether.png)

## Plasma version
![banner.png](./assets/banner.png)

> Aether is the new environment based in awm im ~~slowly~~ making

Here's my effort to keep myself on nixos while having a comfy workstation.

The objectives of this config is to get myself in an environment that
contains all the software i need and that installs all the bloatware i need
in a declarative way.

## Installation

This config comes with some special file such as `<root>/config.nix` which specifies a little
bit of ~~tracking~~ information about you, such as your username, your ofc secure password, etc.

so keep an eye of it if you want, the defaults should work, but will setup my username.

### Formatting the disks

you can use xfs if you want, it's my fav so imma put instructions here, but it shouldn't matter
if you use btrfs or whatever else.

```sh
mkfs.xfs -f /dev/sda2 -L NIXOSROOT
mkfs.fat -F /dev/sda1 -n NIXOSBOOT

mount /dev/disk/by-label/NIXOSROOT /mnt/
mount /dev/disk/by-label/NIXOSBOOT /mnt/efi --mkdir
```

> Yes efi folder is at /efi since i like it to be there, if you wanna change the path, checkout [boot.nix](../crazy/core/boot.nix)

### Configuring the config XD

So now you can start cloning the config and generating the hardware configuration files, example:

```sh
mkdir -pv /mnt/home/<yourusernamehere>/

# installs git and git lfs temporarily
nix-shell -p git{,-lfs}

# yes it's .crazy
git clone https://github.com/alphatechnolog/nixmoment.git --recurse-submodules /mnt/home/<yourusernamehere>/.crazy

# !$ means the path
cd !$

# download some huge files
git lfs install
git lfs pull
```

So now you can generate the hardware info

```sh
nixos-generate-config --root /mnt --show-hardware-config > misc/hardware-configuration.nix
```

Then adjust your config.nix as your liking

```sh
nix-shell -p vim --run 'vim config.nix'
```

You can change the colorscheme of some apps (it will mostly change aether shell colors when done), and change your hostname, username, etc

## Building the system

When everything is done, just issue

```sh
nixos-install --root /mnt --flake '.#crazy'
```

> Report if you get some errors, cuz i could have forgotten some step lmao

Then just reboot on your system, another rebuild may be needed if you want it to recognise your windows installation or something.
At least that happened to me.

> [!TIP]
> You may have to, first, enter KDE Plasma environment, and from there, run
> `sudo systemctl restart home-manager-<Username-Here>.service`, so it starts cloning aether shell!
> This may be needed only the first time you start the system.

## What's next?

Welp, docs about how the config works and how to use it as a "get started" to NixOS, is
a WIP, and i'm still preparing it... thing is you could try checking for config files
in order to add your own packages, learn about overlays, etc. In this config, i've already
created files for every of those things (suited to my needs but still trying to organize them all).

> [!TIP]
> This setup uses [nh](https://github.com/viperML/nh) to build the nix config.
> So you can just use `nh os switch` in any cwd, and it will look for
> `/home/<user>/.<hostname>` in order to start building the config!
