//
//  BaaSidRpc
//  BaaSidRpcFramework
//
//  Created by neoosm on 2019. 4. 18..
//  Copyright © 2019년 Baas LAB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaaSidRpc : NSObject

+ (id)sharedInstatnce;
+ (id)allocWithChainURL:(NSString *)chainurl AuthURL:(NSString *)authurl SymbolName:(NSString *)symbol;

- (void)GetInfo:(NSString *)func withHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))blockChain;

@end
