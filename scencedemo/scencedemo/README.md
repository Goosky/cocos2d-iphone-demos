[Apache License, Version 2.0]

Copyright 2012 Podevor

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

author:Podevor

Home: http://www.zhucongqi.cn

Step by Step learn Cocos2d
==========================

In this demo, you'll learn how Cocos2d helps you divide your game into “scenes,” and how to transition from scene to scene. 
在这个demo中，你可以学习到如何使用cocos2d来独立的构建游戏场景。同时，你还可以学习到在你创建的众多的场景中如何转换它们。


    ·
    = AppDelegate.m：告诉系统所需要的资源的对应后缀~
	// On iPad HD  : "-ipadhd", "-ipad",  "-hd"，适用于没有黑边高清的Retina屏幕的iPad
	// On iPad     : "-ipad", "-hd"，适用于带有黑边或者不清晰版本的ipad资源
	// On iPhone HD: "-hd"，适用于Retina屏的iPhone
	CCFileUtils *sharedFileUtils = [CCFileUtils sharedFileUtils];
	[sharedFileUtils setEnableFallbackSuffixes:NO];				// Default: NO. No fallback suffixes are going to be used
	[sharedFileUtils setiPhoneRetinaDisplaySuffix:@"-hd"];		// Default on iPhone RetinaDisplay is "-hd"
	[sharedFileUtils setiPadSuffix:@"-ipad"];					// Default on iPad is "ipad"
	[sharedFileUtils setiPadRetinaDisplaySuffix:@"-ipadhd"];	// Default on iPad RetinaDisplay is "-ipadhd"

	// and add the scene to the stack. The director will run it when it automatically when the view is displayed.
    //push 一个scene场景到到director中。
	[director_ pushScene: [IntroLayer scene]]; 
    
    