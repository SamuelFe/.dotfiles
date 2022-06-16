#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/grayblocks/colors.ini"
RFILE="$HOME/.config/polybar/grayblocks/scripts/rofi/colors.rasi"

# Change colors
change_color() {
	# polybar
    sed -i -e "s/background = #.*/background = $BG/g" $PFILE
	sed -i -e "s/background-alt = #.*/background-alt = $BGA/g" $PFILE
	sed -i -e "s/foreground = #.*/foreground = $FG/g" $PFILE
	sed -i -e "s/foreground-alt = #.*/foreground-alt = $FGA/g" $PFILE
	sed -i -e "s/primary = #.*/primary = $AC/g" $PFILE
	sed -i -e 's/red = #.*/red = #B71C1C/g' $PFILE
	sed -i -e 's/yellow = #.*/yellow = #F57F17/g' $PFILE
	sed -i -e "s/shade1 = #.*/shade1 = $SH1/g" $PFILE
	sed -i -e "s/shade2 = #.*/shade2 = $SH2/g" $PFILE
	sed -i -e "s/shade3 = #.*/shade3 = $SH3/g" $PFILE
	sed -i -e "s/shade4 = #.*/shade4 = $SH4/g" $PFILE
	sed -i -e "s/shade5 = #.*/shade5 = $SH5/g" $PFILE
	sed -i -e "s/shade6 = #.*/shade6 = $SH6/g" $PFILE
	sed -i -e "s/shade7 = #.*/shade7 = $SH7/g" $PFILE
	sed -i -e "s/shade8 = #.*/shade8 = $SH8/g" $PFILE
	

	# rofi
	cat > $RFILE <<- EOF
	/* colors */

	* {
	  al:   #00000000;
	  bg:   ${BG}FF;
	  bga:  ${BGA}FF;
	  fga:  ${FGA}FF;
	  fg:   ${FG}FF;
	  ac:   ${AC}FF;

	  bg1:   ${SH2}FF;
	  bg2:   ${SH3}FF;
	  bg3:   ${SH4}FF;
	  bg4:   ${SH5}FF;
	}
	EOF
}

# Main
if [ -f "/usr/bin/wal" ]; then
	# Source the pywal color file
	. "$HOME/.cache/wal/colors.sh"



    BG=`printf "%s\n" "$background"`
	BGA=`printf "%s\n" "$color2"`
	FG=`printf "%s\n" "$foreground"`
	FGA=`printf "%s\n" "$color8"`
	AC=`printf "%s\n" "$color1"`
	SH1=`printf "%s\n" "$color1"`
	SH2=`printf "%s\n" "$color2"`
	SH3=`printf "%s\n" "$color1"`
	SH4=`printf "%s\n" "$color2"`
	SH5=`printf "%s\n" "$color1"`
	SH6=`printf "%s\n" "$color2"`
	SH7=`printf "%s\n" "$color1"`
	SH8=`printf "%s\n" "$color7"`


	change_color
else
	echo "[!] 'pywal' is not installed."
fi
