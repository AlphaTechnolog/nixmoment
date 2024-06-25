# Nixmoment

## [Aether Shell](https://github.com/alphatechnolog/aether-shell) version
![banner-aether.png](./assets/banner-aether.png)

## Hyprland version
![banner-hypr.png](./assets/banner-hypr.png)

> Aether is the main desktop while the hypr version is an alternative desktop provided

> [!NOTE]
> The hyprland version is still in development, and shell elements such as the bar, etc, won't load since they're being done with ags and config have not been provided yet.

Here's my effort to keep myself on nixos while having a comfy workstation.

The objectives of this config is to get myself in an environment that
contains all the bloatware i need, installed and managed in a declarative way.

## Installation

This config comes with a special file, config.nix, located at `<root>/config.nix` which specifies a little
bit of ~~tracking~~ information about you, such as your username, your ofc secure password, etc. These are used to be able to primarily, change the username without dying in the attempt, thing is that it doesn't only works for the username but also works for the hostname, timezone, and some little specific values about each user.

so keep an eye on it, the defaults should work, but will setup my username, hostname, etc.

### Formatting the disks

You can use xfs if you want, it's my fav so imma put instructions here, but it shouldn't matter if you use btrfs or whatever else.

```sh
mkfs.xfs -f /dev/sda2 -L NIXOSROOT
mkfs.fat -F /dev/sda1 -n NIXOSBOOT

mount /dev/disk/by-label/NIXOSROOT /mnt/
mount /dev/disk/by-label/NIXOSBOOT /mnt/efi --mkdir
```

> Yes efi folder is at /efi since i like it to be there, if you wanna change the path, checkout [boot.nix](../crazy/core/boot.nix)

### Getting started

So now you can start cloning the config and generating the hardware configuration files, example:

```sh
mkdir -pv /mnt/home/<yourusernamehere>/

# installs git and git lfs temporarily
nix-shell -p git{,-lfs}

# yes it's called .crazy (cuz I liked it)
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

> [!NOTE]
> You may need to run `git add -A` before rebuilding to make nix recognise changes

You can change the colorscheme of some apps (it will mostly change aether shell colors, and alacrity colors), also change your hostname, username, etc

## Building the system

When everything is done, just issue

```sh
nixos-install --root /mnt --flake '.#crazy'
```

> Report if you get some errors, cuz i might have forgotten some step lmao

Then just reboot into the system. Please note that another rebuild may be needed if you want it to recognise your windows installation or something, at least that's what happened to me.

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
