#!/usr/bin/bash -x

PATH=/usr/bin:/usr/sbin/
export PATH

# This will setup the needed directory structure to build RPM packages
# please note that this will not happen in the $CODEBERG_WORKSPACE 
# but in the RPMBUILD space instead
rpmdev-setuptree

# Get the version from the SPEC file
MYVER=`grep ^Version *.spec |awk '{print $2}'`

# copy the also needed patch file(s) to the RPMBUILD space
# again this is different from the $CODEBERG_WORKSPACE
###cp *.patch $HOME/rpmbuild/SOURCES

# Now download the sources to the correspoding RPMBUILD directory
cd $HOME/rpmbuild/SOURCES
wget -nd https://codeberg.org/useidel/copr_obs-build-test4codeberg/raw/branch/main/dummy_package-0.0.1.tar.gz

