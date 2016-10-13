//
//  MyTextField.m
//  TF里的按钮
//
//  Created by hc_hzc on 2016/10/13.
//  Copyright © 2016年 hc_hzc. All rights reserved.
//封装了textField,简单的创建即可通过.text方式获取输入的文字，增加了View上推及落下的问题

#import "MyTextField.h"

@interface MyTextField(){
    NSInteger _lengthNum;//限制的字数
}
@end
@implementation MyTextField
#pragma mark- init初始化
//输入提示、输入的字号、最多输入lengthNum个字、将textField添加到subView上
- (instancetype)initPlaceholder:(NSString *)placeholderStr  textFont:(float)font lengthNum:(NSInteger)lengthNum addSubView:(id)subView{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        self.textColor = [UIColor blackColor];
        self.font = [UIFont systemFontOfSize:font];
        self.placeholder = placeholderStr;
        self.clearButtonMode = UITextFieldViewModeAlways;
        _lengthNum = lengthNum;
        [subView addSubview:self];
        [self addTarget:self action:@selector(reTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        self.delegate = self;
    }
    return self;
}

#pragma mark- UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    self.upNum();
}
- (void)reTextFieldDidChange:(UITextField *)textField{//输入文本时调用
    UITextRange *selectedRange = [textField markedTextRange];
    NSString * newText = [textField textInRange:selectedRange];
    if(newText.length>0) return;
    //解决联想输入的问题
    if (textField.text.length > _lengthNum) {
        textField.text = [textField.text substringToIndex:_lengthNum];
    }
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return (textField.text.length - range.length + string.length) <= _lengthNum;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
        self.text = textField.text;
}

#pragma mark- 让键盘消失
- (BOOL)textFieldShouldReturn:(UITextField *)textField{//点击了return键
    self.downNum();
    return YES;
}

@end
