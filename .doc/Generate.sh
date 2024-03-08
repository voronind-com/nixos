#!/usr/bin/env bash

self=$(/usr/bin/env realpath ${0})
cd ${self%/*}

export BASH_PATH="../module/common/bash"

# Source modules.
for file in ${BASH_PATH}/module/*.sh; do
	source "${file}"
done

IFS=$'\n'
file="Bash.md"

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
	[[ "$(find_function ${module} | /usr/bin/env grep -v ^_)" = "" ]] && continue

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
		desc="$(help ${fun} | /usr/bin/env grep -v Usage\: | /usr/bin/env tr '\n' ' ')"
		usage="$(help ${fun} | /usr/bin/env grep Usage\: | /usr/bin/env sed -e s\/Usage\:\ \/\/)"

		# Use function name if no usage info available.
		[[ "${usage}" = "" ]] && usage="${fun}"

		# Write to file.
		[[ "${desc}" != "" ]] && echo "\`${usage}\`|${desc}" >> "${file}"
	done

	echo >> "${file}"
done
