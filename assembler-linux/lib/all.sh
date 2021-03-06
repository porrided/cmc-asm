#!/bin/sh
# This script assumes that:
# $FN is set to the assembler source filename (without extension)
# $TMP_CONF is a synthesized dosbox.conf file
# $DOSBOX_OUTPUT tells DOSBox where to dump stdout 
# $DOSBOX_EXIT tells DOSBox if it needs to automatically close itself

[ -z $FN ] && FN=$1
[ -z $FN ] && exit 40

# Cleaning binaries
[ -f $FN.exe ] && rm $FN.exe
[ -f $FN.obj ] && rm $FN.obj

ML="c:\\masm4\\masm.exe"
LINKER="c:\\masm4\\link.exe"

ML_CL="$ML /c /Ic:\\ $FN,$FN,$FN;"
LINKER_CL="$LINKER $FN+c:\\ioproc.obj,$FN;"

sh -c "dosbox -conf ""\"$TMP_CONF\""" \
    -c '""u:\\""' \
    -c '""$ML_CL""' \
    -c '""$LINKER_CL""' \
    -c '""$DOSBOX_EXIT""' \
    ""$DOSBOX_OUTPUT"

find . -iname "$FN"'*' -print | $MASM_PATH/lower.sh
if [ ! -f $FN.obj ] ; then
    echo "Compilation error."
    rm -f $TMP_CONF
    exit 10
else
    echo "Compilation complete."
    if [ ! -f $FN.exe ] ; then
        echo "Linking error."
        rm -f $TMP_CONF
        exit 11
    else
        echo "Linking complete."
    fi
fi


