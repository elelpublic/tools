#!/bin/sh

# keep it here: https://github.com/elelpublic/tools.git

if [[ $1 == "" ]]
then
  echo "Parameter 8 or 17 is required"
  exit 1
fi

if [[ $1 != "8" ]] && [[ $1 != "17" ]]
then
  echo "Parameter 8 or 17 is required"
  exit 1
fi

OLD=8
NEW=17

if [[ $1 == "8" ]]
then
  OLD=17
  NEW=8
fi

echo ""
echo ""
echo "Changing JVM in current session to version: " $NEW


# set java version locally, i.e. only for current session

echo ""
echo ""
echo "-[BEFORE]---------------------------------------"
echo "JAVA_HOME : ${JAVA_HOME}"
echo "PATH      : ${PATH}"

JAVA_HOME_OLD="$HOME/apps/java${OLD}"
JAVA_HOME_NEW="$HOME/apps/java${NEW}"
export JAVA_HOME=$JAVA_HOME_NEW

PREFIX_TO_REMOVE=${JAVA_HOME_OLD}/bin
#echo "PATH: ${PATH}" 
echo "PREFIX_TO_REMOVE: ${PREFIX_TO_REMOVE}"
if [[ $PATH == "$PREFIX_TO_REMOVE"* ]]
then
  LEN=${#PREFIX_TO_REMOVE}
  LEN=$((LEN+1))
  PATH=${PATH:$LEN}
fi

if [[ $PATH != "$JAVA_HOME_NEW"* ]]
then
  export PATH=$JAVA_HOME/bin:$PATH
fi

echo "-[AFTER]---------------------------------------"
echo "JAVA_HOME : ${JAVA_HOME}"
echo "PATH      : ${PATH}"
echo "-----------------------------------------------"
java -version
echo "-----------------------------------------------"
echo ""
echo ""

