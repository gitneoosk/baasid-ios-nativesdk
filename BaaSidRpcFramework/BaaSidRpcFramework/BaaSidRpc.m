//
//  BaaSidRpc.m
//  BaaSidRpcFramework
//
//  Created by neoosk on 2019. 4. 18..
//  Copyright © 2019년 Baas LAB. All rights reserved.
//

#import "BaaSidRpc.h"
#import "RPCConstant.h"


@interface BaaSidRpc()

@property (retain, nonatomic) NSString *chainURL;
@property(retain, nonatomic) NSString *authURL;
@property(retain, nonatomic) NSString *symbolName;

@end


@implementation BaaSidRpc

+(id)sharedInstatnce {
    // GCD, Thread_safe
    static BaaSidRpc* _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

+ (id)allocWithChainURL:(NSString *)chainurl AuthURL:(NSString *)authurl SymbolName:(NSString *)symbol; {
    static BaaSidRpc* _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
        _sharedInstance.chainURL = chainurl;
        _sharedInstance.authURL = authurl;
        _sharedInstance.symbolName = symbol;
    });
    return _sharedInstance;
}

/*
#define URL_MAIN_NET @"https://rrpc.baasid.io:3800"
#define URL_TEST_NET @"https://rpc.baasid.io:3900"

static NSString * const chain_func_base = @"/v1/chain";
static NSString * const get_info_func =@"/v1/chain/get_info";
*/

-(void)GetInfo:(NSString *)func withHandler:(void (^)(NSData *data, NSURLResponse *response, NSError *error))blockChain {
    
    NSLog(@"Called GetInfo in BaasidFramework");
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@", self.chainURL,  func];
    NSLog(@"urlString=> %@", urlString);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:20.0f];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"applicaton/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:blockChain] resume];
}

@end
