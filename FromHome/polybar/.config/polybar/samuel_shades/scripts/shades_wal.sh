#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/samuel_shades/colors.ini"
RFILE="$HOME/.config/polybar/samuel_shades/scripts/rofi/colors.rasi"

hex2rgb(){
    if (( $counter < 1)); then
        hexinput=`echo $1 | tr '[:lower:]' '[:upper:]'`  # uppercase-ing
        a=`echo $hexinput | cut -c-2`
        b=`echo $hexinput | cut -c3-4`
        c=`echo $hexinput | cut -c5-6`
        
        RGB_SHADE[$counter,0]=`echo "ibase=16; $a" | bc`
        RGB_SHADE[$counter,1]=`echo "ibase=16; $b" | bc`
        RGB_SHADE[$counter,2]=`echo "ibase=16; $c" | bc`

    else
        hexinput=`echo $1 | tr '[:lower:]' '[:upper:]'` # uppercase-ing
        a=`echo $hexinput | cut -c-2`
        b=`echo $hexinput | cut -c3-4`
        c=`echo $hexinput | cut -c5-6`
        
        tmp2=`echo "$((10 + counter))"`

        RGB_SHADE[$counter,0]=`echo "ibase=16; $a" | bc`
        tmp1=${RGB_SHADE[$counter,0]}
        RGB_SHADE[$counter,0]=`echo "$((tmp1 * tmp2 / 10))"`

        RGB_SHADE[$counter,1]=`echo "ibase=16; $b" | bc`
        tmp1=${RGB_SHADE[$counter,1]}
        RGB_SHADE[$counter,1]=`echo "$((tmp1 * tmp2 / 10))"`

        RGB_SHADE[$counter,2]=`echo "ibase=16; $c" | bc`
        tmp1=${RGB_SHADE[$counter,2]}
        RGB_SHADE[$counter,2]=`echo "$((tmp1 * tmp2 / 10))"`
    fi

    counter=`echo "$((counter + 1))"`
}

rgb2hex(){
    for var in "$@"; do
        if (( $var < 255 )); then
            HEX_SHADE[$counter]+=$(printf '%x' "$var")
        else
            HEX_SHADE[$counter]+=`echo "ff"`
        fi
    done

    counter=`echo "$((counter + 1))"`
}


# Change colors
change_color() {
	# polybar
    sed -i -e "s/background =.*/background = $BG/g" $PFILE
	sed -i -e "s/background-alt.*/background-alt = $BGA/g" $PFILE
	sed -i -e "s/foreground =.*/foreground = $FG/g" $PFILE
	sed -i -e "s/foreground-alt.*/foreground-alt = $FGA/g" $PFILE
	sed -i -e "s/primary.*/primary = $AC/g" $PFILE
	sed -i -e 's/red = #.*/red = #B71C1C/g' $PFILE
	sed -i -e 's/yellow = #.*/yellow = #F57F17/g' $PFILE
	sed -i -e "s/shade1.*/shade1 = $SH1/g" $PFILE
	sed -i -e "s/shade2.*/shade2 = $SH2/g" $PFILE
	sed -i -e "s/shade3.*/shade3 = $SH3/g" $PFILE
	sed -i -e "s/shade4.*/shade4 = $SH4/g" $PFILE
	sed -i -e "s/shade5.*/shade5 = $SH5/g" $PFILE
	sed -i -e "s/shade6.*/shade6 = $SH6/g" $PFILE
	sed -i -e "s/shade7.*/shade7 = $SH7/g" $PFILE
	sed -i -e "s/shade8.*/shade8 = $SH8/g" $PFILE
	

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

    HEX_COLOR=${color2:1}
    counter=0
    
    declare -A RGB_SHADE
    declare -a HEX_SHADE
    
    hex2rgb $HEX_COLOR
    hex2rgb $HEX_COLOR
    hex2rgb $HEX_COLOR
    hex2rgb $HEX_COLOR
    hex2rgb $HEX_COLOR
    hex2rgb $HEX_COLOR
    hex2rgb $HEX_COLOR
    hex2rgb $HEX_COLOR
    
    counter=0
    
    rgb2hex "${RGB_SHADE[0,0]}" "${RGB_SHADE[0,1]}" "${RGB_SHADE[0,2]}"
    rgb2hex "${RGB_SHADE[1,0]}" "${RGB_SHADE[1,1]}" "${RGB_SHADE[1,2]}"
    rgb2hex "${RGB_SHADE[2,0]}" "${RGB_SHADE[2,1]}" "${RGB_SHADE[2,2]}"
    rgb2hex "${RGB_SHADE[3,0]}" "${RGB_SHADE[3,1]}" "${RGB_SHADE[3,2]}"
    rgb2hex "${RGB_SHADE[4,0]}" "${RGB_SHADE[4,1]}" "${RGB_SHADE[4,2]}"
    rgb2hex "${RGB_SHADE[5,0]}" "${RGB_SHADE[5,1]}" "${RGB_SHADE[5,2]}"
    rgb2hex "${RGB_SHADE[6,0]}" "${RGB_SHADE[6,1]}" "${RGB_SHADE[6,2]}"
    rgb2hex "${RGB_SHADE[7,0]}" "${RGB_SHADE[7,1]}" "${RGB_SHADE[6,2]}"


    BG=`printf "%s\n" "$background"`
	BGA=`printf "%s\n" "$color2"`
	FG=`printf "%s\n" "$foreground"`
	FGA=`printf "%s\n" "$color8"`
	AC=`printf "%s\n" "$color1"`
	SH1=`printf "%s\n" "#${HEX_SHADE[0]}"`
	SH2=`printf "%s\n" "#${HEX_SHADE[1]}"`
	SH3=`printf "%s\n" "#${HEX_SHADE[2]}"`
	SH4=`printf "%s\n" "#${HEX_SHADE[3]}"`
	SH5=`printf "%s\n" "#${HEX_SHADE[4]}"`
	SH6=`printf "%s\n" "#${HEX_SHADE[5]}"`
	SH7=`printf "%s\n" "#${HEX_SHADE[6]}"`
	SH8=`printf "%s\n" "#${HEX_SHADE[7]}"`

	change_color

else
	echo "[!] 'pywal' is not installed."
fi

