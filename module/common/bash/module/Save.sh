# Backup a game save.
# Usage: save [TARGETS]
function save() {
	local IFS=$'\n'
	local targets=("${@}")
	local files=()
	[[ "${targets}" = "" ]] && targets=($(_ls_dir))

	_info "Archiving..."
	for target in ${targets[@]}; do
		files+=($(archive "${target}"))
	done

	_info "Uploading..."
	try rcp "${files[@]}" home:/storage/cold_1/backup/save/

	_info "Cleaning..."
	archive_prune 2> /dev/null
}
