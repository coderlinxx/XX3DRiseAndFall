# XX3DRiseAndFall
通过 ViewController+Category 的方式实现类似电商等项目中控制器在3D方向上的z轴下沉位移效果.

在项目过程中所涉及到的一个需求,效果和天猫京东等的那种控制器下沉,然后具体商品型号类型等的展示view弹出的效果差不多,经过一些研究查阅之后做了一个非常简单的实现,大体效果如下:
![record2.gif](http://upload-images.jianshu.io/upload_images/1717878-706406afe9762662.gif?imageMogr2/auto-orient/strip)

实现方式是通过 ViewController+Category 的方式实现的,用分类的方式来实现不会对原有类产生任何影响.

动画过程全都是以CATransform3D类来实现的,大体想法是以z轴为主要划分轴,在x轴上来绕z轴转动,将下沉和上升的动画都区分成了两段动画,以下沉为例来分析:

第一段动画为视图绕x轴在z轴上的下沉过程:

![record4.gif](http://upload-images.jianshu.io/upload_images/1717878-88feddf921f6a746.gif?imageMogr2/auto-orient/strip)


动画过程核心代码:
```
- (CATransform3D)firstTransformType:(TransformType)type{
    
    CATransform3D t1 = CATransform3DIdentity;
    CGFloat m = 1.0/-900;
    switch (type) {
        case TransformTypeM32:
            t1.m32 = m;
            break;
        default:
            t1.m34 = m;
            break;
    }
    
    //缩放
    t1 = CATransform3DScale(t1, 0.95, 0.95, 1);
    //绕x轴旋转
    t1 = CATransform3DRotate(t1, 15.0 * M_PI/180.0, 1, 0, 0);
    return t1;
    
}
```

第二段动画为视图绕x轴在z轴上的上升过程,与第一段连起来做就是如下效果:


![record6.gif](http://upload-images.jianshu.io/upload_images/1717878-d50c6fdfa8e570d6.gif?imageMogr2/auto-orient/strip)


动画过程核心代码:
```
- (CATransform3D)secondTransformType:(TransformType)type{
    
    CATransform3D t2 = CATransform3DIdentity;
    switch (type) {
        case TransformTypeM32:
            t2.m32 = [self firstTransformType:type].m32;
            break;
        default:
            t2.m34 = [self firstTransformType:type].m34;
            break;
    }
    
    //向上移
    t2 = CATransform3DTranslate(t2, 0, self.view.frame.size.height * (-0.08), 0);
    //第二次缩放
    t2 = CATransform3DScale(t2, 0.8, 0.8, 1);
    return t2;
}
```
这样的话一个下沉的效果就完成了,还原的做法正好是把这两段动画反过来,所以就不需要多说了..
PS: 如果不处理导航条的话,在实际应用过程中会出现非常low的当前控制器下沉了,但是导航条没有变化的效果,所以在这里也已经把当前控制器有没有在navigationBar上做了处理
最后效果:

![record8.gif](http://upload-images.jianshu.io/upload_images/1717878-5ead63e249f4de06.gif?imageMogr2/auto-orient/strip)

调用非常的简单,只要在控制器里如下调用就好了:
``
- (IBAction)fallWithNav:(UIButton *)sender {
    [self showWithDuration:0.5 transformType:TransformTypeM32];
}

- (IBAction)riseWithNav:(UIButton *)sender {
    [self closeWithDuration:0.5 transformType:TransformTypeM32];
}
``
