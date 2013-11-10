//
//  SMTagFieldDelegate.h
//
//  Created by Shai Mishali on 6/16/13.
//  Copyright (c) 2013 Shai Mishali. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SMTagField;
@protocol SMTagFieldDelegate <NSObject>

@optional

/**
 Called by delegate when a specific tag was added
 
 @param tagField The Tag Field
 @param tag The tag
 */
-(void) tagField: (SMTagField *) tagField tagAdded: (NSString *) tag;

/**
 Called by delegate when a specific tag was removed
 
 @param tagField The Tag Field
 @param tag The tag
 */
-(void) tagField: (SMTagField *) tagField tagRemoved: (NSString *) tag;

/**
 Called by delegate when any change to the tags occured (add/remove)
 
 @param tagField The Tag Field
 @param tag The tag
 */
-(void) tagField: (SMTagField *) tagField tagsChanged: (NSArray *) tags;

/**
 Tells SMTagField whether or not it should add a new tag. This could be used to limit the number of tags or blacklist bad words, etc...
 Defaults to YES if protocol isn't implemented.
 */
-(BOOL) tagField: (SMTagField *) tagField shouldAddTag: (NSString *) tag;

@end