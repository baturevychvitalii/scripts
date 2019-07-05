PATH_TO_DATA_FOLDER="/opt/scripts/data";
AUR_GIT_FOLDER="$HOME/.AUR";

function EXISTS_IN_ARRAY()
{
	# element 1 is our tested parameter
	for idx in {2..$#}; do
		if [ "${@[1]}" = "${@[idx]}" ]; then
			return 0;
		fi
	done

	return 1;
}
