function torn
	echo $argv
	command qmk $argv -kb torn -km gorillaHobo -e AVR_CFLAGS="-Wno-array-bounds"
end
