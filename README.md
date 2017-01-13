# CC视频Bug复现
这个XCode项目是为了帮助CC视频的朋友复现一个Bug。这个Bug很可能会导致CC视频的JS在实施苹果App Transport Security政策的iOS应用中无法播放。

# Bug复现
git clone这个项目后，用Xcode打开:

1. 首先在模拟器上运行这个项目，可以看到两个视频都能正常播放。第一个视频是使用CC视频的JS接口，第二个视频是直接采用了HTML 5的视屏标签。

2. 找一台运行iOS 10的iPhone手机，连接Mac，然后用Xcode将这个项目Build到手机上运行。可以看到第一个视频无法播放，而第二个可以正常播放。

# 这个Bug的影响
苹果的新规虽然目前推迟强制实施，但是很多开发者可能已经在新版本中自己实施了。比如微信如果也实施了这个规定，那么朋友圈里面分享的所有CC视频的链接都将无法打开了。

# Demo.html
这个就是一个HTML文件，可以随便修改，添加自己的测试进去。

# info.plist
可以看到最上面有个App Transport Security Settings，下面有两个选项。

第一个选项Allow Arbitrary Loads如果设为YES，则表示这个App允许加载HTTP的资源。

第二个选项Allow Arbitrary Loads in Web Content如果设为YES，则表示这个App允许Web View加载HTTP的资源。

如果苹果开始强制实施App Transport Security的新规，他们将禁止开发者单独将第一个设为YES。但是他们允许开发者将两个选项同时设为YES。

如果两个选项同时设为YES：

1. 在iOS10及以上的设备中，第一个选项等同于NO。体现为应用的Web View可以加载HTTP，但是其他组件不允许加载HTTP。

2. 在较早的设备中，应用的所有组件都可以加载HTTP。

综上所述，如果有任何进一步问题，请随时问FT中文网的联系人。
