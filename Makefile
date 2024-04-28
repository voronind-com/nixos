options = --option eval-cache false
flake   = .

.PHONY: boot
boot: check
	nixos-rebuild boot $(options) --flake $(flake)

.PHONY: reboot
reboot: boot
	reboot

.PHONY: switch
switch:
	nixos-rebuild switch $(options) --flake $(flake)

.PHONY: update
update:
	nix flake update

.PHONY: live
live: check verify
	nix build -o live $(options) $(flake)#nixosConfigurations.live.config.system.build.isoImage

.PHONY: android
android: verify
	nix-on-droid switch --flake $(flake)

.PHONY: check
check:
	nix flake check

.PHONY: trace
trace:
	nix flake check --show-trace

.PHONY: show
show:
	nix flake show

.PHONY: verify
verify:
	git verify-commit HEAD
