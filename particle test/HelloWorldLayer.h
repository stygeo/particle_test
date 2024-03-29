//
//  HelloWorldLayer.h
//  particle test
//
//  Created by Jeffrey Wilcke on 12/4/12.
//  Copyright Indie Pandas 2012. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "ParticleSystem.h"


// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    ParticleSystem *sun1;
    ParticleSystem *sun2;
    BOOL connected;
    
    BOOL touching;
    CGPoint currentPosition;
    
    ParticleSystem *current;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
