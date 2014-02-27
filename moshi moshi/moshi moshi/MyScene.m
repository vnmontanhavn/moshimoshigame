//
//  MyScene.m
//  moshi moshi
//
//  Created by Vinicius Soares Lima on 17/02/14.
//  Copyright (c) 2014 Vinicius Soares Lima. All rights reserved.
//

#import "MyScene.h"
#import "monsterList.h"
@implementation MyScene
BOOL minhavez =YES;

monsters *player ;
monsters *enemy ;

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
//        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
//        
//        myLabel.text = @"Hello, World!";
//        myLabel.fontSize = 30;
//        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
 //                                      CGRectGetMidY(self.frame));
        
  //      [self addChild:myLabel];
        
        
        
        monsterList *Lista = [[monsterList alloc]init];
        CGPoint location = CGPointMake(20, 150);
         player = [Lista getmonster:0 withLine:0];
         enemy = [Lista getmonster:0 withLine:0];
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:[player imagem]];
        
        sprite.position = location;
        sprite.size = CGSizeMake(100, 100);
        
        // SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        SKAction *bing = [SKAction moveBy:CGVectorMake(50, 75) duration:1];
        
        [sprite runAction:[SKAction repeatAction:bing count:1]];
        
        [self addChild:sprite];
        
        CGPoint location2 = CGPointMake(255, 550);
        
        SKSpriteNode *sprite2 = [SKSpriteNode spriteNodeWithImageNamed:[enemy imagem]];
        sprite2.size = CGSizeMake(100, 100);
        sprite2.position = location2;
        
        sprite2.name = @"ele";
        sprite.name = @"eu";
        // SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        SKAction *bong = [SKAction moveBy:CGVectorMake(-30, -45) duration:1];
        
        [sprite2 runAction:[SKAction repeatAction:bong count:1]];
        
        [self addChild:sprite2];
        
        SKLabelNode *aux = [[SKLabelNode alloc] init];
        aux.text = @"aparece na tela";
        aux.name =@"fireButtonNode";
        CGPoint loc = CGPointMake(150, 100);
        aux.position = loc;
        
        [self addChild:aux];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    SKNode *uso = [self childNodeWithName:@"eu"];
    NSMutableArray *coisas = [[NSMutableArray alloc] init];
    if (!uso.hasActions) {
    if ([node.name isEqualToString:@"fireButtonNode"]) {
      //  NSLog(@"ta dentro!!");
        [coisas addObject:[SKAction moveBy:CGVectorMake(100, 100) duration:1]];
        
        [player ataksimples:enemy];
        
        [coisas addObject:[SKAction moveBy:CGVectorMake(-100, -100) duration:1]];
        [uso runAction:[SKAction sequence:coisas]];
    }
    }
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    if (minhavez) {
        
    }
    
}

@end
