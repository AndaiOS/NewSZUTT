//
//  HttpManager.m
//  NewSZUTT
//
//  Created by 安达 on 16/5/1.
//  Copyright © 2016年 安达. All rights reserved.
//

#import "HttpManager.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPSessionManager.h"
#import "AFHTTPRequestOperationManager.h"
#import "DataDefines.h"

NSString * const NetworkReachableNotification = @"com.newwork.reachable.triphare";
NSString * const NetworkUneachableNotification = @"com.newwork.unreachable.triphare";

@interface HttpManager(){
    AFHTTPSessionManager * _manager;
}
@property ( nonatomic ) BOOL networkFailured;

@end

@implementation HttpManager{
    
}
+(HttpManager *)instance{
    static dispatch_once_t pred;//创建一个单例
    static HttpManager * _sharedHttpManager = nil;
    dispatch_once(&pred , ^{ _sharedHttpManager = [[self alloc]init];});//实例化单例
    return _sharedHttpManager;
}
//-(id)init{
//    self = [super init];
//    if(self){
//        _manager = [AFHTTPSessionManager manager];
//        [_manager operationQueue].maxConcurrentOperationCount = 4;//最大并发操作数目
//    }
//    return self;
//}
//注册请求
-(void)requestRegister:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
    _manager = [AFHTTPSessionManager manager];
    //_manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [_manager POST:@URL_REGISTER parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        //NSLog(@"%@",responseObject);
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           success(responseObject);
                       });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           failure(error);
                       });
    }];
}
//登录请求
-(void)requestLogin:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
    _manager = [AFHTTPSessionManager manager];
    //_manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [_manager POST:@URL_LOGIN parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           success(responseObject);
                       });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           failure(error);
                       });
    }];
}

//生成验证码，发送服务器请求
-(void)requestEmailCode:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
    _manager = [AFHTTPSessionManager manager];
    //_manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [_manager POST:@URL_EMAILCODE parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           success(responseObject);
                       });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           failure(error);
                       });
    }];
}
//填写验证码，确认新密码请求
-(void)requestForgetPassword:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
    _manager = [AFHTTPSessionManager manager];
    //_manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [_manager POST:@URL_FORGETPASSWORD parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           success(responseObject);
                       });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           failure(error);
                       });
    }];
}

//课程表请求
-(void)requestLessonTimeTable:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    _manager = [AFHTTPSessionManager manager];
    //_manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //_manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [_manager POST:@URL_LESSON_REQUESTLESSONTIMETABLE parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           success(responseObject);
                       });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           failure(error);
                       });
    }];
}
//课程详情请求
-(void)requestLessonDetailCell:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    _manager = [AFHTTPSessionManager manager];
    //_manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [_manager POST:@URL_LESSON_REQUESTLESSONDETAIL parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           success(responseObject);
                       });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           failure(error);
                       });
    }];
}
//课程推荐请求
-(void)requestLessonRecommand:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    _manager = [AFHTTPSessionManager manager];
    //_manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [_manager POST:@URL_LESSON_REQUESTRECOMMEND parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           success(responseObject);
                       });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           failure(error);
                       });
    }];
}


//课程旁听请求
-(void)requestLessonAddAudit:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    _manager = [AFHTTPSessionManager manager];
    //_manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [_manager POST:@URL_LESSON_REQUESTADDAUDIT parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           success(responseObject);
                       });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           failure(error);
                       });
    }];
}

//删除旁听请求
-(void)requestLessonDeleteAudit:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    _manager = [AFHTTPSessionManager manager];
    //_manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [_manager POST:@URL_LESSON_REQUESTDELETEAUDIT parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           success(responseObject);
                       });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           failure(error);
                       });
    }];
}

//老师联系方式请求
-(void)requestDiscoverTeacherPhone:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    _manager = [AFHTTPSessionManager manager];
    //_manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [_manager POST:@URL_DISCOVER_REQUESTTEACHERPHONE parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           success(responseObject);
                       });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           failure(error);
                       });
    }];
}

//标准标签请求
-(void)requestTagArray:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    _manager = [AFHTTPSessionManager manager];
    //_manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [_manager POST:@URL_PROFILE_REQUESTTTAGARRAY parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           success(responseObject);
                       });
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           failure(error);
                       });
    }];
}

//所有评价(课程格)请求
-(void)requestDiscoverAllCOmmand:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    _manager = [AFHTTPSessionManager manager];
    //_manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [_manager POST:@URL_DISCOVER_REQUESTALLCOMMAND parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           success(responseObject);
                       });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           failure(error);
                       });
    }];
}
//我的所有评价(吐槽帝)请求
-(void)requestDiscoverMyCommand:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    _manager = [AFHTTPSessionManager manager];
    //_manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [_manager POST:@URL_DISCOVER_REQUESTMYCOMMAND parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           success(responseObject);
                       });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           failure(error);
                       });
    }];
}

//添加我的评论请求
-(void)requestLessonAddCommand:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    _manager = [AFHTTPSessionManager manager];
    //_manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [_manager POST:@URL_LESSON_REQUESTADDCOMMAND parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           success(responseObject);
                       });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           failure(error);
                       });
    }];
}
//删除我的评论请求
-(void)requestDiscoverDeleteCommand:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    _manager = [AFHTTPSessionManager manager];
    //_manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [_manager POST:@URL_DISCOVER_REQUESTDELETECOMMAND parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           success(responseObject);
                       });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           failure(error);
                       });
    }];
}
//修改密码请求
-(void)requestResetPassword:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    _manager = [AFHTTPSessionManager manager];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [_manager POST:@URL_CHANGE_PASSWORD parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           success(responseObject);
                       });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           failure(error);
                       });
    }];
}
//查询学分获取验证码图片
-(void)requestProfileCodeImage:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    _manager = [AFHTTPSessionManager manager];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [_manager POST:@URL_GET_CODEIMAGE parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           success(responseObject);
                       });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           failure(error);
                       });
    }];
}
//查询学分获取验证码图片
-(void)requestProfileCredits:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    _manager = [AFHTTPSessionManager manager];
    _manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [_manager POST:@URL_GET_CREDITS parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           success(responseObject);
                       });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        dispatch_async(dispatch_get_main_queue(), ^
                       {
                           failure(error);
                       });
    }];
}

@end































