# Big File Finder
Big File Finder is a simple shell script which outputs the size and locations of files/directories which are considered to be "big". By default, the threshold is set to 1GB, but can be altered by specifying the `-s` flag.

I wrote this script because I was growing concerned with my Mac's storage. The storage management tool was showing that *System Data* had a storage size of over 72 GB, with no options provided to see the contents. By using the script, I noticed that one directory in particular, *Library*, was responsible for over half of the 72 GB. Information about the *Library* directory is available <a href="https://www.macrumors.com/how-to/reveal-library-folder-in-macos/">here</a>.

Attached alongside the README and the script is a text file which contains some sample output. The output in question contains the files/directories on my personal system which exceed 10 GB in size.

# Usage
The script can be ran via:

`$ ./finder.sh`

Without flags, the script outputs all files/directories with a file size exceeding 1GB to the terminal. By default, the script traverses from the root directory.

The script flags are optional. The available ones are:

`-h` displays a help message <br />
`-s` the target file size to check against <br />
`-d` the directory to traverse <br />
`-f` the file to write results to

# Examples

Output any files/directories in *Documents* larger than 10GB to the terminal <br />
`
$ ./finder.sh -s 10G -d ~/Documents
`

Write any files/directories larger than 1GB to *test.txt* <br />
`
$ ./finder.sh -f ~/Documents/test.txt
`

# Troubleshooting
A few of the potential issues with the script are outlined with troubleshooting steps below.

### Operation not permitted
On a Mac running OS X or higher, it may be necessary to allow the terminal full access to the hard disk. This can be done via the system settings. Otherwise, running the script may yield `Operation not permitted`.

### permission denied
To make the script executable, its permissions need to be updated using the command: <br />
`chmod 755 finder.sh`
