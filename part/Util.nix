{ pkgs, ... }: rec {
	# Remove tabs indentation,
	trimTabs = text: let
		shouldStripTab = lines: builtins.all (line: (line == "") || (pkgs.lib.strings.hasPrefix "	" line)) lines;
		stripTab       = lines: builtins.map (line: pkgs.lib.strings.removePrefix "	" line) lines;
		stripTabs      = lines: if (shouldStripTab lines) then (stripTabs (stripTab lines)) else lines;
	in
		builtins.concatStringsSep "\n" (stripTabs (pkgs.lib.strings.splitString "\n" text));

	# List all files in a dir.
	ls = path: map (f: "${path}/${f}") (builtins.attrNames (builtins.readDir path));

	# Concat all files by `text` key.
	catText = files: args: builtins.foldl' (acc: mod:
		acc + trimTabs ((import mod args).text)
	) "" files;
}
