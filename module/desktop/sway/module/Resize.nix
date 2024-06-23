{ ... }: let
	stepVertical   = 10;
	stepHorizontal = 10;
in {
	text = ''
		bindsym $mod+j resize grow   height ${toString stepVertical}px
		bindsym $mod+k resize shrink height ${toString stepVertical}px
		bindsym $mod+h resize shrink width  ${toString stepHorizontal}px
		bindsym $mod+l resize grow   width  ${toString stepHorizontal}px
	'';
}
