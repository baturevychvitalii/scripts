. Vglobals

# check if element exists in array
# arg1 element
# arg2,3,4...$# array
function EXISTS_IN_ARRAY()
{
	if (($# < 2)); then
		echo "EXISTS_IN_ARRAY: at least 2 args must be provided";
		exit 1;
	fi

	# element 1 is our tested parameter
	for idx in {2..$#}; do
		if [ "${@[1]}" = "${@[idx]}" ]; then
			return 0;
		fi
	done

	return 1;
}

# picks prefered interface
# arg1 {int(internal), ext(external)} 
# returns preffered interface if exists
# ext -> int -> NULL
function PICK_WIRELESS_INTERFACE()
{
	if [[ $1 != "int" && $1 != "ext" ]]; then
		echo "PICK_WIRELESS_INTERFACE: invalid argument" >&2;
		exit 1;
	fi

	interfaces=($(ip link show | grep -e "^[1-9]\+: wlp" | cut -d ' ' -f 2 | tr ':' '\0'));
	
	if [ $1 = "int" ]; then
		if EXISTS_IN_ARRAY $BUILT_IN_INTERFACE $interfaces; then
			echo "$BUILT_IN_INTERFACE";
		else
			echo "NULL";
		fi
	else
		# find interface, which is not internal
		choice="NULL";
		for inter in $interfaces; do
			if [ "$inter" != "$BUILT_IN_INTERFACE" ]; then
				choice="$inter";
				break;
			fi
		done

		echo "$choice";
	fi
}

# ensures cache folder exists
# arg1 file name in cache folder
# returns full path to file with provided filename in PATH_TO_CACHE_FOLDER
function REQUIRE_CACHE()
{
	if [ "$#" -ne 1 ]; then
		echo "REQUIRE_CACHE: file name must be provided";
		exit 1;
	fi

	if ! [ -d "$PATH_TO_CACHE_FOLDER" ]; then
		mkdir "$PATH_TO_CACHE_FOLDER";

		if ! [ -d "$PATH_TO_CACHE_FOLDER" ]; then
			echo "REQUIRE_CACHE: couldn't create cache folder";
			exit 1;
		fi
	fi

	echo "$PATH_TO_CACHE_FOLDER/$1";
}

#prints arguments to both notify-send and echo
function NOTIFY_FULL()
{
	echo "$@";
	notify-send "$@";
}

