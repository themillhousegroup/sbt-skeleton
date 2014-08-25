#!/bin/bash

# init.sh: use immediately after cloning sbt-skeleton to remove the .git directory and perform other new-project setup tasks.

if [ $# -lt 1 ]; then
  echo "usage: ./init.sh <projectname>"
  exit
fi

PROJECTNAME=$1

# params: filename
function subname {
  filename=$1
  
  echo "Setting $filename project name to '$PROJECTNAME'"
  sed -i.bak "s/projectname/$PROJECTNAME/" $filename 

  echo "Checking substitution worked"
  subcount=`grep -c $PROJECTNAME $filename`
  if [ "$subcount" -gt "0" ]; then
    echo "Substitution fine; deleting .bak file"
    rm ${filename}.bak
  fi
}

echo "Removing old .git directory"
rm -rf .git/

#subname build.sbt
subname README.md 


echo "Doing git init"
git init


