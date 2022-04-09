# LIST
subscription-manager list --available
Lists available subscriptions not yet attached to the system

subscription-manager list --available --all
Lists all possible subscriptions that have been purchased, even if they do not match the system architecture

subscription-manager list --available --match-installed
Shows only subscriptions matching products that are currently installed

subscription-manager list --consumed
Lists all subscriptions currently attached to the system

subscription-manager list --installed
Lists products (subscribed or not) currently installed on the system.


# ATTACH
subscription-manager attach --pool=2345d842b123d-09f3fe409def
Gives the ID for the subscriptions pool (collection of products) to attach to the system (required unless using --auto)

subscription-manager auto-attach --enable
Enables the auto-attach option for the system

subscription-manager auto-attach --show
Shows whether auto-attach is enabled on the systems


# CONFIG
subscription-manager config --list
Prints the current configuration for Subscription Manager

subscription-manager config --remove=server.proxy_port
Deletes the current value for the proxy_port without supplying a new parameter (server can be rhsm or rhsmcertd instead)

subscription-manager config --server.proxy_port=999
Sets proxy_port value in [server] section to 999


# FACTS
subscription-manager facts --list
Lists the system information
subscription-manager facts --update
Updates the system information


# PLUGINS
subscription-manager plugins --list
Lists the available subscription-manager plugins


# RELEASE
subscription-manager release --list
Lists the available OS versions

subscription-manager release --set=8.4
Sets the minor (Y-stream) release version to use (8.4)

subscription-manager release --unset
Removes any previously set release version preference


# REPOS
subscription-manager repos --list
Lists all repositories provided by the content service that the system uses

subscription-manager repos --enable=rhel-7-server-supplementary-rpms
Enables the specified repository, made available by the content sources identified in the system subscriptions

subscription-manager repos --disable=rhel-7-server-supplementary-rpms
Disables the specified repository, made available by the content sources identified in the system subscriptions


# DEBUG
rhsm-debug system
Lists subscription information for local system