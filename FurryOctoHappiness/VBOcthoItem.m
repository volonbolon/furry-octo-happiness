//
//  VBOcthoItem.m
//  FurryOctoHappiness
//
//  Created by Ariel Rodriguez on 16/12/13.
//  Copyright (c) 2013 VolonBolon. All rights reserved.
//

#import "VBOcthoItem.h"

@implementation VBOcthoItem
- (id)initWithTitle:(NSString *)title
               path:(UIBezierPath *)path
{
    
    self = [super init];
    
    if ( self != nil) {
        
        _title = title;
        _path = path;
        
    }
    
    return self;
    
}
@end
