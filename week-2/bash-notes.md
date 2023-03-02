
$ ssh <username>@<host> -p <port> - connecting to a remote server using SSH
$ ls - list all folders and files
$ cat <filename> - read file in the terminal
$ cat ./- - read dashed file in the terminal
$ cat '<filename>' - read file with spaces in the terminal
$ file -- * - read files content types
$ find . -type f -size xxc ! -executable -exec file {} + | grep ASCII - find all files of specified size, non-executable, readable(ASCII)
$ find . -size xxc -user <user> -group <group> - find all files of xx bytes, owned by user <user> and group <group>
$ cat <filename> | grep "<text>" - read from file part containing "<text>"
$ sort <filename> | uniq -u - sorts data keeping only unique ones
$ strings <filename> | grep == - finding strings, lines including "=="
$ base64 --decode <filename> - decode base64 encoded file
