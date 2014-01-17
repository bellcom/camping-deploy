#!/bin/sh

##### Drupal deploy script made in shell
# - Makes build with drush make
# - Moves latest build to dev-latest
# - Backup database
# - Update database with drush updb
# - Clear cache
#
# Run the script with URI infront if you want to run for a specific multisite:
# URI=http://domain.tld ./reroll.sh
#
# Author: Anders Bryrup (andersbryrup@gmail.com)

DATE=`date +%Y%m%d%H%M`

# The newly builed dir
BUILD_DIR=master-$DATE
# The previous build dir
BUILD_DIR_PREV=master-previous
# The build dir with latest build
BUILD_DIR_LATEST=master-latest

# The Source Profile name
# This is a special case, where multiple profiles are in same dir.
# [name].install
# [name].profile
# [name].info
PROFILE_SRC=camping
# The destination Profile name
PROFILE_DST=camping

# The root dir of your drupal instance. Used by drush!
DRUPAL_ROOT=$(dirname `pwd`)/public_html

mkdir -p build/$BUILD_DIR

# Using --working-copy to get the full git clone and be able to push back.
drush make --working-copy --no-gitinfofile -y --no-core --contrib-destination=build/$BUILD_DIR $PROFILE_SRC.make

if [ -d "build/$BUILD_DIR/modules" ]; then
	# Drush make completed without errors. If modules doesnt exist, drush make failed.

	# Lets copy our drupal profile files
	cp $PROFILE_SRC.info build/$BUILD_DIR/$PROFILE_DST.info
	cp $PROFILE_SRC.profile build/$BUILD_DIR/$PROFILE_DST.profile
	cp $PROFILE_SRC.install build/$BUILD_DIR/$PROFILE_DST.install

	# Move old build to previous
	if [ -e build/$BUILD_DIR_PREV ]; then
    unlink build/$BUILD_DIR_PREV
  fi
	if [ -e build/$BUILD_DIR_LATEST ]; then
	  mv build/$BUILD_DIR_LATEST build/$BUILD_DIR_PREV
  fi
	# Make new build the latest
	ln -sf $BUILD_DIR build/$BUILD_DIR_LATEST

  # Change to public_html to make mdrush.sh work
  cd $DRUPAL_ROOT

  # Don't run any drush commands if there is no connection to the database (like on the first reroll)
	mdrush.sh "--root=$DRUPAL_ROOT --uri=$URI status" | grep Database | grep -q Connected
  if [ $? -eq 1 ]; then
	  echo "* Deploy Complete. No database found (not running any more drush commands) *"
  else
	  echo "* Updating databases... Sites will go in maintenance mode! *"
	  mdrush.sh "--root=$DRUPAL_ROOT --uri=$URI vset maintenance_mode 1"
	  mdrush.sh "--root=$DRUPAL_ROOT --uri=$URI updb"

	  echo "* Clearing registry... *"
	  mdrush.sh "--root=$DRUPAL_ROOT --uri=$URI cc registry"
	  echo "* Clearing cache... *"
	  mdrush.sh "--root=$DRUPAL_ROOT --uri=$URI cc all"

	  echo "* Disabling maintenance mode again *"
	  mdrush.sh "--root=$DRUPAL_ROOT --uri=$URI vset maintenance_mode 0"

	  echo "* Deploy Complete. End of maintenance mode! *"
  fi
  # Run cleanup
  cd -
  ./cleanup.sh
else
	# Build failed, remove build.
	rm -rf build/$BUILD_DIR
	echo "* Build Failed. Deploy terminated *"
fi
