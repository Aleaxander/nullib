#!/bin/bash

function _find()
{
	find $1 -name '*.[ch]'
}

_find arch/x86 		 >.file.list
_find block 		>>.file.list
_find fs 		>>.file.list
_find include 		>>.file.list
_find init 		>>.file.list
_find ipc		>>.file.list
_find kernel		>>.file.list
_find lib		>>.file.list
_find mm		>>.file.list

if [ x"$1" = x"all" ]; then
	_find drivers	>>.file.list
	_find firmware	>>.file.list
	_find net	>>.file.list
	_find sound	>>.file.list
	_find virt	>>.file.list
	_find crypto 	>>.file.list
fi


gtags -f .file.list
