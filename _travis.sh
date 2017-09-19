#--------------------------------------------
#!/bin/bash
# author：shenliyang
# site：https://github.com/shenliyang
# slogan：梦想还是要有的，万一实现了呢。
#--------------------------------------------

#定义时间
time=`date +%Y-%m-%d\ %H:%M:%S`

#判断部署结果
if [$TRAVIS_TEST_RESULT eq 0]
then 
	TRAVIS_RESULT = 'successful'
else
    TRAVIS_RESULT = 'broken'

#执行成功
function success(){
   echo "success"
}

#执行失败
function failure(){
   echo "failure"
}

#默认执行
function default(){

  git clone https://${GH_REF} .deploy_git
  cd .deploy_git

  git checkout master
  cd ../

  mv .deploy_git/.git/ ./public/
  cd ./public

cat <<EOF >> README.md 
部署状态 | 集成结果
---|---
完成时间 | $time
部署环境 | $TRAVIS_OS_NAME + $TRAVIS_NODE_VERSION
部署类型 | $TRAVIS_EVENT_TYPE
构建仓库 | $TRAVIS_REPO_SLUG
Job ID   | $TRAVIS_JOB_ID
Job NUM  | $TRAVIS_JOB_NUMBER
提交分支 | $TRAVIS_COMMIT 
提交信息 | $TRAVIS_COMMIT_MESSAGE 
部署结果 | TRAVIS_RESULT
EOF

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

