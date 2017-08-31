# hexo-theme-snippet
Snippet 简洁而不简单，也许是一款你寻找已久的hexo主题

[在线预览 Preview](http://shenliyang.github.io)

![hexo-theme-snippet](http://7xpw2b.com1.z0.glb.clouddn.com/hexo-sinppet/img/snippet-screenshots.png)


## Features | 特点

- [x] 原生JavaScript实现
- [x] 样式支持CSS预处理器Less，方便主题自定义
- [x] 文章过期提醒功能
- [x] 网站公告功能
- [x] 首页图片懒加载
- [x] 首页文章缩略图自动检索文章内图片，支持自动随机图片
- [x] 支持响应式
- [x] 对IE浏览器的检测和警告
- [x] 评论系统支持友言和Gitment
- [x] 版权信息可配置
- [x] 支持网站统计和文章推送
- [x] 移动端的简洁设计
- [x] 支持代码高亮并支持自定义高亮样式



##  Install | 安装前准备


**如果你在此之前使用的是 `Hexo 2.x` 版本，为了避免未知的错误，请备份好数据，或者建立新的博客目录**


### Prerequisites | 环境搭建

`Node.js` 环境、`Git` 环境以及 `Hexo` ,如果你尚未安装或者不了解 `Hexo`，请参考 [官方教程](https://hexo.io/zh-cn/docs/index.html) 进行了解以及安装。

### Dependencies | 安装依赖

因为 **hexo-theme-snippet** 使用了 `ejs` 模版引擎 、 `Less` CSS预编译语言以及在官方插件的基础上
进行功能的开发，依赖必不可少。

``` bash
    npm install hexo-renderer-ejs --save
    npm install hexo-renderer-less --save
    npm install hexo-deployer-git --save
```

### Download | 下载主题文件

有两种方式下载主题--下载 `*.zip` 文件和通过 `git` ，无论哪种方式请确认下载的文件目录和博客站点的theme子目录中的landscape
目录同一个级别，如下：

``` bash
    .
    ├── landscape
    └── snippet
```

### Configure | 配置

接下来就是配置的问题了，分为主题配置和站点配置，主要是主题配置。

#### Theme Configure | 主题配置

各个设置项均在以下的主题文件中以注释的形式进行说明：

``` yaml

# layout -- 布局相关
# language: zh-CN 默认语言

## menu -- 导航菜单显示{[@page:名字/*多语言支持*/,@url:地址,@icon:显示的图标],[...]}
menu:
- page: home
  url: /
  icon: fa-home
- page: Html5
  url: /categories/html5/
  icon: 
- page: vue
  url: /categories/vue/
  icon: 
- page: JavaScript
  url: /categories/javascript/
  icon: 


## favicon -- 网站图标位置{@favicon}
favicon: /favicon.ico

## rss --rss文件位置{@rss}
rss: /atom.xml

## 通用时间格式化
date_format: YYYY-MM-DD HH:mm:ss

## widgets -- 6个左边小工具{@widgets:[notification,category,archive,tagcloud,friends]}
widgets:
- notification 
- category
- archive
- tagcloud
- friends


# 各个小工具的设置

## notification config --网站公告设置,支持 html 和 纯文本
notification: |- 
            <p>主题Snippet v1.0.0版本即将上线，敬请期待~！<br>
            主题作者：<a href="https://github.com/snippet"
            title="fork me" target="_blank">Snippet</a></p>

## 文章分类设置{@cate_config:{@show_count:是否显示数字，@show_current: 是否高亮当前category}}
cate_config:
   show_count: true
   show_current: true

## 文章归档设置{@arch_config:/*参数参考：https://hexo.io/zh-cn/docs/helpers.html#list-archives*/}
arch_config:
   type: 'monthly'
   show_count: true
   order: -1

## 彩色标签云设置{@tagcloud_config:/*https://hexo.io/zh-cn/docs/helpers.html#tagcloud*/}
tagcloud_config:
   min_font: 1
   max_font: 1
   unit: em
   amount: 100
   color: true
   orderby: 'count'

## 友链设置{@links:[,,,]}
links:
- 主题作者: http://www.shenliyang.com


# 自定义内容设置

### 添加版权保护{@archiveCopyright: {enable:是否开启,tip:提示信息}}
archiveCopyright:
  enable: true
  tip: '商业转载请联系作者获得授权,非商业转载请注明出处 © Snippet'


## 当无目录时的显示文字，默认为'无'
noCategoryText: '无'

## 过低版本的浏览器提醒文字
outdated_browser_text: '你使用的浏览器版本过低，为了你更好的阅读体验，请更新浏览器的版本或者使用其他现代浏览器，比如Chrome、Firefox、Safari等。'

## 文章过期提醒功能 {@warning:{days:临界天数,text:提醒文字/*%d为过期总天数占位符*/}}
warning:
  days: 300 
  text: '本文于%d天之前发表，文中内容可能已经过时。'
  
  
### 首页文章简介的图片
### 规则:Front-matter中的自定义'img'字段 > 文章内的图片(随机获取) > defaultImgs(随机获取) 
  
## 自定义随机图片
defaultImgs:
  - http://www.example.jpg
  - /img/default-1.jpg
  
## 懒加载图片占位符
placeholder: http://via.placeholder.com/220x160


### 截取文章首页描述字数
excerptLength: 120


## 代码高亮配置{@highlightTheme:/*参考网站：https://cdnjs.com/libraries/highlight.js*/}
## 配置主题名称，例如：monokai-sublime，vs2015,默认为default
highlightTheme: default


## 版权声明文字，支持html/text，但不要使用<li>标签
cc: |-
      <a href="https://creativecommons.org/licenses/by-nc-nd/3.0/" target="_blank">
      知识共享署名-非商业性使用-禁止演绎 3.0 未本地化版本许可协议（CC BY-NC-ND 3.0）
      </a>


## 主题评论
### gitment
gitment:
  enable: false
  owner: 
  repo: 
  client_id: 
  client_secret: 
  labels: 
  perPage: 
  maxCommentHeight:
  
###友言评论
uyan:
  enable: true
  uyan_id: 1966422


## 网盟CNZZ网站统计 [传送门](http://www.umeng.com/)
cnzz_anaylytics: 

## 百度网站统计 [传送门](https://tongji.baidu.com/)
baidu_anaylytics: 

## 百度文章推送 [传送门](http://zhanzhang.baidu.com)
baidu_push:

## ICON配置
fontAwesome: //cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css

#网站主题配置
since: 2017
robot: 'all' ### 控制搜索引擎的抓取和索引编制行为，默认为all，搜索 `meta name="robots"` 或请参考： https://support.google.com/webmasters/answer/79812?hl=zh-Hans
version: 1.0.0


```



### Run | 运行预览

``` bash
    hexo clean && hexo g && hexo s -p 4000
```

监听4000端口，使用浏览器打开地址`http://localhost:4000`进行预览。

**Tips:**

如果你为了更好地写博客，推荐两个Hexo插件：`hexo-browsersync` 和 `hexo-admin`。

``` bash
    npm install hexo-browsersync --save
    npm install hexo-admin --save
```

`hexo-browsersync` 主要用于监听刷新，`hexo-admin` 提供类似后台的功能。

前者无需配置，按照平常启用server预览即可。`hexo-admin` 的使用参考[官方Repo](https://github.com/jaredly/hexo-admin)


## Thanks | 感谢

在设计这款主题的时候参考了好多主题和博客的设计和创意，才能在这么短的时间内成型一个博客主题，真的特别感谢！

## Update log | 重要更新

### V1.0.0

- 提交至官方theme仓库，Snippet主题正式上线

## License

[MIT](/LICENSE)