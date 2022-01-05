
SET __TARGET=p:\directory
REM SET __EXCLUDES=/XD "dir1" "dir2"
robocopy . %__TARGET% /MIR /XJD %__EXCLUDES%
SET __TARGET=
SET __EXCLUDES=

