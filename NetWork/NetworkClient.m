//
//  NetworkClient.m
//  NetWorkDemo
//
//  Created by kimi.zhang on 16/1/17.
//  Copyright © 2016年 kimi.zhang. All rights reserved.
//

#import "NetworkClient.h"
#import "Global.h"
#import <objc/runtime.h>
#import "GlobalUtil.h"
#import "AFHTTPRequestOperationManager.h"
#import "NSDictionary+mutableDeepCopy.h"

#define BAIDU_DEVELOMENT_KEY @"63XdtQu3ahY2ga5sFeA8LsVl"

@implementation NetworkClient

#define UrlHeader @"/user_addHobby.action"
//枚举定义请求类型
typedef NS_ENUM(NSInteger, RequestMethodType){
    RequestMethodTypePost = 1,
    RequestMethodTypeGet = 2,
    RequestMethodTypeDelete = 3,
    RequestMethodTypePut
};

/**
 *  对AFHTTPSessionManager启用单例模式
 *
 *  @return 单例
 */
+ (AFHTTPSessionManager*)sharedHTTPSessionManager{
    static AFHTTPSessionManager* mgr = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration* configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        configuration.timeoutIntervalForRequest = 200;
        NSURL* baseURL = [NSURL URLWithString:BASEURL];
        mgr = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL sessionConfiguration:configuration];
        mgr.requestSerializer = [AFJSONRequestSerializer serializer];
        mgr.responseSerializer = [AFJSONResponseSerializer serializer];
        [mgr.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    });
    return mgr;
}


+ (BOOL)checkRetry:(NSNumber*)retryCount{
    return retryCount.integerValue > 0;
}
/*=========================请求方法回调===========================*/
+ (void)requestWihtMethod:(RequestMethodType)methodType
                      url:(NSString*)url
                   params:(NSDictionary*)params
                  success:(void (^)(id response))success
                  failure:(void (^)(NSError* err))failure
{
    
    
    AFHTTPSessionManager* mgr = [self sharedHTTPSessionManager];
    NSMutableString *authHeader=[[NSMutableString alloc] initWithString:@"application/json"];
   [mgr.requestSerializer setValue:authHeader forHTTPHeaderField:@"Content-Type"];
    //拼接标识Request的Key
    NSString* requestID = [NSString stringWithFormat:@"%@:%@", @(methodType), url];
    NSNumber* retryCount = objc_getAssociatedObject(mgr, [requestID UTF8String]);
    if (!retryCount) {
        retryCount = @(3);
    } else {
        retryCount = @(retryCount.integerValue - 1);
    }
    objc_setAssociatedObject(mgr, [requestID UTF8String], retryCount, OBJC_ASSOCIATION_COPY);
    switch (methodType) {
        case RequestMethodTypeGet:{
            //GET请求
            [mgr GET:url
          parameters:params
             success:^(NSURLSessionDataTask *task, id responseObject) {
                 NSDictionary* result = responseObject;
                 result = [result mutableDeepCopy];
                 [GlobalUtil deepCleanCollection:result];
                 if (success) {
                     success(result);
                     NSLog(@"GET 请求成功 code:%@, msg %@", result[@"returnCode"], result[@"returnMsg"]);
                     NSLog(@"输出请求地址------%@",url);
                 }
             }
             failure:^(NSURLSessionDataTask *task, NSError *error) {
                 if (error.code == kCFURLErrorTimedOut && [self checkRetry:retryCount]) {
                     [self requestWihtMethod:methodType
                                         url:url
                                      params:params
                                     success:success
                                     failure:failure];
                 } else {
                     objc_setAssociatedObject(mgr, [requestID UTF8String], nil, OBJC_ASSOCIATION_COPY);
                     failure(error);
                 }
                 
             }];
        }
            break;
        case RequestMethodTypePost:
        {
            //POST请求
            [mgr POST:url
           parameters:params
              success:^(NSURLSessionDataTask *task, id responseObject) {
                  NSDictionary* result = responseObject;
                  result = [result mutableDeepCopy];
                  [GlobalUtil deepCleanCollection:result];
                  if (success) {
                      success(result);
                      NSLog(@"POST 请求成功 code:%@, msg %@", result[@"returnCode"], result[@"returnMsg"]);
                      NSLog(@"输出请求地址------%@",url);
                  }
              } failure:^(NSURLSessionDataTask *task, NSError *error) {
                  if (error.code == kCFURLErrorTimedOut && [self checkRetry:retryCount]) {
                      [self requestWihtMethod:methodType
                                          url:url
                                       params:params
                                      success:success
                                      failure:failure];
                  } else {
                      objc_setAssociatedObject(mgr, [requestID UTF8String], nil, OBJC_ASSOCIATION_COPY);
                      failure(error);
                  }
              }];
        }
            break;
        case RequestMethodTypeDelete:
        {
            //DELETE请求
            [mgr DELETE:url
             parameters:params
                success:^(NSURLSessionDataTask *task, id responseObject) {
                    NSDictionary* result = responseObject;
                    result = [result mutableDeepCopy];
                    [GlobalUtil deepCleanCollection:result];
                    if (success) {
                        success(result);
                        NSLog(@"DELETE 请求成功 code:%@, msg %@", result[@"returnCode"], result[@"returnMsg"]);
                        NSLog(@"输出请求地址------%@",url);
                    }
                } failure:^(NSURLSessionDataTask *task, NSError *error) {
                    if (error.code == kCFURLErrorTimedOut && [self checkRetry:retryCount]) {
                        [self requestWihtMethod:methodType
                                            url:url
                                         params:params
                                        success:success
                                        failure:failure];
                    } else {
                        objc_setAssociatedObject(mgr, [requestID UTF8String], nil, OBJC_ASSOCIATION_COPY);
                        failure(error);
                    }
                }];
        }
            break;
        case RequestMethodTypePut:{
            [mgr PUT:url parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
                NSDictionary* result = responseObject;
                result = [result mutableDeepCopy];
                [GlobalUtil deepCleanCollection:result];
                if (success) {
                    success(result);
                    NSLog(@"PUT 请求成功 code:%@, msg %@", result[@"returnCode"], result[@"returnMsg"]);
                    NSLog(@"输出请求地址------%@",url);
                }

            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                if (error.code == kCFURLErrorTimedOut && [self checkRetry:retryCount]) {
                    [self requestWihtMethod:methodType
                                        url:url
                                     params:params
                                    success:success
                                    failure:failure];
                } else {
                    objc_setAssociatedObject(mgr, [requestID UTF8String], nil, OBJC_ASSOCIATION_COPY);
                    failure(error);
                }
            }];
        }
            break;
        default:
            break;
    }
}
/*=========================请求方法回调===========================*/

//标签
//+ (void)reportWithReportorContent:(NSDictionary *)content
//                    success:(void (^)(id response))success
//                    failure:(void (^)(NSError* err))failure {
//    
//    [NetworkClient requestWihtMethod:RequestMethodTypePost url:@"/user" params:content success:^(id response) {
//        success(response);
//    } failure:^(NSError *err) {
//        failure(err);
//    }];
//}

//+(void)getLongitudeLatitudeString:(NSString*)string
//                          success:(void (^)(id response))success
//                          failure:(void (^)(NSError* err))failure
//{
//    
//    NSString* str = [GlobalUtil getDataUTF8:string];
//    [NetworkClient requestWihtMethod:RequestMethodTypeGet url:[NSString stringWithFormat:@"/geocoder?address=%@&output=json&key=%@",str,BAIDU_DEVELOMENT_KEY] params:nil success:^(id response){
////        NSDictionary* dic = (NSDictionary*)response;
////        NetDataModel *model = [[NetDataModel alloc] initWithDictionary:dic error:nil];
////        NSLog(@"%@",err.localizedDescription);
//        success(response);
//    } failure:^(NSError* err){
//        failure(err);
//        
//    }];
//}


//+ (void)textReportWithReportorContent:(NSDictionary *)content
//                          success:(void (^)(id response))success
//                          failure:(void (^)(NSError* err))failure {
//    
//    [NetworkClient requestWihtMethod:RequestMethodTypePost url:@"/mecv-protocol/assist"/*[NSString stringWithFormat:@"/mecv-protocol/%@",@"assist"]*/ params:content success:^(id response) {
//        success(response);
//    } failure:^(NSError *err) {
//        failure(err);
//    }];
//}


@end
