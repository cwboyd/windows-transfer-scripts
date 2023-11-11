
#__SWAP_COLS="ruby -ne \"puts $_.strip.split(/\s*\*\s*/).reverse.join(' * ')\""
#find . -type f ! -iname "md5sum*.txt" ! -iname "sha1sum*.txt" ! -path "./.git/*" -print0 | xargs -0 md5 | $__SWAP_COLS | sort | $__SWAP_COLS > MD5SUM.txt
#find . -type f ! -iname "md5sum*.txt" ! -iname "sha1sum*.txt" ! -path "./.git/*" -print0 | xargs -0 shasum -a 1 | $__SWAP_COLS | sort | $__SWAP_COLS > SHA1SUM.txt
find . -type f ! -iname "md5sum*.txt" ! -iname "sha1sum*.txt" ! -path "./.git/*" -print0 | xargs -0 md5 | sort  > MD5SUM.txt
find . -type f ! -iname "md5sum*.txt" ! -iname "sha1sum*.txt" ! -path "./.git/*" -print0 | xargs -0 shasum -a 1 | sort  > SHA1SUM.txt
#__SWAP_COLS=

