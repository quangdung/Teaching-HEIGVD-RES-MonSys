#!/bin/bash

# Touched to fix the end-of-line problem
# We would need to link the docker containers, but haven't done yet. Instead, we
# rely on the fact that containers always have the same IP address. We use these
# IP addresses in the nginx reverse proxy configuration. This is fragile and needs
# to be improved!

# Now, let's start nginx
nginx
