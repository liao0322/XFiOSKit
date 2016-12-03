//
//  JDError.h
//  simplr
//
//  错误处理类
//
//  Created by snowingsea on 15/7/16.
//  Copyright (c) 2015年 jidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDError : NSObject

typedef enum {
    UnknownError =          -1,
    
    EmptyContent =          -1100,
    EmptyMobile =           -1101,
    EmptySMS =              -1102,
    EmptyPassword =         -1103,
    PasswordTooShort =      -1201,
    
    CommentWordLimit =      -1300,
    
    LBSDenied =             -2000,
    
    FailedFetchConversation =   -3000,
    
    FetchPhotoError =       -4000,
    
    LocalBlockExceed =      -5000,
    
    NetworkError =          0,
    ServerError =           1000,
    ServiceUnavailable =    1010,
    
    Unauthorized =          2002,
    FrequentRequest =       2006,
    
    Forbidden =             3000,
    
    EmailIllegal =          3001,
    WrongSMSCode =          3002,
    MobileIllegal =         3003,
    PasswordIllegal =       3004,
    UserNotExist =          3005,
    ResourceNotFound =      3006,
    
    WrongPassword =         3010,
    UserForbidden =         3011,
    
    DeviceRegistered =      3021,
    RefreshTokenFail =      3025,
    
    UserCertified =         3030,
    UserCertifying =        3031,
    VerifyTooFrequent =     3032,
    UploadExceed =          3040,
    
    Answered =              3050,
    NotAnswered =           3051,
} JDErrorType;

#define KEY_ERROR_MSG                   @"msg"
#define KEY_WEBERROR_DOMAIN             @"WebService"
#define KEY_LOCALERROR_DOMAIN           @"logic"
#define ERROR(domain, codeNum, msg)     [NSError errorWithDomain:domain code:codeNum userInfo:[NSDictionary dictionaryWithObjectsAndKeys:msg, KEY_ERROR_MSG, nil]]

#define ERROR_WEB(code, msg)            ERROR(KEY_WEBERROR_DOMAIN, code, msg)
#define ERROR_LOCAL(code, msg)          ERROR(KEY_LOCALERROR_DOMAIN, code, msg)

+ (NSError *)webError:(int)code;
+ (NSError *)localError:(int)code;

@end
