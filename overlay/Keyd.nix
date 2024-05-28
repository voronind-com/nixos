# Add a patch for https://github.com/rvaiya/keyd/pull/545
{ ... }: {
	nixpkgs.overlays = [ (final: prev: {
		keyd = prev.keyd.overrideAttrs (old: {
			patches = (old.patches or []) ++ [(prev.fetchpatch {
				url   = "https://patch-diff.githubusercontent.com/raw/rvaiya/keyd/pull/545.patch";
				hash  = "sha256-aal8oAXws6DcpeCl7G9GMJQXeLDDbyotWFut0Rf82WI=";
			})];
		});
	})];
}
