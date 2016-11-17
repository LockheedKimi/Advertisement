//
//  NetworkClient.h
//  NetWorkDemo
//
//  Created by kimi.zhang on 16/1/17.
//  Copyright © 2016年 kimi.zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetDataModel.h"

@interface NetworkClient : NSObject

+ (void)reportWithReportorContent:(NSDictionary *)content
                          success:(void (^)(id response))success
                          failure:(void (^)(NSError* err))failure;

+(void)getLongitudeLatitudeString:(NSString*)string
                          success:(void (^)(id response))success
                          failure:(void (^)(NSError* err))failure;

+ (void)textReportWithReportorContent:(NSDictionary *)content
                              success:(void (^)(id response))success
                              failure:(void (^)(NSError* err))failure;
@end
