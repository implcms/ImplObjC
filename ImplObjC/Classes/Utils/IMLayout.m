//
//  IMLayout.m
//  ImplObjC
//
//  Created by GheniAblez on 2022/7/3.
//

#import "IMLayout.h"
#import "IMUtils.h"

@implementation IMLayout

- (instancetype)initWithView:(UIView *)view;
{
    self = [super init];
    if (self) {
        self.view = view;
        view.translatesAutoresizingMaskIntoConstraints = NO;
        self.constraintMaker = [[MASConstraintMaker alloc] initWithView:view];
    }
    return self;
}

+ (IMLayout * (^)(UIView*))layout {
    return ^id(id attribute) {
        return [[IMLayout alloc] initWithView:attribute];
    };
}


#pragma mark right
- (IMLayout * (^)(id attr,CGFloat margin))rightToRightOfMargin{
    return ^id(id attribute,CGFloat margin) {
        return [self rightToRightOfReal:attribute margin:margin];
    };
}

- (IMLayout * (^)(id attr))rightToRightOf{
    return ^id(id attribute) {
        return [self rightToRightOfReal:attribute margin:0];
    };
}

- (IMLayout *)rightToRightOfReal:(UIView *)view margin:(CGFloat)margin{
    if(IMUtils.rtl){
        self.constraintMaker.right.equalTo(view).offset(margin*-1);
    }else{
        self.constraintMaker.left.equalTo(view).offset(margin);
    }
    return self;
}

- (IMLayout * (^)(id attr,CGFloat margin))rightToLeftOfMargin{
    return ^id(id attribute,CGFloat margin) {
        return [self rightToLeftOfReal:attribute margin:margin];
    };
}
- (IMLayout * (^)(id attr))rightToLeftOf{
    return ^id(id attribute) {
        return [self rightToLeftOfReal:attribute margin:0];
    };
}
- (IMLayout *)rightToLeftOfReal:(UIView *)view margin:(CGFloat)margin{
    if(IMUtils.rtl){
        self.constraintMaker.right.equalTo(view.mas_left).offset(margin * -1);
    }else{
        self.constraintMaker.left.equalTo(view.mas_right).offset(margin);
    }
    return self;
}

#pragma mark left
- (IMLayout * (^)(id attr))leftToLeftOf{
    return ^id(id attribute) {
        return [self leftToLeftOfReal:attribute margin:0];
    };
}
- (IMLayout * (^)(id attr,CGFloat margin))leftToLeftOfMargin{
    return ^id(id attribute,CGFloat margin) {
        return [self leftToLeftOfReal:attribute margin:margin];
    };
}

- (IMLayout *)leftToLeftOfReal:(UIView *)view margin:(CGFloat)margin{
    if(IMUtils.rtl){
        self.constraintMaker.left.equalTo(view).offset(margin);
    }else{
        self.constraintMaker.right.equalTo(view).offset(margin * -1);
    }
    return self;
}

- (IMLayout * (^)(id attr))leftToRightOf{
    return ^id(id attribute) {
        return [self leftToRightOfReal:attribute margin:0];
    };
}
- (IMLayout * (^)(id attr,CGFloat margin))leftToRightOfMargin{
    return ^id(id attribute,CGFloat margin) {
        return [self leftToRightOfReal:attribute margin:margin];
    };
}
- (IMLayout *)leftToRightOfReal:(UIView *)view margin:(CGFloat)margin{
    if(IMUtils.rtl){
        self.constraintMaker.left.equalTo(view.mas_right).offset(margin);
    }else{
        self.constraintMaker.right.equalTo(view.mas_left).offset(margin * -1);
    }
    return self;
}


#pragma mark center
- (IMLayout * (^)(id attr))center{
    return ^id(id attribute) {
        return [self centerReal:attribute];
    };
}
- (IMLayout *)centerReal:(UIView *)view{
    self.constraintMaker.center.equalTo(view);
    return self;
}

- (IMLayout * (^)(id attr,CGFloat margin))centerXMargin{
    return ^id(id attribute,CGFloat margin) {
        return [self centerXReal:attribute margin:margin];
    };
}
- (IMLayout * (^)(id attr))centerX{
    return ^id(id attribute) {
        return [self centerXReal:attribute margin:0];
    };
}
- (IMLayout *)centerXReal:(UIView *)view margin:(CGFloat)margin{
    if(IMUtils.rtl){
        margin = -1 * margin;
    }
    self.constraintMaker.centerX.equalTo(view).offset(margin);
    return self;
}
- (IMLayout * (^)(id attr,CGFloat margin))centerYMargin{
    return ^id(id attribute,CGFloat margin) {
        return [self centerYReal:attribute margin:margin];
    };
}
- (IMLayout * (^)(id attr))centerY{
    return ^id(id attribute) {
        return [self centerYReal:attribute margin:0];
    };
}
- (IMLayout *)centerYReal:(UIView *)view margin:(CGFloat)margin{
    self.constraintMaker.centerY.equalTo(view).offset(margin);
    return self;
}

#pragma mark width
- (IMLayout * (^)(CGFloat width))width{
    return ^id(CGFloat width) {
        return [self widthReal:width margin:0];
    };
}
- (IMLayout *)widthReal:(CGFloat)width margin:(CGFloat)margin{
    self.constraintMaker.width.mas_equalTo(width);
    return self;
}
- (IMLayout * (^)(id attr))widthMatch{
    return ^id(id attr) {
        return [self widthMatchReal:attr margin:0];
    };
}
- (IMLayout * (^)(id attr,CGFloat margin))widthMatchMargin{
    return ^id(id attr,CGFloat margin) {
        return [self widthMatchReal:attr margin:margin];
    };
}
- (IMLayout *)widthMatchReal:(UIView *)view margin:(CGFloat)margin{
    self.constraintMaker.left.equalTo(view).offset(margin);
    self.constraintMaker.right.equalTo(view).offset(margin * -1);
    return self;
}

#pragma mark install
- (NSArray * (^)(void))install{
    return ^id() {
        return [self installReal];
    };
}
- (NSArray *)installReal{
    return [self.constraintMaker install];
}

@end
