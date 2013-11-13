//
//  SMTagField.h
//
//  Created by Shai Mishali on 6/16/13.
//  Copyright (c) 2013 Shai Mishali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMTag.h"
#import "SMTagFieldDelegate.h"
#import "SMAccessoryView.h"
/**
 SMTagField is an implementation of UITextField that allows for easy input/display of tags
 */
@interface SMTagField : UITextField <SMAutoComplete>

/**
 The tags array, contains all of the tags. Can be set manually
 */
@property (nonatomic, strong) NSArray *tags;

/**
  An array of seprators to determine what seperates a tag, defaults to " " and ",".
 */
@property (nonatomic, strong) NSArray *tagSeparators;


/** 
    Method to setup autocomplete field in input accessary view, must also implement delegate method
 */
-(void)setupAutoComplete;

/**
 The SMTagField Delegate. See documentation above
 */
@property (unsafe_unretained) id<SMTagFieldDelegate> tagDelegate;

@end