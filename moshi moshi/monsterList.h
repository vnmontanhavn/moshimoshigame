//
//  monsterList.h
//  moshi moshi
//
//  Created by Vinicius Soares Lima on 25/02/14.
//  Copyright (c) 2014 Vinicius Soares Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "monsters.h"
@interface monsterList : NSObject
{
    NSMutableDictionary *lista;
}
-(void)addContato:(NSString*)nome withTipo:(NSInteger)tipo withimage:(NSString*)image withLevel:(NSInteger)level withVida:(NSInteger)vida withatak:(NSInteger)atak withdef:(NSInteger)defesa;
-(monsters*) getmonster:(NSInteger)coluna withLine:(NSInteger)linha;
+(monsterList*)getInstance;
@end
