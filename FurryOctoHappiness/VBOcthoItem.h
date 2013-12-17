//
//  VBOcthoItem.h
//  FurryOctoHappiness
//
//  Created by Ariel Rodriguez on 16/12/13.
//  Copyright (c) 2013 VolonBolon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VBOcthoItem : NSObject
- (id)initWithTitle:(NSString *)title
               path:(UIBezierPath *)path;

@property (strong, readonly) NSString *title;
@property (strong, readonly) UIBezierPath *path;
@end
