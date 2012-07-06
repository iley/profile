_task_add () {
	cd $MRJOB
	mkdir statadhoc-$1
	cd statadhoc-$1
	mkdir test
	ls > .gitignore
	git add .
	git commit -m " * [STATADHOC-$1] Начало работы"
}

_task_clone () {
	cd $MRJOB
	if [ -e statadhoc-$1 ]
	then
		cp -r statadhoc-$1 statadhoc-$2
		cd statadhoc-$2
		git add .
		git commit -m " * [STATADHOC-$2] Скопировал $1"
	else
		echo "No such task $1"
	fi
}

_task_cd () {
	cd $MRJOB/statadhoc-$1
}

_task_usage () {
	echo "Usage: task (add|cd|clone) args"
}

task () {
	case $1
	in
	add) _task_add $2;;
	cd) _task_cd $2;;
	clone) _task_clone $2 $3;;
	*) _task_usage;;
	esac
}
