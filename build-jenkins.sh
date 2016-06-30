#!/usr/bin/env bash

set -xv

export JOB_NAME=Pillar

wget --quiet -O - get.pharo.org/$PHARO+$VM | bash

./pharo Pharo.image save $JOB_NAME --delete-old
./pharo $JOB_NAME.image --version > version.txt

REPO=http://smalltalkhub.com/mc/Pier/$JOB_NAME/main
./pharo $JOB_NAME.image config $REPO ConfigurationOf$JOB_NAME --install=$VERSION --group='ALL'
./pharo $JOB_NAME.image test --junit-xml-output "$JOB_NAME.*"
./pharo $JOB_NAME.image config http://smalltalkhub.com/mc/NorbertHartl/Mustache/main ConfigurationOfMustache --install=bleedingEdge

echo =====================================================
echo = Try to compile EnterprisePharo
echo =====================================================

mkdir enterprise_pharo
cd enterprise_pharo
wget --no-check-certificate --quiet -O - https://ci.inria.fr/pharo-contribution/job/EnterprisePharoBook/lastSuccessfulBuild/artifact/EnterprisePharo-src.tgz | tar zx
./download.sh
cp ../$JOB_NAME.image Pharo.image
cp ../$JOB_NAME.changes Pharo.changes
./pharo Pharo.image eval --save "StartupPreferencesLoader allowStartupScript: false."
./pharo Pharo.image eval --save "Deprecation raiseWarning: false; showWarning: false."
./compile.sh
rm -rf pharo-vm *.image *.change
cd ..


echo =====================================================
echo = Create a pillar executable script
echo =====================================================

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
exec "\$PHARO_VM" "\$PILLAR_IMAGE" pillar "\$command" --baseDirectory="\$PWD" "\$@"
EOF


echo =====================================================
echo = Create a mustache executable script
echo =====================================================

cat > mustache <<EOF
#!/usr/bin/env bash

# PHARO_VM=${PHARO_VM:-./pharo}
# MUSTACHE_IMAGE=${MUSTACHE_IMAGE:-./Pharo.image}

PHARO_VM=${PHARO_VM}
# ./pharo has a higher priority than PHARO_VM env if it exists
if [ -f pharo ]; then
	PHARO_VM="./pharo"
fi

MUSTACHE_IMAGE=${MUSTACHE_IMAGE}
# Pharo.image has a higher priority than MUSTACHE_IMAGE env if it exists
if [ -f Pharo.image ]; then
	MUSTACHE_IMAGE="./Pharo.image"
fi

option=$1
shift

# disable parameter expansion to forward all arguments unprocessed to the VM
set -f

# TODO: when Pharo knows how to return the correct "current working directory", we
# can remove the --baseDirectory from here. The current solution is
# problematic because it overrides any baseDirectory parameter of the
# pillar.conf file.
exec "$PHARO_VM" "$MUSTACHE_IMAGE" mustache "$option" --baseDirectory="$PWD" "$@"
EOF

chmod +x pillar
chmod +x mustache

zip -r $JOB_NAME.zip $JOB_NAME.image $JOB_NAME.changes pillar

echo =====================================================
echo = Create a pillar deployment archive
echo =====================================================
./pharo $JOB_NAME.image eval --save "Deprecation raiseWarning: false."
./pharo $JOB_NAME.image eval --save "Deprecation showWarning: false."
./pharo $JOB_NAME.image eval --save "StartupPreferencesLoader allowStartupScript: false."

# UserManager was remove on Pharo5. We need to check if there is an other way to do this.
./pharo $JOB_NAME.image eval --save "PharoFilesOpener default unsetInformAboutReadOnlyChanges."
./pharo $JOB_NAME.image eval --save "Smalltalk logFileName: '/tmp/pillar.log'"

zip -r $JOB_NAME-deployment.zip $JOB_NAME.image $JOB_NAME.changes pillar

# clean up the workspace to not occupy too much stale space on the slaves
rm -rf *.image *.changes
rm -rf pharo-vm
