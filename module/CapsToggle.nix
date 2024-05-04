# Toggle language with CapsLock. My wife prefers this.
{ lib, ... }: {
	services.xserver.xkb = {
		options = lib.mkForce "grp:caps_toggle";
	};
}
