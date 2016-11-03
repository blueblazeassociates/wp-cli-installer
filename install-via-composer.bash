#!/bin/bash

# Include the link script.
source utils/link.bash

# Include text variables.
source utils/text.bash

# Process command line arguments.
source utils/args.bash

# Check the installation to make sure we're not clobbering anything.
# Make the user do the clobbering.
source utils/install-check.bash

# Looks everything is OK.

# Let the user know that something is happening.
echo "Installing..."

# Use composer to install WP-CLI. 
composer --no-dev --optimize-autoloader install --quiet

# Setup a symlink to WP-CLI.
link bin/wp ../vendor/wp-cli/wp-cli/bin/wp

# Let the user know.
echo ""
echo "WP-CLI is now installed. Check if it is working by running 'bin/wp --info'."
echo "For a global installation, add this package's bin directory to your path."
