
These are simple batch files used with git and robocopy
to detect bit rot (and changes) plus keep a target updated.  This __does not__
stick the files in the git repo, since that would double storage.  It does
not use git-annex or GVFS, since that adds unnecessary complexity.

fingerprint.bat updates the hashes.  Both MD5 and SHA1 are used, since the
liklihood of producing a collision with 2 different hash functions is lower.

transfer.bat transfers from this directory to a target directory.  You will
have to edit this batch file to change \_\_TARGET.

# FAQ

## How do I get started?

Clone this repo into an empty directory - via `git clone https://github.com/cwboyd/windows-transfer-scripts` and then copy the files you want to track over it.

You will need a Unix-like `find` like the one from GNU binutils, as the find.exe which ships with Windows-like OSes is not useful (for our purposes).  It will need to be in your path.  The `fingerprint.bat` relies on this.

You will also need a somewhat modern Ruby in your path ... Ruby 2.5.7 has been tested to work.

## How do I verify that files have not changed?

You can simply run `fingerprint.bat` and then `git diff`.  If there are no changes, then you should not see any changes to `MD5SUM.txt` or `SHA1SUM.txt`.  If there are changes in hash values, something has changed in the file - corruption, edits, etc.

## How do I verify the tranferred files?

Running `transfer.bat` should update the .git subdirectory in the transfer target.  You can then run `fingerprint.bat` within the target directory.  After this, run `git diff` - you should not see any changes to `MD5SUM.txt` or `SHA1SUM.txt`.
