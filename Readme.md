# Voronind NixOS configuration.

## Screenshots.

<details>
<summary>Screenshot 1</summary>
<img src="https://i.imgur.com/aGmmVJa.png" />
<a href="https://r4.wallpaperflare.com/wallpaper/500/198/463/pixel-art-digital-art-pixelated-pixels-wallpaper-b980f83df17add4b2677d8cf6091268d.jpg">Wallpaper link</a>
</details>

<details>
<summary>Screenshot 2</summary>
<img src="https://i.imgur.com/7XMd58c.jpeg" />
<a href="https://pixeldrain.com/api/file/ppeeEr4d">Wallpaper link</a>
</details>

<details>
<summary>Screenshot 3</summary>
<img src="https://i.imgur.com/67nW8XT.jpeg" />
<a href="https://i.imgur.com/H943DFl.jpeg">Wallpaper link</a>
</details>

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

## Keyboard layouts.

Yellow are modifier keys, they toggle layers when pressed. Green ones are just modified keys.

<details>
<summary>Default</summary>
<img src="https://i.imgur.com/MBb23eB.png" />
</details>

<details>
<summary>Alternative Keys</summary>
<img src="https://i.imgur.com/X9CGhLb.png" />
</details>

<details>
<summary>WM keys</summary>
Sway:
<img src="https://i.imgur.com/rr9OZ64.png" />
Gnome:
<img src="https://i.imgur.com/TrqC5jt.png" />
</details>

<details>
<summary>Per-application controls</summary>
Firefox:
<img src="https://i.imgur.com/GI0apoV.png" />
Jetbrains:
<img src="https://i.imgur.com/scijaJI.png" />
Tmux:
<img src="https://i.imgur.com/Soo85vk.png" />
</details>

<details>
<summary>Extra numbers</summary>
<img src="https://i.imgur.com/PW5eGSF.png" />
</details>

<details>
<summary>Media Controls</summary>
<img src="https://i.imgur.com/p9trGMi.png" />
</details>

<details>
<summary>System controls (Sway)</summary>
<img src="https://i.imgur.com/rBFA2Xu.png" />
</details>


