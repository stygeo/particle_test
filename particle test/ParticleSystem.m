//
//  ParticleSystem.m
//  particle test
//
//  Created by Jeffrey Wilcke on 12/4/12.
//  Copyright (c) 2012 Indie Pandas. All rights reserved.
//

#import "ParticleSystem.h"

@implementation ParticleSystem
@synthesize debug;

-(id)initWithFile:(NSString *)plistFile {
    if( (self = [super initWithFile:plistFile]) ) {
        debug = NO;
    }
    
    return self;
}

/*-(void)draw {
    [super draw];
    
    // Particles systems don't seem to have any width/height. This code won't work. 
    if(debug) {
        CGRect rect = [self boundingBox];
        CGPoint verts[4] = {
            ccp(rect.origin.x,                   rect.origin.y),
            ccp(rect.origin.x + rect.size.width, rect.origin.y),
            ccp(rect.origin.x + rect.size.width, rect.origin.y + rect.size.height),
            ccp(rect.origin.x,                   rect.origin.y + rect.size.height)
        };
        
        glLineWidth(2.0f);
        ccDrawColor4F(0.0, 1.0, 0.0, 1.0);
        ccDrawPoly(verts, 4, YES);
    }
}*/

@end
