{ pkgs, ... }: {
	file = (pkgs.formats.toml {}).generate "YaziKeymapConfig" {};
}
