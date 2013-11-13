//
//  SMAccessoryView.h
//  SMTagFieldExample
//
//  Created by Yaakov Shurpin on 11/12/13.
//  Copyright (c) 2013 Shai Mishali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMTag.h"

@protocol SMAutoComplete <NSObject>

-(void)autoCompleteTagTapped:(SMTag *)tag;

@end

@interface SMAccessoryView : UIView

/**
 The tags array, should be returned to SMTagField by its delegate
 */
@property (nonatomic, strong) NSArray *tags;


@property (weak, nonatomic) id <SMAutoComplete> delegate;

@end
