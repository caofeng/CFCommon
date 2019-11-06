### Cocopods 公有库制作



##### 一、创建Cocopods账号

```
pod trunk register GitHub_email 'user_name' --verbose

注册之后Cocopods会发送确认邮件到邮箱，确认即可注册成功。

检查注册信息：

pod trunk me
```



##### 二、创建项目

```
pod lib create CFCommon(项目名)

What platform do you want to use?? [ iOS / macOS ]?
> iOS
What language do you want to use?? [ Swift / ObjC ]?
> Swift
Would you like to include a demo application with your library? [ Yes / No ]?
> Yes
Which testing frameworks will you use? [ Quick / None ]?
> None
Would you like to do view based testing? [ Yes / No ]?
> NO

```

执行至此，项目自动打开，编辑 xxx.podspec 文件

```
Pod::Spec.new do |s|
  s.name             = 'CFCommon'  -- 项目名称
  s.version          = '0.0.1' 	--  版本号
  s.summary          = '基础工具.' -- 简要描述

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/caofeng/CFCommon'  -- 个人主页
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'caofeng' => 'caofeng@topband.com.cn' }
  s.source           = { :git => 'https://github.com/caofeng/CFCommon.git', :tag => s.version.to_s }  --- 仓库地址，先去GitHub 创建个项目，
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0' -- 最低支持IOS系统版本
  s.swift_version = '5.0'  -- Swift 版本
  s.source_files = 'CFCommon/Classes/**/*'  -- 代码位置
  s.requires_arc = true  -- 启用ARC
  
  # s.resource_bundles = {
  #   'CFCommon' => ['CFCommon/Assets/*.png']
  # } -- 资源文件地址

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit' -- 支持的框架
  # s.dependency 'AFNetworking' -- 依赖库

```



至此，podspec 文件基本编辑结束(可根据自己的需要编辑，以上只是模板)

接下来进入项目跟目录 验证本地 podspec 文件是否正确

```
pod lib lint  或者 pod lib lint --allow-warnings

最后输出绿色文字
CFCommon passed validation.
即表示本地文件验证通过
```

接下来把本地项目推送到 Github 

```
git remote add origin https://github.com/caofeng/CFCommon.git 
这个地址就是 podspec文件中的 s.source 中的地址，之后再：
git push -u origin master
```

之后从GitHub把项目拉取下来并打 tag 0.0.1( 和podspec文件中的s.version 相同) 推送到远程 （此步不可缺省）

验证远程 xxx.podspec 文件

```
最后输出绿色文字
CFCommon passed validation.
即表示远程文件验证通过
```

最后提交pod和检查库

```
pod trunk push xx.podspec --allow-warnings   -- 这个过程比较久
即可成功
在其他项目中就可以 pod 'CFCommon' 使用了.
```











