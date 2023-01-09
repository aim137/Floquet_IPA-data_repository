dir="../../0scf"
SCF=`echo "$(cd "$(dirname "$dir")"; pwd)/$(basename "$dir")"`

sed -i "s&aim137REPLACE_SCF&$SCF&g" qerun.sh

