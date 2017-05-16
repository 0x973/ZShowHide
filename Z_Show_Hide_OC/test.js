defineClass('AppDelegate', {
    showClick: function(sender) {
        console.log("显示按钮点击了");
    },
    hideClick: function(sender) {
        console.log("隐藏按钮点击了");
        require("NSAppleScript");

        defineClass("", {
            hideClick: function(sender) {
                var eventDescriptor = null;
                var script = null;
                var scriptSource = 'do shell script "defaults write com.apple.finder AppleShowAllFiles Yes && killall Finder"';
                if (scriptSource) {
                    script = NSAppleScript.alloc().initWithSource(scriptSource);
                    if (script) {
                        eventDescriptor = script.executeAndReturnError(null);
                        if (eventDescriptor) {
                            NSLog("%@", eventDescriptor.stringValue());
                        }
                    }
                }
            }
        },
        {});

    }
});
