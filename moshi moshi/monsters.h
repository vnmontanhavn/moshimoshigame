//
//  monsters.h
//  moshi moshi
//
//  Created by Vinicius Soares Lima on 25/02/14.
//  Copyright (c) 2014 Vinicius Soares Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Habilidades.h"

@interface monsters : NSObject
@property (nonatomic)NSString *nome;
@property (nonatomic)NSString *tipo;
@property (nonatomic)NSString *imagem;
@property (nonatomic)NSInteger vidatotal;
@property (nonatomic)NSInteger vidaatual;
@property (nonatomic)NSInteger ataque;
@property (nonatomic)NSInteger defesa;
@property (nonatomic)NSInteger habilidade1;
@property (nonatomic)NSInteger habilidade2;
@property (nonatomic)NSInteger habilidade3;
@property (nonatomic)NSInteger habilidade4;
@property (nonatomic)NSInteger level;
-(id)initWithElements:(NSString*)newnome withTipo:(NSString*)newtipo withimage:(NSString*)newimage withLevel:(NSInteger)newLevel withVida:(NSInteger)newvida withatak:(NSInteger)newaatk withdef:(NSInteger)newdef;

-(void)ataksimples:(monsters*)enemy;
-(void)atakhabilidade1:(monsters*)enemy;
-(void)atakhabilidade2:(monsters*)enemy;
-(void)atakhabilidade3:(monsters*)enemy;
-(void)atakhabilidade4:(monsters*)enemy;
-(void)levelUp;
@end
