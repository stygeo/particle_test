//
//  ParticleSystem.h
//  particle test
//
//  Created by Jeffrey Wilcke on 12/4/12.
//  Copyright (c) 2012 Indie Pandas. All rights reserved.
//

#import "cocos2d.h"

@interface ParticleSystem : CCParticleSystemQuad <CCTouchOneByOneDelegate>

@property(nonatomic) BOOL debug;

@end
