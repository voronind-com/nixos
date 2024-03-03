# Generate a markdown file with all the help info.
# Outputs to `~/.doc/Bash.md`.
function doc_bash() {
	local IFS=$'\n'
	local file="${HOME}/.doc/Bash.md"

	# Print title.
	echo "# Bash reference file." > "${file}"
	echo >> "${file}"

	# Print help info.
	echo "To get help with usage info run:" >> "${file}"
	echo >> "${file}"
	echo '```text' >> "${file}"
	echo '$ help <COMMAND>' >> "${file}"
	echo >> "${file}"
	echo "or" >> "${file}"
	echo >> "${file}"
	echo '$ h <COMMAND>' >> "${file}"
	echo '```' >> "${file}"
	echo >> "${file}"

	# Fill with data.
	for module in $(find_module); do
		# Skip if no functions.
		[[ "$(find_function ${module} | grep -v ^_)" = "" ]] && continue

		# Print module title.
		echo "## ${module^}." >> "${file}"
		echo >> "${file}"

		# Print table title.
		echo "Command|Description" >> "${file}"
		echo "---|---" >> "${file}"

		for fun in $(find_function ${module}); do
			# Skip private functions.
			[[ "${fun}" =~ ^_.* ]] && continue

			# Parse help info.
			local desc="$(help ${fun} | grep -v Usage\: | tr '\n' ' ')"
			local usage="$(help ${fun} | grep Usage\: | sed -e s\/Usage\:\ \/\/)"

			# Use function name if no usage info available.
			[[ "${usage}" = "" ]] && usage="${fun}"

			# Write to file.
			[[ "${desc}" != "" ]] && echo "\`${usage}\`|${desc}" >> "${file}"
		done

		echo >> "${file}"
	done
}
