//
//  VBAccessibilityContainerView.m
//  FurryOctoHappiness
//
//  Created by Ariel Rodriguez on 16/12/13.
//  Copyright (c) 2013 VolonBolon. All rights reserved.
//

#import "VBAccessibilityContainerView.h"
#import "VBOcthoItem.h"
#import "UIColor+RandomColor.h"

@interface VBAccessibilityContainerView ()
@property (strong) NSArray *items;
@property (nonatomic, strong) NSArray *accessibilityElements;
@end

@implementation VBAccessibilityContainerView
- (BOOL)isAccessibilityElement {
    
    return NO;
    
}

- (NSArray *)accessibilityElements
{
    if ( _accessibilityElements == nil ) {
        NSMutableArray *ae = [NSMutableArray array];
        
        // Create accessibility elements
        
        [[self items] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            UIAccessibilityElement *accessibilityElement = [[UIAccessibilityElement alloc] initWithAccessibilityContainer:self];
            [accessibilityElement setAccessibilityLabel:[(VBOcthoItem *)obj title]];
            [accessibilityElement setAccessibilityPath:UIAccessibilityConvertPathToScreenCoordinates([(VBOcthoItem *)obj path], self)];
            
            [ae addObject:accessibilityElement];
            
        }];
        
        _accessibilityElements = ae;

    }
    
    return _accessibilityElements;

}

- (NSInteger)accessibilityElementCount
{
    
    NSInteger accessibilityElementCount = [[self accessibilityElements] count];
    
    return accessibilityElementCount;
    
}

- (id)accessibilityElementAtIndex:(NSInteger)index
{
    
    return [[self accessibilityElements] objectAtIndex:index];
    
}

- (NSInteger)indexOfAccessibilityElement:(id)element
{
    
    return [[self accessibilityElements] indexOfObject:element];
    
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if ( self != nil ) {
        
        CGRect roundedSquareFrame = CGRectMake(55.0, 135.0, 50.0, 50.0);
        UIBezierPath *roundedCornerSquarePath = [UIBezierPath bezierPathWithRoundedRect:roundedSquareFrame
                                                     byRoundingCorners:UIRectCornerAllCorners
                                                           cornerRadii:CGSizeMake(15.0, 15.0)];
        VBOcthoItem *octoRoundedCornerSquare = [[VBOcthoItem alloc] initWithTitle:NSLocalizedString(@"Rounded Corner Square", nil)
                                                                path:roundedCornerSquarePath];
        
        
        CGRect circleFrame = CGRectMake(215, 135.0, 50.0, 50.0);
        UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:circleFrame];
        VBOcthoItem *octoCircle = [[VBOcthoItem alloc] initWithTitle:NSLocalizedString(@"Circle", nil)
                                                                             path:circlePath];
        
        
        _items = @[octoRoundedCornerSquare, octoCircle];
        
    }
    
    return self;
    
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
        
    for ( VBOcthoItem *item in [self items] ) {
        
        CGContextSetFillColorWithColor(ctx, [[UIColor randomColor] CGColor]);
        [[item path] fill];
        
    }
    
}

@end
