//
//  ViewController.m
//  折纸动画
//
//  Created by 黄文海 on 16/3/22.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "ViewController.h"
@interface ViewController (){
    UIButton*button;
    CALayer *layer;
    CALayer*layer1;
    CAGradientLayer*shadomLayer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    layer=[CALayer layer];
    layer.frame=CGRectMake(80, 140, 250, 200);
    layer.contents=(__bridge id _Nullable)([UIImage imageNamed:@"icon0.jpg"].CGImage);
    layer.contentsRect=CGRectMake(0, 0, 1, 0.5);
    layer1=[CALayer layer];
    layer.backgroundColor=[UIColor redColor].CGColor;
    layer1.frame=CGRectMake(80,140, 250, 200);
    NSLog(@"%f %f",layer.position.x,layer.position.y);
    layer1.contents=(__bridge id _Nullable)([UIImage imageNamed:@"icon0.jpg"].CGImage);
    layer1.contentsRect=CGRectMake(0, 0.5, 1, 0.5);
    [self.view.layer addSublayer:layer1];
    [self.view.layer addSublayer:layer];
    layer.anchorPoint=CGPointMake(0.5, 1);///决定哪个点显示在position上
    NSLog(@"%f %f",layer.frame.origin.x,layer.frame.origin.y);
    
    layer1.anchorPoint=CGPointMake(0.5, 0);
    
    UIPanGestureRecognizer*pan=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    UIView*view1=[[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 400)];
    view1.backgroundColor=[UIColor clearColor];
    [view1 addGestureRecognizer:pan];
    [self.view addSubview:view1];
    shadomLayer=[CAGradientLayer layer];
    shadomLayer.colors=@[(id)[UIColor clearColor],(id)[UIColor blackColor].CGColor];
    shadomLayer.frame=layer.bounds;
    shadomLayer.opacity=0;
    [layer1 addSublayer:shadomLayer];
    
}

-(void)pan:(UIGestureRecognizer *)sender{
    NSLog(@"kkk");
    
    
    UIPanGestureRecognizer*pan=(UIPanGestureRecognizer*)sender;
    
    if(pan.state==UIGestureRecognizerStateEnded)
    {
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:3 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            layer.transform=CATransform3DIdentity;
            shadomLayer.opacity=0;
        } completion:nil];
    }
    else
    {
        CGPoint transP=[pan translationInView:self.view];
        CATransform3D transform3D=CATransform3DIdentity;
        transform3D.m34=-1/1000.0;
        CGFloat angle=-transP.y/200*M_PI;
        layer.transform=CATransform3DRotate(transform3D, angle, 1, 0, 0);
        shadomLayer.opacity=transP.y*1/200.0;
        
    }
    
}




-(void)viewWillLayoutSubviews{
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
