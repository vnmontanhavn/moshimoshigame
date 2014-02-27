//
//  monsters.m
//  moshi moshi
//
//  Created by Vinicius Soares Lima on 25/02/14.
//  Copyright (c) 2014 Vinicius Soares Lima. All rights reserved.
//

#import "monsters.h"

@implementation monsters
-(id)initWithElements:(NSString*)newnome withTipo:(NSString*)newtipo withimage:(NSString*)newimage withLevel:(NSInteger)newLevel withVida:(NSInteger)newvida withatak:(NSInteger)newaatk withdef:(NSInteger)newdef
{
    self = [super init];
    _nome = newnome;
    _tipo = newtipo;
    _imagem = newimage;
    _level = newLevel;
    _vidatotal = newvida;
    _vidaatual = _vidatotal;
    _ataque = newaatk;
    _defesa = newdef;
    _habilidade1 = arc4random() % 5;
    return self;
}

-(void)ataksimples:(monsters*)enemy{
    [enemy setVidaatual:[enemy vidaatual]-([self ataque]-[enemy defesa])];
}

-(void)atakhabilidade1:(monsters*)enemy{
    NSInteger damage;
    Habilidades *aux = [[Habilidades alloc]init];
    damage = [aux getdamage:_habilidade1 withType:_tipo withAtak:_ataque];
    [enemy setVidaatual:[enemy vidaatual]-(damage - [enemy defesa])];
}

-(void)atakhabilidade2:(monsters*)enemy{
    NSInteger damage;
    Habilidades *aux = [[Habilidades alloc]init];
    damage = [aux getdamage:_habilidade2 withType:_tipo withAtak:_ataque];
    [enemy setVidaatual:[enemy vidaatual]-(damage - [enemy defesa])];}

-(void)atakhabilidade3:(monsters*)enemy{
    NSInteger damage;
    Habilidades *aux = [[Habilidades alloc]init];
    damage = [aux getdamage:_habilidade3 withType:_tipo withAtak:_ataque];
    [enemy setVidaatual:[enemy vidaatual]-(damage - [enemy defesa])];
}

-(void)atakhabilidade4:(monsters*)enemy{
    NSInteger damage;
    Habilidades *aux = [[Habilidades alloc]init];
    damage = [aux getdamage:_habilidade4 withType:_tipo withAtak:_ataque];
    [enemy setVidaatual:[enemy vidaatual]-(damage - [enemy defesa])];
}

@end
