# Voronind NixOS configuration.

## Screenshots.

![Screenshot1](https://i.imgur.com/aGmmVJa.png)

![Screenshot2](https://i.imgur.com/7XMd58c.jpeg)

[Wallpaper from the Screenshot 1](https://git.voronind.com/voronind/nixos/src/commit/97559710c57f81e42a32b11139d6d4c3dff20ab3/part/Wallpaper.nix#L2), [Wallpaper from the Screenshot 2](https://git.voronind.com/voronind/nixos/src/commit/8857f1169df4b7e12fd84b10c60ae3fcd7bf0551/part/Wallpaper.nix#L2).

[My current wallpaper](https://git.voronind.com/voronind/nixos/src/branch/main/part/Wallpaper.nix#L2)

Color theming based on wallpaper thanks to [Stylix](https://github.com/danth/stylix).

## WIP: NixOS learning roadmap.

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

## WIP: Discovering my configuration.

Even tho I've tried to document everything I can in a dum-dum way, I still highly recommend you to learn the very basics of Nix language. If you can give a basic answer to these questions, you may continue:

1. What a set is?
2. How to define a function?
3. *???*

Start from the [Flake](flake.nix) file and follow the comments. If you have any questions, get in touch using [Telegram](https://t.me/voronind_com) or [Email](mailto:hi@voronind.com).

## WIP: Configuration highlights.

* [Keyd](module/common/Keyd.nix) allows you to have QMK-like keyboard remaps. Killer-feature is the ability to have remaps per-application. I have pretty common remaps like CapsLock to Ctrl/Esc combo, Right Shift to Backspace, Backspace to Delete and overlays for System/Windows/Media/Application controls as well as Macros.
