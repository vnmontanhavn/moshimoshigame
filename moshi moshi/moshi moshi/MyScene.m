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
bool havewinner=NO;
monsters *player ;
monsters *enemy ;

SKNode *emuso;

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
        monsterList *Lista2 = [[monsterList alloc]init];
        CGPoint location = CGPointMake(20, 150);
         player = [Lista getmonster:0 withLine:0];
         enemy = [Lista2 getmonster:0 withLine:0];
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
        [player levelUp];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
        
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    emuso = [self childNodeWithName:@"eu"];
    NSMutableArray *coisas = [[NSMutableArray alloc] init];
    if (!emuso.hasActions) {
    if ([node.name isEqualToString:@"fireButtonNode"]) {
      //  NSLog(@"ta dentro!!");
        if ([enemy vidaatual]<1) {
            NSLog(@"sua vida vida= %ld  de %ld", (long)[enemy vidaatual], (long)[enemy vidatotal]);
            NSLog(@"vc ganhou!");
        }else{
        [coisas addObject:[SKAction moveBy:CGVectorMake(100, 100) duration:1]];
        
        [player ataksimples:enemy];
        
        NSLog(@"inimigo toma dano:  vida= %ld  de %ld", (long)[enemy vidaatual], (long)[enemy vidatotal]);
        
        
        [coisas addObject:[SKAction moveBy:CGVectorMake(-100, -100) duration:1]];
            [emuso runAction:[SKAction sequence:coisas]];
    
        }
       
        
        minhavez = NO;
    }
    
    }
    
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
    SKNode *node;
    SKLabelNode *baka;
    if(![self childNodeWithName:@"PlayerLife"]){
    SKLabelNode *vidaplayer = [[SKLabelNode alloc]init];
        vidaplayer.name = @"PlayerLife";
        [vidaplayer setText:[NSString stringWithFormat:@"%ld",(long)[player vidaatual]]];
    vidaplayer.fontSize = 30;
    CGPoint loc = CGPointMake(200, 200);
    vidaplayer.position = loc;
    
    [self addChild:vidaplayer];
    }
    if ([self childNodeWithName:@"PlayerLife"]) {
        baka = (SKLabelNode*)[self childNodeWithName:@"PlayerLife"];
        if ([[baka text]isEqualToString:[NSString stringWithFormat:@"%ld",(long)[player vidaatual]]]) {
            
        }
        else{
            SKAction * updelfase = [SKAction removeFromParent];
            node =[self childNodeWithName:@"PlayerLife"];
            [node runAction:updelfase];
        }
    }
    
    if(![self childNodeWithName:@"EnemyLife"]){
        SKLabelNode *vidaenemy = [[SKLabelNode alloc]init];
                vidaenemy.name = @"EnemyLife";
        [vidaenemy setText:[NSString stringWithFormat:@"%ld",(long)[player vidaatual]]];
        vidaenemy.fontSize = 30;
        CGPoint loc = CGPointMake(200, 200);
        vidaenemy.position = loc;
        
        [self addChild:vidaenemy];
    }
    if ([self childNodeWithName:@"EnemyLife"]) {
        baka = (SKLabelNode*)[self childNodeWithName:@"EnemyLife"];
        if ([[baka text]isEqualToString:[NSString stringWithFormat:@"%ld",(long)[player vidaatual]]]) {
            
        }
        else{
            SKAction * updelfase = [SKAction removeFromParent];
            node =[self childNodeWithName:@"EnemyLife"];
            [node runAction:updelfase];
        }
    }

    
    
  //  

    
    
    if ([player vidaatual]<1||[enemy vidaatual]<1) {
        havewinner=true;
    }else{}
    if (havewinner) {
        if ([player vidaatual]>[enemy vidaatual]) {
            if(![self childNodeWithName:@"Chalkduster1"]){
                SKLabelNode *myLabel = [[SKLabelNode alloc]init];
                myLabel.name =@"Chalkduster1";
                myLabel.text = @"vc ganhou";
                myLabel.fontSize = 30;
                myLabel.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
                [self addChild:myLabel];
                
            }
        }
        else{
            if(![self childNodeWithName:@"Chalkduster2"]){
                SKLabelNode *myLabel = [[SKLabelNode alloc]init];
                myLabel.name =@"Chalkduster2";
                myLabel.text = @"vc perdeu";
                myLabel.fontSize = 30;
                myLabel.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
                [self addChild:myLabel];
            }
   
        }
    }
    
    else{
        
    if (!minhavez) {
        //SKNode *node = [self nodeAtPoint:location];
       // [self hasActions]
        SKAction * actionMoveDone = [SKAction removeFromParent];
        node =[self childNodeWithName:@"fireButtonNode"];
        [node runAction:actionMoveDone];
        if (![emuso hasActions]) {
        emuso = [self childNodeWithName:@"ele"];
        NSMutableArray *coisas = [[NSMutableArray alloc] init];
        
            
            //  NSLog(@"ta dentro!!");
            if ([player vidaatual]<1) {
                NSLog(@"sua vida vida= %ld  de %ld", (long)[player vidaatual], (long)[player vidatotal]);
                NSLog(@"vc perdeu!");
            }else{
                
                [coisas addObject:[SKAction moveBy:CGVectorMake(-100, -100) duration:1]];
                
                [enemy ataksimples:player];
                
                NSLog(@"vc toma dano:  vida= %ld  de %ld", (long)[player vidaatual], (long)[player vidatotal]);
                
                
                [coisas addObject:[SKAction moveBy:CGVectorMake(100, 100) duration:1]];
                [emuso runAction:[SKAction sequence:coisas]];
                
            }
            
            minhavez = YES;
        }

        
    }
    else{
        
        if(![self childNodeWithName:@"fireButtonNode"]){
            SKLabelNode *aux = [[SKLabelNode alloc] init];
            aux.text = @"aparece na tela";
            aux.name =@"fireButtonNode";
            CGPoint loc = CGPointMake(150, 100);
            aux.position = loc;
            
            [self addChild:aux];

        }
        
        
        
        }
    }
//    SKAction * actionMoveDone = [SKAction removeFromParent];
//    node =[self childNodeWithName:@"PlayerLife"];
//    [node runAction:actionMoveDone];
}

@end
