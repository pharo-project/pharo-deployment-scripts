#!/bin/bash

function usage() {
	cat <<END
Usage: $0
	run a Smalltalk image
Naming
	<app_name> 			is the name of your application and is used as unique identifier (script name as default value)
	<image>.image 	is the Smalltalk image that will be started
	<st_file> 			must exist and is the Smalltalk startup script
	<vm> 				is the full path to the Pharo virtual machine
	<vm_options> 		[optional] parameters that will be passed to the vm
	<user>				user used to run the application
END
	exit 1
}

if [ "$#" -ne 0 ]; then
	usage
fi

### Please update these values accordingly to your server configuration
# vm=$app_home/pharo
vm=/usr/bin/pharo-vm-nox
# vm_options="--nodisplay --nosound"
user=pharo

### COMMON NAMES - Modify only if needed
app_name=$0
app_home=$( cd $(dirname $0) ; pwd -P )
image=$app_home/$app_name.image
st_file=$app_home/$app_name.st

echo Executing $0
echo Working directory $app_home

if [ ! -f "$image" ]; then
	echo $image not found
	exit 1
fi

if [ ! -f "$st_file" ]; then
	echo $st_file not found
	exit 1
fi

echo Starting $app_name
echo "$vm $options $image $st_file"
exec $vm $vm_options $image $st_file