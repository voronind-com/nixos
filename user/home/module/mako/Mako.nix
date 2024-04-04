{ style, ... }: {
	config = ''anchor=top-center
default-timeout=5000
font=${style.font.serif.name} ${toString(style.font.size.popup)}
background-color=#${style.color.bg}
border-color=#${style.color.bg}
text-color=#${style.color.fg}
height=120
icons=0
margin=32
width=480'';
}
