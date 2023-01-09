dir="../../0nscf"
SAVE=`echo "$(cd "$(dirname "$dir")"; pwd)/$(basename "$dir")"`

sed -i "s&aim137REPLACE_SAVE&$SAVE&g" fly.sh

yambo_nl -F i1-IP_nl -o c -I $SAVE
