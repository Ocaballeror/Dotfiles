#!/usr/bin/env bats

load $BATS_TEST_DIRNAME/../../bash/.bash_functions

setup() {
	temp="$(mktemp -d)"
	cd $temp

	disk="fakedisk"
	dd if=/dev/zero of=$disk  bs=1MiB count=4
	sudo mkfs.ext4 $disk
	loop="$(sudo losetup --find --show $disk)"
	run folder $loop

	content1="Hello world"
	content2="Hello world 2"
	file1="file1"
	file2="file2"
	echo "$content1" > $file1
	echo "$content2" > $file2
}

teardown() {
	folder -k || true
	sudo losetup --detach $loop

	cd "$HOME"
	rm -rf "$temp"
}

@test "Push one file" {
	run push $file1 $loop

	run folder $loop
	[ -d folder ] || skip "Folder is not working properly"
	[ -f folder/$file1 ]
	[ "$(cat folder/$file1)" = "$content1" ]
}

@test "Push multiple files" {
	run push $file1 $file2 $loop

	run folder $loop
	[ -d folder ] || skip "Folder is not working properly"

	[ -f folder/$file1 ]
	[ -f folder/$file2 ]

	[ "$(cat folder/$file1)" = "$content1" ]
	[ "$(cat folder/$file2)" = "$content2" ]
}

@test "Push quoted filename with spaces" {
	filename='a name with spaces'
	touch "$filename"
	run push "$filename" $loop

	run folder $loop
	[ -d folder ] || skip "Folder is not working properly"
	[ -f "folder/$filename" ]
}

@test "Push filename with escaped spaces" {
	touch a\ name\ with\ spaces
	run push a\ name\ with\ spaces $loop

	run folder $loop
	[ -d folder ] || skip "Folder is not working properly"
	[ -f folder/a\ name\ with\ spaces ]
}
