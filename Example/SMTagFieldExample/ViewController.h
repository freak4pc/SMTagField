//
//  ViewController.h
//  SMTagFieldExample
//
//  Created by Shai Mishali on 6/19/13.
//  Copyright (c) 2013 Shai Mishali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMTagField.h"

@interface ViewController : UIViewController <SMTagFieldDelegate>{
    IBOutlet    SMTagField  *tagField;
    IBOutlet    UITextView  *log;
}

@end
