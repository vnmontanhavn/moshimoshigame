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
    NSInteger damage;
    NSInteger d10;
    float aux = 0.0;
    d10=arc4random()%11;
    if (d10<10) {
        aux = [self ataque]*((float)d10/10);
        damage = [self ataque]+aux;
    }
    else{
        damage= 2*[self ataque];
    }
    [enemy setVidaatual:[enemy vidaatual]-(damage-[enemy defesa])];
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

-(void)levelUp{
    [self setLevel:([self level]+1)];
    //os valores setados abaixo tem de variar conforme o nome do monstro, no qual tem uma historia e ela deve contar no calculo.
    [self setAtaque:([self ataque]+10)];
    [self setDefesa:([self defesa]+5)];
}

-(void)verificaLevel{
    
}

@end
