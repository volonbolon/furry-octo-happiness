//
//  VBCustomTextViewController.m
//  FurryOctoHappiness
//
//  Created by Ariel Rodriguez on 16/12/13.
//  Copyright (c) 2013 VolonBolon. All rights reserved.
//

#import "VBCustomTextViewController.h"
#import "VBCustomTextContainer.h"
#import <CoreText/CoreText.h>

@interface VBCustomTextViewController ()
@property (weak, nonatomic) IBOutlet VBCustomTextContainer *textContainer;
@end

@implementation VBCustomTextViewController

- (void)viewDidLoad
{
    
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)@"Helvetica-Neue", 12.0, NULL);
    NSDictionary *attrDictionary = [NSDictionary dictionaryWithObjectsAndKeys: (__bridge id)fontRef, (NSString *)kCTFontAttributeName, (id)[[UIColor blackColor] CGColor], (NSString *)(kCTForegroundColorAttributeName), nil];
    CFRelease(fontRef);
    
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:@"Nunc dolor velit, rutrum a congue in, bibendum quis erat. Nullam ornare, massa vitae ornare molestie, augue lectus mollis sapien, non volutpat turpis sapien eu nulla. Proin feugiat cursus commodo. Vestibulum egestas purus eget sapien volutpat volutpat. Vivamus varius quam quis mattis tincidunt. Maecenas tempus imperdiet ante, eget ullamcorper turpis lacinia in. Ut lectus libero, imperdiet non lectus imperdiet, consequat molestie erat. Duis nisl nibh, pulvinar ac porta sit amet, eleifend sit amet ligula. Fusce quis metus dapibus, feugiat risus et, gravida neque. Fusce quis porttitor magna. Quisque pharetra odio in est elementum, aliquet semper leo sollicitudin. Donec vitae ante vehicula, vehicula nisi et, dictum sem. Pellentesque ac lorem non nisi scelerisque dapibus."
                                                                           attributes:attrDictionary];
    [[self textContainer] setString:attributedString];
    
}

@end
