#!/bin/bash

time=`date +%Y-%m-%d\ %H:%M:%S`

function success(){
   echo "success"
}

function failure(){
   echo "failure"
}
function default(){
   echo "default"
cat <<EOF >> README.md 

EOF

   echo $time
} 


case $1 in 
    "success")
	     success
       ;;
    "failure")
	     failure
	     ;;
	  *) default	
esac

