# 解决问题

### 简单封装了一个UITextField，简单的创建就可以很好的使用一些功能（字数限制、键盘遮盖上推、输入控制）
#### 1.给UITextField增加了一个字数限制功能，超出规定的字数后不再接收输入的字符
#### 2.当键盘遮住输入框时，可以设置其上推的数值
#### 3.预留开始输入和点击键盘上return按钮的回调

### 主要代码如下：
#### _tf = [[MyTextField alloc]initPlaceholder:@"注意：最多输入8个字符" textFont:15 lengthNum:8 addSubView:tfView];
#### _tf.frame = CGRectMake(15, 0, 285, 30);
#### 
#### _tf.upNum = ^(){//开始输入时
#### 
#### };
#### _tf.downNum = ^(){//点击键盘上的return时
#### 
#### };

![image](https://github.com/biyu6/MyTextField/blob/master/yanshi.gif)
