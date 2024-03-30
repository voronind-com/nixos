# Bash reference file.

To get help with usage info run:

```text
$ help <COMMAND>

or

$ h <COMMAND>
```

## Android.

Command|Description
---|---
`emulator [NAME]`|Start an Android emulator. Default name is `main`.   

## Archive.

Command|Description
---|---
`archive [DIRS]`|Archive directories. All directories by default. Supports .archiveignore exclude file.   
`archive_mt [DIRS]`|Archive using multiple threads. Uses 75% of free RAM. All directories by default. Supports .archiveignore exclude file.   
`archive_fast [DIRS]`|Archive directories with fast compression. All directories by default. Supports .archiveignore exclude file.   
`archive_check [FILES]`|Check archives integrity. Checks all archives by default.   
`archive_prune [NAME] [VERSIONS]`|Delete old versions of an archive. All archives with 1 version by default.   
`archive_rm [FILES]`|Delete specified or all archive files.   
`archive_xz [FILES]`|Recompress previously created archive_fast with better compression.   
`archive_name [ARCHIVE] [NAME]`|Rename archives. If no name specified, it simplifies archive's name. If no archives specified, apply to all archives.   
`unarchive [HOST:FILES]`|Extract previously created archive with checksum validation. Supports unarchiving exact paths from the remote machines (rsync syntax).   
`archive_touch [FILES]`|Change archive's filesystem time to match creation date.   

## Ask.

Command|Description
---|---
`ask <QUERY>`|Ask general AI.   
`ask_model`|  Specify ask model. 

## Battery.

Command|Description
---|---
`battery_charge`|  Print current battery charge in percents. 
`battery_info`|  Get battery's info. 

## Bootstrap.

Command|Description
---|---
`bootstrap_editorconfig`|  Install Editorconfig file (with tabs) in current directory. 
`bootstrap_editorconfig_space [AMOUNT]`|Install Editorconfig file (with specified spaces, 8 by default) in current directory.   
`bootstrap_nixos <DRIVE> [HOST]`|Install nixos to specified drive. To be run from Live ISO.   

## Brightness.

Command|Description
---|---
`brmin`|  Set display brightness to a minimum. 
`brmax`|  Set display brightness to a maximum. 
`brset [LEVEL]`|Set display brightness in percent, 50% default.   

## Cd.

Command|Description
---|---
`cdd <DIR>`|CD (back to) directory. Goes to the exact-match dir first. If no exact match found, it finds first directory that contains the input (case-insensitive).   

## Checksum.

Command|Description
---|---
`checksum_create [FILES]`|Save file checksums. For file with a name `file` it will create a new file called `.file.sha1` with hash in it. All files by default.   
`checksum_check [FILES]`|Check stored values against actual files. All files by default.   
`checksum`|  Calculate hashes for all files recursively and store in a file called `checksum.sha1`. 

## Chmod.

Command|Description
---|---
`x <FILES>`|Add executable flag to file.   

## Color.

Command|Description
---|---
`color_test`|  Print all available colors with their names colored in corresponding color. 

## Container.

Command|Description
---|---
`ca [NAME]`|Attach/create container box in current directory with specified name. By default uses current dir name.   
`ck [NAME]`|Remove container box with specified name. By default uses current dir name.   
`cka`|  Remove all container boxes. 
`cl`|  List all container boxes. 

## Copypaste.

Command|Description
---|---
`copy`|  Copy stdin to system clipboard. *Example:* `echo hi \| copy`. 
`paste`|  Paste system clipboard to stdout. *Example:* `paste > file.txt`. 

## Cp.

Command|Description
---|---
`rcp <FROM> <TO>`|Replaces default cp with rsync.   
`rcp_merge <FROM> <TO>`|Copy and also merge all changes (delete dst files that do not exist in src).   
`cp_link <FROM> <TO>`|Copy by creating hardlinks. Works for directories, too.   
`rcp_test <FROM> <TO>`|Print output of cp_merge without writing anything.   

## Date.

Command|Description
---|---
`today`|  Print today date in yyyyMMdd format. 
`dow`|  Current day of week number. 

## Dconf.

Command|Description
---|---
`dconf_load`|  Load Gnome settings. 
`dconf_save [FILE]`|Dump Gnome settings into the file. Default name is `gnome.dconf`. Do this before changing settings and after, an then run `diff` to find out what to add to the main `gnome.dconf`.   

## Disk.

Command|Description
---|---
`pdf`|  Show only physical drives info. 
`tdu [DIRS]`|Show total size in SI. Current dir by default.   

## Distrobox.

Command|Description
---|---
`da [BOX]`|Create/Attach to the box. Uses name `main` by default.   

## Docker.

Command|Description
---|---
`docker_volumes <CONTAINER>`|Show container's volumes.   
`docker_health`|  Check if any container exited. 
`docker_ip <CONTAINER>`|Find out container's IP address.   
`docker_update`|  Update all docker images. 
`dc`|  Docker compose shortcut. 
`dcu [SERVICES]`|Docker compose up.   
`dcd [SERVICES]`|Docker compose down.   
`dcp [SERVICES]`|Docker compose pull.   
`dcl [SERVICES]`|Docker compose logs.   
`dcr [SERVICES]`|Docker compose restart.   
`dcs [SERVICES]`|Docker compose stop.   
`dcdu [SERVICES]`|Docker compose down & up specified services.   
`dcpu [SERVICES]`|Docker compose pull & up specified services.   
`dcul [SERVICES]`|Docker compose up & attach to logs for specified services.   

## Dvd.

Command|Description
---|---
`dvd_burn_iso <FILE.iso>`|Burn specified iso file to DVD.   
`cd_burn_iso <FILE.iso>`|Burn specified iso file to CD.   
`cd_burn_audio <FILES.wav>`|Burn specified audio files to CD.   
`dvd_shell`|  Spawn Nix shell with required tools. 

## Ffmpeg.

Command|Description
---|---
`ffmpeg_mux_audio <SOUND> <OUTPUT DIR>`|Mux audio into containers. File names in sound and current dirrectories must match.   
`ffmpeg_mux_cover <FORMAT> <COVER>`|Mux cover into music file.   
`ffmpeg_music_meta <FORMAT>`|Generate music metadata from directory structure. Top dir is the Artist name like this: `The_Beatles`. Next are albums like this: `2010_My_love`. Inside are songs like this: `01_sample.flac`.   

## File.

Command|Description
---|---
`open <FILE>`|Open file/dir in GUI.   
`play [FILE]`|Play media file from CLI. All files by default.   
`play_shuffle [FILE]`|Play media files shuffled from CLI. All files by default.   

## Find.

Command|Description
---|---
`find_ext`|  Find all file extensions. 
`find_module`|  Find all modules. 
`find_function [MODULE]`|Find all module functions. Functions from all modules by default.   

## Fix.

Command|Description
---|---
`fix_ethernet_speed <DEVICE> <SPEED>`|Fix when ethernet mistakenly detects 100 Mb instead of 1000 Mb. SPEED is one of 10/100/1000 etc.   
`fix_files_sftp`|  Fix nautilus after typing wrong sftp password. 
`fix_gradle_lock`|  Delete lost Gradle lock files. 
`fix_gnome_rdp <PASSWORD>`|Fix Gnome's broken RDP ffs.   

## Git.

Command|Description
---|---
`gps`|  Git push. 
`gpsa`|  Git push all (branches). Useful for pushing all stuff to a new remote. 
`gpsf`|  Git force push. 
`gpl`|  Git pull. 
`gl`|  Git log. 
`gs`|  Git status. 
`gst`|  Git stash. 
`gd`|  Git diff. 
`gc`|  Git commit. 
`gch`|  Git checkout. 
`gchb <BRANCH>`|Git checkout branch.   
`gb`|  Git branch. 
`gbd <BRANCH>`|Git branch delete.   
`gbda`|  Git branch delete all except current. 
`gf`|  Git fetch all. 
`gt`|  Git tag. 
`gi`|  Git ignore files. 
`gpc <FILE>`|Git patch create.   
`gp <FILE>`|Git patch (apply).   
`ggc`|  Run git garbage collection. 
`ga [FILES]`|Preview diff while adding. Adds current dir by default.   
`gr [COMMIT COUNT]`|Rebase by X commits or from root. When COUNT is 0 - rebase from root. Default is 2.   
`gu [EMAIL]`|Specify git user as Dmitry Voronin with provided email.   
`gg <REPO>`|Get my git repo.   
`gdc [COMMITHASH]`|See diff for a specific commit. Last commit by default.   
`gv`|  Get version number based on commit count. 
`gw [REMOTE]`|Open the remote web url in default browser.   

## Group.

Command|Description
---|---
`group_ext [FILES]`|Group files by extension.   
`group_year [FILES]`|Group files and dirs by year.   
`group_year_copy <YEAR> [FILES]`|Copy files from current year to the named dir.   

## Help.

Command|Description
---|---
`help <FUNCTION>`|Get help about dotfiles bash function.   
`h <FUNCTION>`|Short for help.   

## Ls.

Command|Description
---|---
`l [DIRS]`|List files in dirs. Current dir by default.   
`ll [DIRS]`|List last modified files first. Current dir by default.   
`lll [DEPTH] [DIRS]`|List files in tree structure. Current dir by default. Depth can be omitted by passing `-` (dash).   
`llll [DIRS]`|List files recursively. Current dir by default.   
`la [DIRS]`|List all files in dirs, incl. hidden files. Current dir by default.   
`lla [DIRS]`|List all files in dirs, incl. hidden files, sorted by mtime. Current dir by default.   

## Markdown.

Command|Description
---|---
`markdown_render <FILE.md>`|Render markdown in browser using Gitea API. Because I want consistency with Gitea web render. Works only inside LAN.   

## Monitor.

Command|Description
---|---
`monon`|  Enable monitors. 
`monoff`|  Disable monitors. 

## Name.

Command|Description
---|---
`name [FILES]`|Rename dirs to `snake_case` and files to `PascalCase`. Careful with structured file names like archives!   
`name_parse <PARSER> [FILES]`|Rename files with provided parser, i.e. `parse_simple`. All files by default.   
`name_hash [FILES]`|Rename all files to their hashes while keeping extensions. All files by default.   
`name_hash_check [FILES]`|Check hashes for previously renamed files. All files by default.   
`name_show [FILES]`|Rename files for Jellyfin shows, i.e. `Episode S01E01.mkv` All files by default.   
`name_manga <SEASON> [FILES]`|Rename files for Kavita manga format. All files by default.   
`name_music [FILES]`|Rename files for ffmpeg_music_meta format. All files by default.   
`name_ext <EXTENSION> [FILES]`|Rename files with new extension. All files by default.   
`name_prefix <OLD> <NEW> [FILES]`|Change file name prefix. All matching files by default.   
`name_postfix <OLD> <NEW> [FILES]`|Change file name postfix. All matching files by default.   
`name_replace <OLD> <NEW> [FILES]`|Replace part of the name. All matching files by default.   
`name_fix_numbering [FILES]`|Fix numbering for numbered files. I.e if there are 10 items and some of them start without zero, then append zero to it. 1..10 -> 01..10.   

## Network.

Command|Description
---|---
`bluetooth`|  Open bluetooth control panel. 
`network`|  Open network control panel. 
`nms`|  Show active connections. 
`nu <CONNECTION>`|Start the connection.   
`nd <CONNECTION>`|Stop the connection.   

## Nix.

Command|Description
---|---
`nixos_rebuild [HOSTNAME]`|Rebuild system. Optionally force the hostname.   
`nixos_switch [HOSTNAME]`|Rebuild and switch system. Optionally force the hostname.   
`nix_shell [NAME]`|Spawn shell with specified nix environment. Uses flake.nix in current dir by default.   
`nix_tmpshell <PACKAGES>`|Spawn temporary nix-shell with specified packages.   
`nixos_live`|  Build live image. 
`nixos_generations`|  List nixos generations. 
`nixdroid_switch`|  Switch nix-on-droid. 

## Notify.

Command|Description
---|---
`notify <MESSAGE>`|Send Telegram notification.   
`notify_silent <MESSAGE>`|Send silent Telegram notification.   

## Own.

Command|Description
---|---
`own [USER] [FILES]`|Change file ownership to specified user id and restrict access to him. Root user by default. This directory recursively by default.   

## Pack.

Command|Description
---|---
`pack <TARGET.ext> [FILES]`|Pack files into desired format. All files and directories by default.   
`unpack [FILES]`|Attempt to unpack. All supported formats by default.   

## Parse.

Command|Description
---|---
`parse_simple <STRING>`|Parse data and output simplified format.   
`parse_pascal <STRING>`|Parse to PascalCase.   
`parse_snake <STRING>`|Parse to snake_case.   
`parse_kebab <STRING>`|Parse to kebab-case.   
`parse_camel <STRING>`|Parse to camelCase.   
`parse_snake_uppercase <STRING>`|Parse to SNAKE_CASE_UPPERCASE. **NOT STABLE! Repeating results in different output.**   
`parse_alnum <STRING>`|Parse data keeping only alphanumeric characters.   
`parse_ints <STRING>`|Parse integers from mixed string.   
`parse_lowercase <STRING>`|Parse string to lowercase.   
`parse_uppercase <STRING>`|Parse string to uppercase.   
`parse_titlecase <STRING>`|Parse string to title case.   
`parse_sentencecase <STRING>`|Parse string to sentence case.   
`parse_startcase <STRING>`|Parse string to start case.   
`parse_json <STRING>`|Parse string to pretty Json.   

## Permission.

Command|Description
---|---
`perm_share`|  Recursively change permissions to allow read sharing with group and others. 
`perm`|  Recursively change permissions to restrict access for group and others. 

## Power.

Command|Description
---|---
`slp`|  Suspend system. 
`bye`|  Poweroff. 

## Prune.

Command|Description
---|---
`prune_docker`|  Prune everything unused in docker. 
`prune_nix`|  Prune Nix Store. 
`prune_flatpak`|  Uninstall flatpaks not listed in the config. 

## Ps.

Command|Description
---|---
`fps [PROCESS]`|Find process and filter.   

## Random.

Command|Description
---|---
`random_file`|  Picks a random file or directory. 

## Recursive.

Command|Description
---|---
`recursive <COMMAND>`|Run something recursively over all directories.   
`recursive1 <COMMAND>`|Run something recursively over directories of 1 depth (excluding current dir).   

## Save.

Command|Description
---|---
`save [TARGETS]`|Backup a game save.   

## Sound.

Command|Description
---|---
`sound`|  Open a sound control panel. 

## Ssh.

Command|Description
---|---
`ssh_mount <REMOTE> <LOCAL>`|Mount FS over ssh. Just extra config for sshfs.   
`ssh_keygen`|  Generate private an public keys on a local host and print a public key. 

## Steam.

Command|Description
---|---
`steam_link`|  Start Steam with Wayland screen share for Link to work. 

## Su.

Command|Description
---|---
`s [USER]`|Su shortcut for lazy me. Root by default.   
`sudo <COMMAND>`|Run something as root. Runs command as a current user if su is not available.   

## Terminal.

Command|Description
---|---
`tsize`|  Get terminal size. 

## Tmp.

Command|Description
---|---
`tmp`|  CD into host's primary tmp dir. 

## Tmux.

Command|Description
---|---
`ta [NAME]`|Create/attach to named session. By default uses current dir name.   
`td`|  Detach from running session. 
`tda`|  Detach all other tmux clients. 
`tl`|  List running sessions. 
`tns [NAME]`|Assign name to session. Uses current dir name by default.   
`tnw [NAME]`|Assign name to window. Uses current dir name by default.   
`tk [NAME]`|Kill specified session. By default uses current dir name.   
`tka`|  Kill all sessions. 

## Todo.

Command|Description
---|---
`todo`|  Open `~/.todo.md` file. 

## Transcode.

Command|Description
---|---
`transcode <FORMAT> [FILES]`|Convert between different formats. By default tries to convert all files.   

## Try.

Command|Description
---|---
`try <COMMAND>`|Retry command every 2 sec until it completes successfully.   

## Vdl.

Command|Description
---|---
`vdl [LINK]`|Download video from URL. When no `[LINK]` specified, it tries to update previously downloaded link.   
`vdl_vk <LINK>`|Temporary fix for vk downloads.   
`vdl_file <FILE>`|Download all videos from file with links.   

## Vi.

Command|Description
---|---
`v`|  Neovim shortcut. 

## Vrr.

Command|Description
---|---
`vrron`|  Enable VRR. 
`vrroff`|  Disable VRR. 

## Watch.

Command|Description
---|---
`w <COMMAND>`|Watch command output with 2 seconds interval.   
`ww <COMMAND>`|Watch command output with minimal interval.   

