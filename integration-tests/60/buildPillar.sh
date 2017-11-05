#!/bin/bash

wget --quiet -O - get.pharo.org/${PHARO_VERSION}+${VM} | bash
REPO=http://smalltalkhub.com/mc/Pier/Pillar/main
./pharo Pharo.image config $REPO ConfigurationOfPillar --install=${PILLAR_VERSION} --group='ALL'
./pharo Pharo.image config http://smalltalkhub.com/mc/NorbertHartl/Mustache/main ConfigurationOfMustache --install=bleedingEdge

cat > pillar <<EOF
#!/usr/bin/env bash

# PHARO_VM=\${PHARO_VM:-./pharo}
# PILLAR_IMAGE=\${PILLAR_IMAGE:-./Pharo.image}

PHARO_VM=\${PHARO_VM}
# ./pharo has a higher priority than PHARO_VM env if it exists
if [ -f pharo ]; then
	PHARO_VM="./pharo"
fi

PILLAR_IMAGE=\${PILLAR_IMAGE}
# Pharo.image has a higher priority than PILLAR_IMAGE env if it exists
if [ -f Pharo.image ]; then
	PILLAR_IMAGE="./Pharo.image"
fi

command=\$1
shift

# disable parameter expansion to forward all arguments unprocessed to the VM
set -f

# TODO: when Pharo knows how to return the correct "current working directory", we
# can remove the --baseDirectory from here. The current solution is
# problematic because it overrides any baseDirectory parameter of the
# pillar.conf file.
exec "\$PHARO_VM" "\$PILLAR_IMAGE" --no-default-preferences pillar "\$command" --baseDirectory="\$PWD" "\$@"
EOF

echo =====================================================
echo = Create a mustache executable script
echo =====================================================

cat > mustache <<EOF
#!/usr/bin/env bash

# PHARO_VM=\${PHARO_VM:-./pharo}
# MUSTACHE_IMAGE=\${MUSTACHE_IMAGE:-./Pharo.image}

PHARO_VM=\${PHARO_VM}
# ./pharo has a higher priority than PHARO_VM env if it exists
if [ -f pharo ]; then
	PHARO_VM="./pharo"
fi

MUSTACHE_IMAGE=\${MUSTACHE_IMAGE}
# Pharo.image has a higher priority than MUSTACHE_IMAGE env if it exists
if [ -f Pharo.image ]; then
	MUSTACHE_IMAGE="./Pharo.image"
fi

option=\$1
shift

# disable parameter expansion to forward all arguments unprocessed to the VM
set -f

# TODO: when Pharo knows how to return the correct "current working directory", we
# can remove the --baseDirectory from here. The current solution is
# problematic because it overrides any baseDirectory parameter of the
# pillar.conf file.
exec "\$PHARO_VM" "\$MUSTACHE_IMAGE" mustache "\$option" --baseDirectory="\$PWD" "\$@"
EOF

chmod +x pillar
chmod +x mustache