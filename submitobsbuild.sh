#!/usr/bin/bash -x

PATH=/usr/bin:/usr/sbin/
export PATH

MYDATE=`date`

# checkout the OSB package
osc co home:useidel dummy

cd home*

# copy (updated) files to working directory
# note that the content from github is now in the upper directory
cp ../*spec dummy/
cp ../*.tar.gz dummy/

# we create/change a foobar file to trigger the OBS build all the time
echo $MYDATE > dummy/foobar.txt

# mark files for update if there are new ones
#cd dummy
#osc add *spec
#cd ..

# upload changed content including codeberg commit message
MYCITEXT=`echo ${CI_COMMIT_MESSAGE} | tr -d '\n'`
osc ci -m "From Codeberg Commit -> $MYCITEXT: $MYDATE" dummy

