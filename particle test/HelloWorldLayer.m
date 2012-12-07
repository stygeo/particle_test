//
//  HelloWorldLayer.m
//  particle test
//
//  Created by Jeffrey Wilcke on 12/4/12.
//  Copyright Indie Pandas 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        touching = NO;
        
        sun1 = [ParticleSystem particleWithFile:@"SmallSun.plist"];
        sun1.position = ccp(40, 40);
        sun1.debug = YES;
		[self addChild:sun1 z:10];
        
        sun2 = [ParticleSystem particleWithFile:@"SmallSun.plist"];
        sun2.position = ccp(300, 300);
        [self addChild:sun2 z:10];
        
        [self setTouchEnabled:YES];
        [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
	}
	return self;
}

-(BOOL)testTouchWithObject:(ParticleSystem *)s point:(CGPoint)p {
    CGPoint pp = s.position;
    
    float dist = sqrt(pow(p.x - pp.x, 2) + pow(p.y - pp.y, 2));
    float radius = 20.0f;
    
    return dist < radius;
}

- (void) draw {
    [super draw];
    
    if(current != nil) {
        ccDrawColor4F(1.0, 1.0, 1.0, 1.0);
        ccDrawLine(current.position, currentPosition);
    }
    
    /*if(touching) {
        glLineWidth(2);
        CGPoint pos = sun2.position;
        
        // Get the distance from touch to sun2
        float dist = sqrt(pow(pos.x - currentPosition.x, 2) + pow(pos.y - currentPosition.y, 2));
        float radius = 30.0f;
        if(dist < radius) {
            ccDrawColor4F(0.0, 1.0, 0.0, 1.0);
            ccDrawLine(sun1.position, sun2.position);
        } else {
            ccDrawColor4F(1.0, 1.0, 1.0, 1.0);
            ccDrawLine(sun1.position, currentPosition);
        }
    }*/
    // Reset
    glLineWidth(1.0);
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    currentPosition = [self convertTouchToNodeSpace:touch];
    
    if([self testTouchWithObject:sun1 point:currentPosition]) {
        current = sun1;
    } else if ([self testTouchWithObject:sun2 point:currentPosition]) {
        current = sun2;
    }
    
    return YES;
}

-(void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    currentPosition = [self convertTouchToNodeSpace:touch];
    touching = YES;
}

-(void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    current = nil;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

@end
