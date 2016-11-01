//
//  MyViewController.m
//  MyTextField
//
//  Created by hc_hzc on 2016/10/13.
//  Copyright © 2016年 hc_hzc. All rights reserved.
//
//-------------------机型适配------------------------
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;


#import "MyViewController.h"
#import "MyTextField.h"

@interface MyViewController ()
@property (nonatomic, strong)MyTextField *tf;
/***/
@property (nonatomic, strong)UILabel *lab;
@end
@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    [self textFieldTest];
    [self initClick];
}
- (void)textFieldTest{
    //TF背景
    UIView *tfView = [[UIView alloc]initWithFrame:CGRectMake(10, 400, 350, 30)];
    tfView.backgroundColor = [UIColor whiteColor];
    tfView.layer.cornerRadius = 15;
    tfView.layer.masksToBounds = YES;
    [self.view addSubview:tfView];
    //按钮
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(300, 0, 50, 30)];
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(clickedBtn) forControlEvents:UIControlEventTouchUpInside];
    [tfView addSubview:btn];
    
    _lab = [[UILabel alloc]initWithFrame:CGRectMake(30, 180, 350, 30)];
    _lab.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_lab];
    
    
    //==============TF调用示例============================TF调用示例====
    _tf = [[MyTextField alloc]initPlaceholder:@"注意：最多输入8个字符" textFont:15 lengthNum:8 addSubView:tfView];
    _tf.frame = CGRectMake(15, 0, 285, 30);
    //可在此设置UItextField的其他属性
    
    //==============TF调用示例============================TF调用示例====
}

#pragma mark- 用户交互
- (void)initClick{
    WS(ws);
    _tf.upNum = ^(){//开始输入时
        if (iPhone6P) {//如果是iPhone6P系列就将view往上推100
            [UIView animateWithDuration:0.25 animations:^{
                ws.view.transform = CGAffineTransformMakeTranslation(0, -100);
            }];
        }
    };
    
    _tf.downNum = ^(){//点击键盘上的return时
        [ws KBDisappear];
    };
}
- (void)clickedBtn{//点击了按钮
    [self KBDisappear];
    NSLog(@"_tf最终接收的文字====%@",_tf.text);
    _lab.text = _tf.text;
}

#pragma mark- 让键盘消失
-(void)touchesEnded:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event{
    [self KBDisappear];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self KBDisappear];
}
- (void)KBDisappear{//让键盘消失======键盘落下时view还原
    [UIView animateWithDuration:0.25 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, 0);
    }];
    [_tf resignFirstResponder];
}

@end
