//
//  UITagField.h
//
//  Created by Shai Mishali on 6/16/13.
//  Copyright (c) 2013 Shai Mishali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITag.h"
#import "UITagFieldDelegate.h"

/**
 UITagField is an implementation of UITextField that allows for easy input/display of tags
 */
@interface UITagField : UITextField

/**
 The tags array, contains all of the tags. Can be set manually
 */
@property (nonatomic, strong) NSArray *tags;

/**
 The UITagField Delegate. See documentation above
 */
@property (unsafe_unretained) id<UITagFieldDelegate> tagDelegate;

@end