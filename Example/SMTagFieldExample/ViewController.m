//
//  ViewController.m
//  SMTagFieldExample
//
//  Created by Shai Mishali on 6/19/13.
//  Copyright (c) 2013 Shai Mishali. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor   = [UIColor grayColor];
    
    log.editable                = NO;
    tagField.tagDelegate        = self;
    [tagField setupAutoComplete];
    
    tagField.tags               = @[@"Tag1", @"Tag2", @"Tag3"];
}

#pragma mark - SMTagField delegate
-(void)tagField:(SMTagField *)_tagField tagAdded:(NSString *)tag{
    log.text                = [log.text stringByAppendingFormat:@"\nTag Added: %@", tag];
    [log scrollRangeToVisible: NSMakeRange(log.text.length - 1, 1)];
}

-(void)tagField:(SMTagField *)_tagField tagRemoved:(NSString *)tag{
    log.text                = [log.text stringByAppendingFormat:@"\nTag Removed: %@", tag];
    [log scrollRangeToVisible: NSMakeRange(log.text.length - 1, 1)];
}

-(BOOL)tagField:(SMTagField *)_tagField shouldAddTag:(NSString *)tag{
    // Limits to a maximum of 5 tags and doesn't allow to add a tag called "cat"
    if(_tagField.tags.count >= 5 ||
       [[tag lowercaseString] isEqualToString: @"cat"])
        return NO;
    
    return YES;
}

-(NSArray *)tagField:(SMTagField *)tagField autoCompleteTagsForTextEntered:(NSString *)text {
    return @[@"AutoTag1", @"AutoTag2", @"AutoTag3"];
}

@end