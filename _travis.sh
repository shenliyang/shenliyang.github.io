#!/bin/bash

#定义时间
time=`date +%Y-%m-%d\ %H:%M:%S`

function success(){
   echo "success"
}

function failure(){
   echo "failure"
}
function default(){

  git clone https://${GH_REF} .deploy_git
  cd .deploy_git

  git checkout master
  cd ../

  mv .deploy_git/.git/ ./public/
  cd ./public

cat <<EOF >> README.md 
持续集成 | 集成结果
---|---
完成时间 | $time
完成状态 | passing
     
EOF

  cat README.md

  git init
  git config user.name "shenliyang"
  git config user.email ""
  git add .
  git commit -m "Build by Travis CI"
  git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:master
} 


case $1 in 
    "success")
	     success
       ;;
    "failure")
	     failure
	     ;;
	         *) 
       default	
esac

