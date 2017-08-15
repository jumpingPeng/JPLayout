# JPLayout
用缩放的方式做适配  

对布局的一种尝试  

具体做法如下：
1.只需在storyBoard  或者 xib 文件里   关闭 autolayout  选择任何一种尺寸的屏幕。

2.把需要的控件放在指定位置，并设定好尺寸。

3. 在VC中调用
[JPLayout makeView:self.view];
[JPLayout makeFont:self.view];  即可 。


4.适用场景：控件大小是按屏幕尺寸来等比例缩放的。


5.注意事项：不参与缩放的控件 可设定特定tag值 ，具体请看代码。
