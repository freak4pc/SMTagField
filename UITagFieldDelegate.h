//
//  UITagFieldDelegate.h
//
//  Created by Shai Mishali on 6/16/13.
//  Copyright (c) 2013 Shai Mishali. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UITagField;
@protocol UITagFieldDelegate <NSObject>

@optional

/**
 Called by delegate when a specific tag was added
 
 @param tagField The Tag Field
 @param tag The tag
 */
-(void) tagField: (UITagField *) tagField tagAdded: (NSString *) tag;

/**
 Called by delegate when a specific tag was removed
 
 @param tagField The Tag Field
 @param tag The tag
 */
-(void) tagField: (UITagField *) tagField tagRemoved: (NSString *) tag;

/**
 Called by delegate when any change to the tags occured (add/remove)
 
 @param tagField The Tag Field
 @param tag The tag
 */
-(void) tagField: (UITagField *) tagField tagsChanged: (NSArray *) tags;

@end