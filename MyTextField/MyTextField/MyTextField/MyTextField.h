//
//  MyTextField.h
//  TF里的按钮
//
//  Created by hc_hzc on 2016/10/13.
//  Copyright © 2016年 hc_hzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTextField : UITextField<UITextFieldDelegate>
//输入提示、输入的字号、最多输入lengthNum个字、将textField添加到subView上
- (instancetype)initPlaceholder:(NSString *)placeholderStr  textFont:(float)font lengthNum:(NSInteger)lengthNum addSubView:(id)subView;

/**开始输入时*/
@property (nonatomic, copy)void (^upNum)();
/**正在输入时*/
@property (nonatomic, copy)void (^didChange)();

/**点击return时*/
@property (nonatomic, copy)void (^downNum)();





@end
