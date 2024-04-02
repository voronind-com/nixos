{ config, ... }: {
	config = ''anchor=top-center
default-timeout=5000
font=${config.stylix.fonts.serif.name} ${toString(config.stylix.fonts.sizes.popups)}
background-color=#${config.lib.stylix.colors.base01}
border-color=#${config.lib.stylix.colors.base01}
text-color=#${config.lib.stylix.colors.base05}
height=120
icons=0
margin=32
width=480'';
}
