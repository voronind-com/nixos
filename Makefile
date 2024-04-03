options = --option eval-cache false
flake   = .

.PHONY: boot
boot: check
	nixos-rebuild boot $(options) --flake $(flake)

.PHONY: reboot
reboot: boot
	reboot

.PHONY: switch
switch: check
	nixos-rebuild switch $(options) --flake $(flake)

.PHONY: trace
trace: check
	nixos-rebuild boot $(options) --show-trace --flake $(flake)

.PHONY: update
update:
	nix flake update

.PHONY: live
live: check
	nix build $(options) $(flake)#nixosConfigurations.live.config.system.build.isoImage

.PHONY: android
android:
	nix-on-droid switch --flake $(flake)

.PHONY: check
check:
	nix flake check

.PHONY: show
show:
	nix flake show
