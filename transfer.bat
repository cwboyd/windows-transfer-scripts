
SET __TARGET=p:\directory
REM SET __EXCLUDES=/XD "_excluded" "dir1" "dir2"
SET __EXCLUDES=/XD "_excluded"
robocopy . %__TARGET% /MIR /XJD %__EXCLUDES%
SET __TARGET=
SET __EXCLUDES=

