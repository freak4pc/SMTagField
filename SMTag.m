//
//  SMTag.m
//
//  Created by Shai Mishali on 6/3/13.
//  Copyright (c) 2013 Shai Mishali. All rights reserved.
//

#import "SMTag.h"

@implementation SMTag
@synthesize value;
@dynamic borderColor, font, textColor;

-(id)initWithTag:(NSString *)tag{
    if(self = [super init]){
        self.backgroundColor    = [UIColor colorWithRed:0.7215686275 green:0.7490196078 blue:0.7882352941 alpha:1.0];
        self.titleLabel.font    = [UIFont systemFontOfSize: 11];
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds= YES;
        self.layer.borderColor  = [UIColor colorWithRed:0.5333333333 green:0.6862745098 blue:0.8470588235 alpha:1.0].CGColor;
        self.layer.borderWidth  = 1;
        self.showsTouchWhenHighlighted = YES;
        
        value                   = tag;
        
        [self setTitle:[NSString stringWithFormat:@"    %@    ", tag] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [self sizeToFit];
        
        CGRect selfFrame        = self.frame;
        selfFrame.size.height   = 25;
        self.frame              = selfFrame;
    }
    
    return self;
}

-(void)setValue:(NSString *)aValue{
    [self setTitle:[NSString stringWithFormat:@"    %@    ", aValue] forState:UIControlStateNormal];
    self.value                  = aValue;
}

-(UIColor *)borderColor{
    return [UIColor colorWithCGColor: self.layer.borderColor];
}

-(void)setBorderColor:(UIColor *)borderColor{
    self.layer.borderColor      = borderColor.CGColor;
}

-(UIFont *)font{
    return self.titleLabel.font;
}

-(void)setFont:(UIFont *)font{
    self.titleLabel.font    = font;
}

-(UIColor *)textColor{
    return [self titleColorForState: UIControlStateNormal];
}

-(void)setTextColor:(UIColor *)textColor{
    [self setTitleColor:textColor forState:UIControlStateNormal];
}

@end