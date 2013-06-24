//
//  UITagField.m
//
//  Created by Shai Mishali on 6/16/13.
//  Copyright (c) 2013 Shai Mishali. All rights reserved.
//

#import "UITagField.h"

@interface UITagField(){
    UIView              *tagsView;
    UIView              *paddingView;
}

-(void) layoutTags;

@end

@implementation UITagField
@synthesize tags;
@synthesize tagDelegate;

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame: CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 30)]) {
        self.backgroundColor        = [UIColor whiteColor];
        self.opaque                 = NO;
        self.autocorrectionType     = UITextAutocorrectionTypeNo;
        tags                        = @[];  
    
        tagsView                    = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 0, 0)];
        tagsView.backgroundColor    = [UIColor clearColor];
        
        paddingView                 = [[UIView alloc] initWithFrame: CGRectMake(0, 0, 0, 20)];
        paddingView.backgroundColor = [UIColor clearColor];
        paddingView.opaque          = NO;
        
        self.leftView               = paddingView;
        self.leftViewMode           = UITextFieldViewModeAlways;

        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(textFieldDidChange:)
                                                      name:@"UITextFieldTextDidChangeNotification"
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(textFieldDidEndEditing:)
                                                     name:@"UITextFieldTextDidEndEditingNotification"
                                                   object:nil];
        
        [self addSubview: tagsView];
    }
    
    return self;
}

-(void)setFrame:(CGRect)frame{
    super.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 30);
}

- (CGRect) textRectForBounds: (CGRect) bounds
{
    CGRect origValue = [super textRectForBounds: bounds];
    
    return CGRectOffset(origValue, 0.0f, 3.0f);
}

- (CGRect) editingRectForBounds: (CGRect) bounds
{
    CGRect origValue = [super textRectForBounds: bounds];
    
    return CGRectOffset(origValue, 0.0f, 3.0f);
}

- (void)textFieldDidChange:(NSNotification*)aNotification
{
    if(self.text.length == 0) return;
    
    unichar lastChar    = [self.text characterAtIndex: self.text.length - 1];
    
    if(lastChar == ' ' ||
       lastChar == ','){
        NSString *txtTag= [self.text substringToIndex: self.text.length - 1];
        
        if(txtTag.length == 0){
            self.text   = @"";
            return;
        }
        
        if([tags indexOfObject: txtTag] == NSNotFound){
            NSMutableArray *muteTags = [tags mutableCopy];
            [muteTags addObject: txtTag];
            tags = muteTags;
            
            if([tagDelegate respondsToSelector: @selector(tagField:tagAdded:)]){
                [tagDelegate tagField:self tagAdded:txtTag];
            }
            
            [self layoutTags];
        }
        
        self.text       = @"";
    }
}

- (void)textFieldDidEndEditing:(NSNotification*)aNotification{
    if(self.text.length > 0)
        self.text = [self.text stringByAppendingString:@" "];
    
    [self textFieldDidChange: aNotification];
}

-(void)deleteBackward{
    if(tags.count > 0 && self.text.length == 0){
        if([tagDelegate respondsToSelector:@selector(tagField:tagRemoved:)]){
            NSString *lastTag = [tags lastObject];
            [tagDelegate tagField:self tagRemoved: lastTag];
        }
        
        NSMutableArray *muteTags = [tags mutableCopy];
        [muteTags removeLastObject];
        tags = muteTags;
        
        [self layoutTags];
    }
    
    [super deleteBackward];
}

-(void)layoutTags{    
    [tagsView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGRect tagsFrame        = tagsView.frame;
    tagsFrame.size          = CGSizeMake(0, 0);
    tagsView.frame          = tagsFrame;
    
    CGRect paddingFrame     = paddingView.frame;
    paddingFrame.size.width = 0;
    paddingView.frame       = paddingFrame;
    
    for(NSString *txtTag in tags){
        UITag *tag              = [[UITag alloc] initWithTag: txtTag];
        
        [tag addTarget:self action:@selector(tagTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        CGRect tagFrame         = tag.frame;
        tagFrame.origin.x       = tagsView.frame.size.width + 5;
        tagFrame.origin.y       = (self.frame.size.height - tag.frame.size.height) / 2;
        tag.frame               = tagFrame;
        
        tagsFrame               = tagsView.frame;
        tagsFrame.size.width   += (tag.frame.size.width + 5);
        tagsView.frame          = tagsFrame;
        
        paddingFrame            = paddingView.frame;
        paddingFrame.size.width = (tagsView.frame.size.width + 5);
        paddingView.frame       = paddingFrame;
        
        [tagsView addSubview: tag];
    }

    // If there's not enough room, free up first tags and reposition next ones
    CGFloat missingWidth= (tagsView.frame.size.width - self.frame.size.width + 40);

    if(missingWidth > 0){
        // Remove old tags
        for(UITag *tag in tagsView.subviews){
            if(missingWidth < 0)
                break;
            
            missingWidth -= tag.frame.size.width;
            
            [tag removeFromSuperview];
        }
        
        tagsFrame                   = tagsView.frame;
        paddingFrame                = paddingView.frame;
        
        tagsFrame.size.width        = 0;
        paddingFrame.size.width     = 0;
        
        tagsView.frame              = tagsFrame;
        paddingView.frame           = paddingFrame;
        
        // Reposition
        for(UITag *tag in tagsView.subviews){
            CGRect tagFrame         = tag.frame;
            tagFrame.origin.x       = tagsView.frame.size.width + 5;
            tagFrame.origin.y       = (self.frame.size.height - tag.frame.size.height) / 2;
            tag.frame               = tagFrame;
            
            tagsFrame               = tagsView.frame;
            tagsFrame.size.width   += (tag.frame.size.width + 5);
            tagsView.frame          = tagsFrame;
            
            paddingFrame            = paddingView.frame;
            paddingFrame.size.width = (tagsView.frame.size.width + 5);
            paddingView.frame       = paddingFrame;
            
            [tagsView addSubview: tag];
        }
    }
    
    if([tagDelegate respondsToSelector:@selector(tagField:tagsChanged:)])
        [tagDelegate tagField: self tagsChanged: tags];
}

-(void)setTags:(NSArray *)aTags{
    tags = aTags;
    [self layoutTags];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"UITextFieldTextDidChangeNotification" object:nil];
}

@end