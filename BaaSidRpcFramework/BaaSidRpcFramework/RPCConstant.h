//
//  RPCConstant.h
//  BaaSidRpcFramework
//
//  Created by neoosm on 2019. 4. 24..
//  Copyright © 2019년 Baas LAB. All rights reserved.
//

#ifndef RPCConstant_h
#define RPCConstant_h

#define URL_MAIN_NET @"https://rrpc.baasid.io:3800"
#define URL_TEST_NET @"https://rpc.baasid.io:3900"

#define SYMBOL_NAME @"BAAS"

static NSString * const chain_func_base = @"/v1/chain";
static NSString * const get_info_func =@"/v1/chain/get_info";
static NSString * const get_block_func=@"/v1/chain/get_block";
static NSString * const push_txn_func=@"/v1/chain/push_transaction";


#define URL_GETINFO_API @"https://rrpc.baasid.io:3800/v1/chain/"


#endif /* RPCConstant_h */
