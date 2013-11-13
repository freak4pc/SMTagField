//
//  SMAccessoryView.m
//  SMTagFieldExample
//
//  Created by Yaakov Shurpin on 11/12/13.
//  Copyright (c) 2013 Shai Mishali. All rights reserved.
//

#import "SMAccessoryView.h"

@implementation SMAccessoryView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
           [self setupUI];
    }
    return self;
}


@synthesize tags;


-(void)setTags:(NSArray *)aTags{
    tags = aTags;
    [self layoutTags];
}

#pragma mark - View Flow

-(void)awakeFromNib{
    [self setupUI];
    [super awakeFromNib];
}


//mostly a copy of code in SMTagField
#pragma mark - Private Methods
-(void)setupUI{
    self.backgroundColor        = [UIColor whiteColor];
    self.opaque                 = NO;

    
    tags                        = @[];
}

-(void)layoutTags{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGRect tagsFrame        = self.frame;
    tagsFrame.size          = CGSizeMake(0, 30);
    self.frame          = tagsFrame;
    
    
    for(NSString *txtTag in tags){
        SMTag *tag              = [[SMTag alloc] initWithTag: txtTag];
        
        [tag addTarget:self action:@selector(tagTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        CGRect tagFrame         = tag.frame;
        tagFrame.origin.x       = self.frame.size.width + 5;
        tagFrame.origin.y       = (self.frame.size.height - tag.frame.size.height) / 2;
        tag.frame               = tagFrame;
        
        tagsFrame               = self.frame;
        tagsFrame.size.width   += (tag.frame.size.width + 5);
        self.frame          = tagsFrame;
        
        [self addSubview: tag];
    }
    
    // If there's not enough room, free up first tags and reposition next ones
    CGFloat missingWidth= (self.frame.size.width - self.frame.size.width + 40);
    
    if(missingWidth > 0){
        // Remove old tags
        for(SMTag *tag in self.subviews){
            if(missingWidth < 0)
                break;
            
            missingWidth -= tag.frame.size.width;
            
            [tag removeFromSuperview];
        }
        
        tagsFrame                   = self.frame;
        
        tagsFrame.size.width        = 0;
        
        self.frame              = tagsFrame;
        
        // Reposition
        for(SMTag *tag in self.subviews){
            CGRect tagFrame         = tag.frame;
            tagFrame.origin.x       = self.frame.size.width + 5;
            tagFrame.origin.y       = (self.frame.size.height - tag.frame.size.height) / 2;
            tag.frame               = tagFrame;
            
            tagsFrame               = self.frame;
            tagsFrame.size.width   += (tag.frame.size.width + 5);
            self.frame          = tagsFrame;
            
            [self addSubview: tag];
        }
    }
}

-(void)tagTapped:(SMTag *)tag {
    if (self.delegate && [self.delegate respondsToSelector:@selector(autoCompleteTagTapped:)]) {
        [self.delegate autoCompleteTagTapped:tag];
    }
}
         
@end
