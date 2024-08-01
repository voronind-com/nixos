{ ... }: {
	# HACK: Remove sometime later.
	nixpkgs.overlays = [ (final: prev: {
		changedetection-io = prev.changedetection-io.overrideAttrs (old: {
			doCheck = false;
		});
	})];
}
