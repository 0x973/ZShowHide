//
//  AppDelegate.m
//  Z_Show_Hide_OC
//
//  Created by Any on 9/2/16.
//  Copyright © 2016 Any. All rights reserved.
//

#import "AppDelegate.h"
#import "JPEngine.h"
@interface AppDelegate ()
@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    //开启热修复服务
    [JPEngine startEngine];
    //获取js的路径   因为测试所以直接在本地
    NSString *sourcePath = [[NSBundle mainBundle]pathForResource:@"test.js" ofType:nil];
    //获取到js的源代码 准备进行加载
    NSString *script = [NSString stringWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
    //开始用热修复加载js代码
    [JPEngine evaluateScript:script];
//        [JPEngine evaluateScriptWithPath:sourcePath]; //或者这种方式加载
    
}


//show按钮
- (IBAction)showClick:(NSButton *)sender {
    NSAppleEventDescriptor *eventDescriptor = nil;
    NSAppleScript *script = nil;
    NSString *scriptSource = @"do shell script \"defaults write com.apple.finder AppleShowAllFiles Yes && killall Finder\"";
    if (scriptSource)
    {
        script = [[NSAppleScript alloc] initWithSource:scriptSource];
        if (script)
        {
            eventDescriptor = [script executeAndReturnError:nil];
            if (eventDescriptor)
            {
                NSLog(@"%@", [eventDescriptor stringValue]);
            }
        }
    }
}

//hide按钮
- (IBAction)hideClick:(NSButton *)sender {
    //留白什么都不写
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
