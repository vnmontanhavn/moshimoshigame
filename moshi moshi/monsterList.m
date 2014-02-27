//
//  monsterList.m
//  moshi moshi
//
//  Created by Vinicius Soares Lima on 25/02/14.
//  Copyright (c) 2014 Vinicius Soares Lima. All rights reserved.
//

#import "monsterList.h"
#import "monsters.h"
@implementation monsterList

//+(monsterList*)getInstance{
//    static monsterList *instance = nil;
//    if(!instance){
//        instance = [[super allocWithZone:nil] init];
//    }
//    return instance;
//}
//
//+(id)allocWithZone:(struct _NSZone *)zone{
//    
//    return [self getInstance];
//}




-(id)init{
    self = [super init];
    if (!lista) {
    lista = [[NSMutableDictionary alloc]init];
        [self addContato:@"teste" withTipo:@"teste" withimage:@"Spaceship" withLevel:1 withVida:5 withatak:3 withdef:1];
    }
    return self;
}
-(void)addContato:(NSString*)nome withTipo:(NSString*)tipo withimage:(NSString*)image withLevel:(NSInteger)level withVida:(NSInteger)vida withatak:(NSInteger)atak withdef:(NSInteger)defesa {
    monsters *aux = [[monsters alloc]initWithElements:nome withTipo:tipo withimage:image withLevel:level withVida:vida withatak:atak withdef:defesa];
    
    NSString *monsterType = tipo;
    if ([[lista allKeys] containsObject:monsterType]) {
        [[lista objectForKey:monsterType] addObject:aux];
    } else{
        NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:aux, nil];
        [lista setObject:array forKey:monsterType];
    }
}
-(monsters*) getmonster:(NSInteger)coluna withLine:(NSInteger)linha{
    NSString *c = [[lista allKeys] objectAtIndex:coluna];
    NSMutableArray *aux = [lista objectForKey:c];
    return [aux objectAtIndex:linha];
}
@end
