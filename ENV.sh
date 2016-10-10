BASEDIR=`dirname ${BASH_SOURCE[0]}`
JDK="$BASEDIR/jdk"
MAVEN="$BASEDIR/maven"
if [[ ! -e $JDK ]]; then
  (>&2 echo "ERROR: jdk is not set")
  return 1
fi
if [[ ! -e $MAVEN ]]; then
  (>&2 echo "ERROR: maven is not set")
  return 1
fi


# JAVA
JAVA_HOME=$JDK
PATH=$JAVA_HOME/bin:$PATH

# Maven
MAVEN_HOME=$MAVEN
PATH=$MAVEN_HOME/bin:$PATH
