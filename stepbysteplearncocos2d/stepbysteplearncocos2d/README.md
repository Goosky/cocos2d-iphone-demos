[Apache License, Version 2.0]

Copyright 2012 

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

author:Podevor

Home: http://www.zhucongqi.cn

Step by Step learn Cocos2d
==========================
Test0:Scene and menus
________Scene_______
    A:In this test, you'll learn how Cocos2d helps you divide your game into “scenes,” and how to transition from scene to scene. 
在这个demo中，你可以学习到如何使用cocos2d来独立的构建游戏场景。同时，你还可以学习到在你创建的众多的场景中如何转换它们。
scene 切换方式:
pushScene:just pause the current scene instead and running other scene.then you would call popScene later to terminate the new one, and resume the old.(sparingly).暂停当前的scene(old scene)，用一个新的scene替代当前的scene(later or other scene).当你使用popscene的时候，就可以把最后运行的scene(later or other scene)给终止掉，同时恢复到之前运行的scene(old scene).
popScene:pop the laster scene.最近的一个scene.
runWithScene:start running the given scene. 运行一个scene.
replaceScene:terminates the current scenes, and starts the next one. 终止当前的scene，同时运行下一个scene.
    B:TransitionScene: while the scene replace,use like this:
    [[CCDirector sharedDirector] replaceScene:
	 [CCTransitionFade transitionWithDuration:0.5f scene:[SomeOtherScene scene]]];//fade transition
     
________Menu_______



    
    