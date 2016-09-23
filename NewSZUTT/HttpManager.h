//
//  HttpManager.h
//  NewSZUTT
//
//  Created by 安达 on 16/5/1.
//  Copyright © 2016年 安达. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger , HttpStatus) {
    HttpResponseSuccess             = 100,      // 请求成功
    HttpResponseSystemError         = -100,     // 请求失败
};

@interface HttpManager : NSObject

+(HttpManager *)instance;
/**
 *  注册请求
 *  @param parameters 请求参数
 *  @param success    成功block
 *  @param failure    失败block
 */
-(void)requestRegister:(NSDictionary *)parameters
               success:(void(^) (id responseObject))success
               failure:(void(^) (NSError * error))failure;

/**
 *  登录请求
 *  @param parameters 请求参数
 *  @param success    成功block
 *  @param failure    失败block
 */
-(void)requestLogin:(NSDictionary *)parameters
               success:(void(^) (id responseObject))success
               failure:(void(^) (NSError * error))failure;


/**
 *  生成验证码，发送服务器请求
 *  @param parameters 请求参数
 *  @param success    成功block
 *  @param failure    失败block
 */
-(void)requestEmailCode:(NSDictionary *)parameters
            success:(void(^) (id responseObject))success
            failure:(void(^) (NSError * error))failure;

/**
 *  填写验证码，确认更改密码请求
 *  @param parameters 请求参数
 *  @param success    成功block
 *  @param failure    失败block
 */
-(void)requestForgetPassword:(NSDictionary *)parameters
                success:(void(^) (id responseObject))success
                failure:(void(^) (NSError * error))failure;


/**
 *  修改密码请求
 *  @param parameters 请求参数
 *  @param success    成功block
 *  @param failure    失败block
 */
-(void)requestResetPassword:(NSDictionary *)parameters
               success:(void(^) (id responseObject))success
               failure:(void(^) (NSError * error))failure;

/**
 *  请求课程页面课程表
 *  @param parameters 请求参数
 *  @param success    成功block
 *  @param failure    失败block
 */
-(void)requestLessonTimeTable:(NSDictionary *)parameters
                 success:(void(^) (id responseObject))success
                 failure:(void(^) (NSError * error))failure;

/**
 *  请求发现页面教师通讯录
 *  @param parameters 请求参数
 *  @param success    成功block
 *  @param failure    失败block
 */
-(void)requestDiscoverTeacherPhone:(NSDictionary *)parameters
                      success:(void(^) (id responseObject))success
                      failure:(void(^) (NSError * error))failure;


/**
 *  请求课程页面课程详情格子(包括课程头 和 评论)
 *  @param parameters 请求参数
 *  @param success    成功block
 *  @param failure    失败block
 */
-(void)requestLessonDetailCell:(NSDictionary *)parameters
                         success:(void(^) (id responseObject))success
                         failure:(void(^) (NSError * error))failure;

/**
 *  请求课程评价页面添加评论
 *  @param parameters 请求参数
 *  @param success    成功block
 *  @param failure    失败block
 */
-(void)requestLessonAddCommand:(NSDictionary *)parameters
                        success:(void(^) (id responseObject))success
                        failure:(void(^) (NSError * error))failure;

/**
 *  请求推荐页面
 *  @param parameters 请求参数
 *  @param success    成功block
 *  @param failure    失败block
 */
-(void)requestLessonRecommand:(NSDictionary *)parameters
                       success:(void(^) (id responseObject))success
                       failure:(void(^) (NSError * error))failure;


/**
 *  请求添加旁听
 *  @param parameters 请求参数
 *  @param success    成功block
 *  @param failure    失败block
 */
-(void)requestLessonAddAudit:(NSDictionary *)parameters
                      success:(void(^) (id responseObject))success
                      failure:(void(^) (NSError * error))failure;


/**
 *  请求删除旁听
 *  @param parameters 请求参数
 *  @param success    成功block
 *  @param failure    失败block
 */
-(void)requestLessonDeleteAudit:(NSDictionary *)parameters
                     success:(void(^) (id responseObject))success
                     failure:(void(^) (NSError * error))failure;


/**
 *  请求我页面标签名称
 *  @param parameters 请求参数
 *  @param success    成功block
 *  @param failure    失败block
 */
-(void)requestTagArray:(NSDictionary *)parameters
                       success:(void(^) (id responseObject))success
                       failure:(void(^) (NSError * error))failure;


/**
 *  请求查询学分验证码图片
 *  @param parameters 请求参数
 *  @param success    成功block
 *  @param failure    失败block
 */
-(void)requestProfileCodeImage:(NSDictionary *)parameters
                            success:(void(^) (id responseObject))success
                            failure:(void(^) (NSError * error))failure;

/**
 *  请求查询学分
 *  @param parameters 请求参数
 *  @param success    成功block
 *  @param failure    失败block
 */
-(void)requestProfileCredits:(NSDictionary *)parameters
                       success:(void(^) (id responseObject))success
                       failure:(void(^) (NSError * error))failure;
@end



















