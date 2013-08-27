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
    
    tagField.tags               = @[@"Tag1", @"Tag2", @"Tag3"];
}

#pragma mark - SMTagField delegate
-(void)tagField:(SMTagField *)tagField tagAdded:(NSString *)tag{
    log.text                = [log.text stringByAppendingFormat:@"\nTag Added: %@", tag];
    [log scrollRangeToVisible: NSMakeRange(log.text.length - 1, 1)];
}

-(void)tagField:(SMTagField *)tagField tagRemoved:(NSString *)tag{
    log.text                = [log.text stringByAppendingFormat:@"\nTag Removed: %@", tag];
    [log scrollRangeToVisible: NSMakeRange(log.text.length - 1, 1)];
}

@end