# Voronind NixOS configuration.

## Screenshot.

![Screenshot](https://i.imgur.com/aGmmVJa.png)

[Wallpaper link](https://git.voronind.com/voronind/nixos/src/commit/97559710c57f81e42a32b11139d6d4c3dff20ab3/part/Wallpaper.nix#L2)

## What is NixOS?

NixOS allows you to manage your systems declaratively. Which means that nothing happens outside the centralized config. System handles all the mutations when your config changes - even without reboot!

The core of the system is a thing called Nixpkgs. Nix is not your regular package manager. Smart people simplified all the complicated installation and configuration to a single generalized way of writing configuration.

This repository uses flakes for configuration. I really recomend you to start with flakes and skip channels entirely. Flakes give you one killer feature called version locking. This means that unless you update your .lock file, you'll have all the same binary versions across all the hosts. This makes thing very consistent across all your hosts. And it allows for easy rollback just by dropping .lock file update commit.

NixOS also scales well. You can have a single configuration file just for your host locally. Or, like me, you can have an online repository for any amount of hosts. All my hosts pull changes every hour from this repo. They are *not* all running the same configuration, which is a very common misconception. Here I have a bunch of "modules" like Bash, Gnome, Sway, Gaming etc. For example, I want to do heavy gaming on my desktop, so I enable Gnome+Gaming. But my laptop has *smol (kitten sized)* RAM and I go with just Sway and no Gaming :sad:.

For power users it has a heck load of goodies! For example, if you have a home server or just a powerful machine, you can use it as a cache and/or a build server. In my setup it works like this: when any of my hosts updates, builds any development shell or temporarily loads any package - it caches everything on my home lab. This means that after each flake lock update (package versions) I download everything over the Internet only once - other local hosts pull from my homelab over the fast local connection. Also if I need to build a heavy development environment i.e. for Android project - it will be built once, cached the result on homelab and then other hosts will pull the prebuild environment. You can also create Live ISO installations from your config, run in impermanence mode and so much more!

Outside of NixOS you also get things like Dev Shells. They allow you to create reproducible environments per project. This means you can run `nix develop` on any host with Nix package manager (not limited to NixOS) and have *exact* environment. By only typing two words. This creates a consistent environment, which practically destroys *"it works on my machine!"* arguments. This said, you may actually start in softcore mode: by utilizing Nix package manager and Home Manager. They do not require NixOS and can help you get aquainted with Nix ecosystem. But if it's just so happens that you distrohop now - spin it up! Learning the Nix language may be daunting, but in the long run it will save you so much time - in shipping updates, 

The project started way back in 2003 and is rock solid by now.  
And no, this is by far *not* the same thing as Ansible and Docker.

## NixOS learning roadmap.

0. [Nix Pills](https://nixos.org/guides/nix-pills/). This is a bit controversial one. Try it, but if it's hard to read for you - just skip it for now.

??? Where to look for stuff.  
??? Nix language.  
??? Nix package manager.  
??? Nixpkgs.  
??? Home manager.  

??? (Optional) Remote builders.  
??? (Optional) Live ISO.  
??? (Optional) Dev Shells.  
??? (Optional) Impermanence.  

## Discovering my configuration.

Even tho I've tried to document everything I can in a dum-dum way, I still highly recommend you to learn the very basics of Nix language. If you can give a basic answer to these questions, you may continue:

1. What a set is?
2. How to define a function?
3. *???*

Start from the [Flake](flake.nix) file and follow the comments. If you have any questions, get in touch using [Telegram](https://t.me/voronind_com) or [Email](mailto:hi@voronind.com).

## Configuration highlights.

* [Keyd](module/common/Keyd.nix) allows you to have QMK-like keyboard remaps. Killer-feature is the ability to have remaps per-application. I have pretty common remaps like CapsLock to Ctrl/Esc combo, Right Shift to Backspace, Backspace to Delete and overlays for System/Windows/Media/Application controls as well as Macros.
