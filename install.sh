#/bin/bash

dest=$HOME/.vimrc
tmp=/tmp/install

function on_exit {
	rm $tmp &> /dev/null
}

trap on_exit EXIT

if [ $# -ge 1 ]
then
	dest=$1
fi

curl https://raw.githubusercontent.com/zclewell/dotfiles/main/.vimrc -o $tmp

header=`head -n1 $tmp`

grep "$header" $dest &> /dev/null
if [ $? -eq 0 ]
then
	echo looks like already installed...
	exit 1
fi

cat $tmp >> $dest
