//
//  IMLayout.h
//  ImplObjC
//
//  Created by GheniAblez on 2022/7/3.
//

#import <Foundation/Foundation.h>
#import <Masonry/Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface IMLayout : NSObject

@property (nonatomic,strong) MASConstraintMaker *constraintMaker;
@property (nonatomic,strong) UIView *view;

+ (IMLayout * (^)(UIView *attr))layout;

- (IMLayout * (^)(id attr,CGFloat margin))rightToRightOfMargin;
- (IMLayout * (^)(id attr))rightToRightOf;
- (IMLayout * (^)(id attr,CGFloat margin))rightToLeftOfMargin;
- (IMLayout * (^)(id attr))rightToLeftOf;

- (IMLayout * (^)(id attr,CGFloat margin))leftToLeftOfMargin;
- (IMLayout * (^)(id attr))leftToLeftOf;
- (IMLayout * (^)(id attr,CGFloat margin))leftToRightOfMargin;
- (IMLayout * (^)(id attr))leftToRightOf;


- (IMLayout * (^)(id attr))center;
- (IMLayout * (^)(id attr))centerX;
- (IMLayout * (^)(id attr,CGFloat margin))centerXMargin;
- (IMLayout * (^)(id attr))centerY;
- (IMLayout * (^)(id attr,CGFloat margin))centerYMargin;


- (IMLayout * (^)(CGFloat width))width;
- (IMLayout * (^)(id attr))widthMatch;
- (IMLayout * (^)(id attr,CGFloat margin))widthMatchMargin;


- (NSArray * (^)(void))install;

@end

NS_ASSUME_NONNULL_END
