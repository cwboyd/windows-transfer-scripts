REM cat MD5SUM.txt | ruby -pe "$_.gsub!(/^(\S+) \*(.*)$/, '\2 * \1')" | sort | ruby -pe "$_.gsub!(/^(.*) \* (\S+)$/, '\2 * \1')"

SET __SWAP_COLS=ruby -ne "puts $_.strip.split(/\s*\*\s*/).reverse.join(' * ')"
find . -type f ! -iname "md5sum*.txt" ! -iname "sha1sum*.txt" ! -iname "sha256sum*.txt" ! -path "./.git/*" -print0 | xargs -0 md5sum | %__SWAP_COLS% | sort | %__SWAP_COLS% > MD5SUM.txt
find . -type f ! -iname "md5sum*.txt" ! -iname "sha1sum*.txt" ! -iname "sha256sum*.txt" ! -path "./.git/*" -print0 | xargs -0 sha1sum | %__SWAP_COLS% | sort | %__SWAP_COLS% > SHA1SUM.txt
find . -type f ! -iname "md5sum*.txt" ! -iname "sha1sum*.txt" ! -iname "sha256sum*.txt" ! -path "./.git/*" -print0 | xargs -0 sha256sum | %__SWAP_COLS% | sort | %__SWAP_COLS% > SHA256SUM.txt
SET __SWAP_COLS=
