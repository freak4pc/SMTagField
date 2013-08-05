//
//  SMTag.h
//
//  Created by Shai Mishali on 6/3/13.
//  Copyright (c) 2013 Shai Mishali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

/**
 SMTag is a UIButton extension representing a Tag. 
 You can alter the appearance of the SMTag object by using its backgroundColor, borderColor, font and textColor elements.
 */
@interface SMTag : UIButton

-(id)initWithTag: (NSString *) tag;

/** Tag value **/
@property (nonatomic, strong) NSString  *value;

/** Tag border color **/
@property (nonatomic, strong) UIColor   *borderColor;

/** Font used in tag **/
@property (nonatomic, strong) UIFont    *font;

/** Text color of tag **/
@property (nonatomic, strong) UIColor   *textColor;

@end