#!/bin/sh
# This script assumes that:
# $FN is set to the assembler source filename (without extension)
# $TMP_CONF is a synthesized dosbox.conf file
# $DOSBOX_OUTPUT_REDIRECTION tells DOSBox where to dump stdout 
# $DOSBOX_EXIT tells DOSBox if it needs to automatically close itself

[ -z $FN ] && FN="$1"
[ -z $FN ] && exit 40

ML="c:\\masm4\\masm.exe"
ML_CL="$ML /c /Ic:\\ $FN,$FN,$FN;"

sh -c "dosbox -conf ""\"$TMP_CONF\""" \
    -c '""u:\\""' \
    -c '""$ML_CL""' \
    -c '""$DOSBOX_EXIT""' \
    ""$DOSBOX_OUTPUT_REDIRECTION"

[ ! -z "$MASM_FORCE_LOWERCASE" ] && find . -iname "$FN"'*' -print | $MASM_PATH/lower.sh
if [ ! -f $FN.obj ] ; then
    echo "Compilation error."
    rm -f $TMP_CONF
    exit 10
else
    echo "Compilation complete."
fi


