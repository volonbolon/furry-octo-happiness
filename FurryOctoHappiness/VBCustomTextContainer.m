//
//  VBCustomTextContainer.m
//  FurryOctoHappiness
//
//  Created by Ariel Rodriguez on 16/12/13.
//  Copyright (c) 2013 VolonBolon. All rights reserved.
//

#import "VBCustomTextContainer.h"
#import <CoreText/CoreText.h>

@implementation VBCustomTextContainer

- (BOOL)isAccessibilityElement {
    
    return YES;
    
}

- (NSString *)accessibilityLabel {
    
    return [[self string] string];
    
}

- (void)drawRect:(CGRect)rect
{
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetTextMatrix(ctx, CGAffineTransformIdentity);
    CGContextTranslateCTM(ctx, 0, self.bounds.size.height);
    CGContextScaleCTM(ctx, 1.0, -1.0);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, rect);
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)[self string]);
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, [[self string] length]), path, NULL);
    
    CFRelease(framesetter);
    CFRelease(path);
    
    CTFrameDraw(frame, ctx);
    CFRelease(frame);
    
}

@end
