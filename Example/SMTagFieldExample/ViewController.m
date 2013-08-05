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
    
    self.view.backgroundColor  = [UIColor grayColor];
    
    tagField                = [[SMTagField alloc] initWithFrame: CGRectMake(20, 20, 280, 0)]; // Height is always 30, you shouldn't modify it.
    tagField.tagDelegate    = self;
    
    log                     = [[UITextView alloc] initWithFrame: CGRectMake(20, 60, 280, 180)];
    log.editable            = NO;
    
    [self.view addSubview: tagField];
    [self.view addSubview: log];
    
    // Set some tags to begin with
    tagField.tags = @[@"Tag1", @"Tag2", @"Tag3"];
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