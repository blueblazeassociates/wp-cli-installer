#!/bin/bash

# Include settings.
source utils/settings.bash

# Include the link script.
source ${UTILS_DIR}filesystem.bash

# Capture/set the absolute path for BIN_DIR.
BIN_DIR_ABSOLUTE=$(realpath_cp $PWD/${BIN_DIR})

# Include text variables.
source ${UTILS_DIR}install-text.bash

# Process command line arguments.
source ${UTILS_DIR}args.bash

# Check the installation to make sure we're not clobbering anything.
# Make the user do the clobbering.
source ${UTILS_DIR}install-check.bash

# Looks everything is OK.

# Let the user know that something is happening.
echo "$WAITING_TEXT"

# Use composer to install WP-CLI. 
curl${DO_QUIET_CURL} --output ${BIN_DIR}wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

# Setup a symlink to WP-CLI.
link ${BIN_DIR}wp wp-cli.phar

# Let the user know.
echo "$FINISHED_TEXT"
