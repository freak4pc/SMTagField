//
//  ViewController.h
//  UITagFieldExample
//
//  Created by Shai Mishali on 6/19/13.
//  Copyright (c) 2013 Shai Mishali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITagField.h"

@interface ViewController : UIViewController <UITagFieldDelegate>{
    UITagField  *tagField;
    UITextView  *log;
}

@end
