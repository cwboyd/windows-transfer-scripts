#/bin/bash

__LIST_FILES_BASE='find . -name .git -prune -o -type f ! -iname md5sum*.txt ! -iname sha1sum*.txt ! -iname sha256sum*.txt ! -iname *.swp  '

#$__LIST_FILES_BASE > out
#echo DUMPED-OUT-INTERMEDIATE
__LIST_FILES="$__LIST_FILES_BASE -print0"
#$__LIST_FILES > out0
#return

# The mda5 command uses -r to put output in a sane format, e.g.
#     -r      Reverses the format of the output.  This helps with visual diffs.
#             Does nothing when combined with the -ptx options.
__POST_PROCESS_CMD=sort
$__LIST_FILES | xargs -0 md5 -r | $__POST_PROCESS_CMD > MD5SUM.txt

# The shasum command on on macosx outputs sanely.
__POST_PROCESS_CMD=sort
$__LIST_FILES | xargs -0 shasum -a 1 | $__POST_PROCESS_CMD > SHA1SUM.txt

# The shasum command on on macosx outputs sanely.
__POST_PROCESS_CMD=sort
$__LIST_FILES | xargs -0 shasum -a 256 | $__POST_PROCESS_CMD > SHA256SUM.txt

__POST_PROCESS_CMD=

