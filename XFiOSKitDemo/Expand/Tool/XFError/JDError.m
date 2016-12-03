//
//  JDError.m
//  simplr
//
//  Created by snowingsea on 15/7/16.
//  Copyright (c) 2015年 jidu. All rights reserved.
//

#import "JDError.h"

@implementation JDError

/**
 *  网络错误相关
 *
 *  @param code 错误代码
 *
 *  @return 错误类
 */
+ (NSError *)webError:(int)code {
    NSString *msg = @"";
    int num = code;
    switch (code) {
        case NetworkError:
            msg = NSLocalizedStringFromTable(@"NetworkError", @"Error", nil);
            break;
        case ServiceUnavailable:
            msg = NSLocalizedStringFromTable(@"ServiceUnavailable", @"Error", nil);
            break;
        case Unauthorized:
            msg = NSLocalizedStringFromTable(@"ReLogin", @"Error", nil);
            break;
        case FrequentRequest:
            msg = NSLocalizedStringFromTable(@"FrequentRequest", @"Error", nil);
            break;
        case Forbidden:
            msg = NSLocalizedStringFromTable(@"Forbidden", @"Error", nil);
            break;
        case EmailIllegal:
            msg = NSLocalizedStringFromTable(@"EmailIllegal", @"Error", nil);
            break;
        case WrongSMSCode:
            msg = NSLocalizedStringFromTable(@"WrongSMSCode", @"Error", nil);
            break;
        case MobileIllegal:
            msg = NSLocalizedStringFromTable(@"MobileIllegal", @"Error", nil);
            break;
        case PasswordIllegal:
            msg = NSLocalizedStringFromTable(@"PasswordIllegal", @"Error", nil);
            break;
        case ResourceNotFound:
            msg = NSLocalizedStringFromTable(@"ResourceNotFound", @"Error", nil);
            break;
        case WrongPassword:
            msg = NSLocalizedStringFromTable(@"WrongPassword", @"Error", nil);
            break;
        case UserForbidden:
            msg = NSLocalizedStringFromTable(@"UserForbidden", @"Error", nil);
            break;
        case DeviceRegistered:
            msg = NSLocalizedStringFromTable(@"DeviceRegistered", @"Error", nil);
            break;
        case UserCertified:
            msg = NSLocalizedStringFromTable(@"UserCertified", @"Error", nil);
            break;
        case UserCertifying:
            msg = NSLocalizedStringFromTable(@"UserCertifying", @"Error", nil);
            break;
        case VerifyTooFrequent:
            msg = NSLocalizedStringFromTable(@"VerifyTooFrequent", @"Error", nil);
            break;
        case UploadExceed:
            msg = NSLocalizedStringFromTable(@"UploadExceed", @"Error", nil);
            break;
        case Answered:
            msg = NSLocalizedStringFromTable(@"Answered", @"Error", nil);
            break;
        case NotAnswered:
            msg = NSLocalizedStringFromTable(@"NotAnswered", @"Error", nil);
            break;
        case FailedFetchConversation:
            msg = NSLocalizedStringFromTable(@"FailedFetchConversation", @"Error", nil);
            break;
        default:
            msg = NSLocalizedStringFromTable(@"ServerError", @"Error", nil);
            break;
    }
    
    return ERROR_WEB(num, msg);
}

/**
 *  本地错误相关
 *
 *  @param code 错误代码
 *
 *  @return 错误类
 */
+ (NSError *)localError:(int)code {
    NSString *msg;
    switch (code) {
        case EmptyContent:
            msg = NSLocalizedStringFromTable(@"EmptyContent", @"Error", nil);
            break;
        case EmptyMobile:
            msg = NSLocalizedStringFromTable(@"EmptyMobile", @"Error", nil);
            break;
        case EmptySMS:
            msg = NSLocalizedStringFromTable(@"EmptySMS", @"Error", nil);
            break;
        case EmptyPassword:
            msg = NSLocalizedStringFromTable(@"EmptyPassword", @"Error", nil);
            break;
        case PasswordTooShort:
            msg = NSLocalizedStringFromTable(@"PasswordTooShort", @"Error", nil);
            break;
        case LBSDenied:
            msg = NSLocalizedStringFromTable(@"LBSDenied", @"Error", nil);
            break;
        case FetchPhotoError:
            msg = NSLocalizedStringFromTable(@"FetchPhotoError", @"Error", nil);
            break;
        case CommentWordLimit:
            msg = NSLocalizedStringFromTable(@"CommentWordLimit", @"Error", nil);
            break;
        case LocalBlockExceed:
            msg = NSLocalizedStringFromTable(@"LocalBlockExceed", @"Error", nil);
            break;
        default:
            break;
    }
    return ERROR_LOCAL(code, msg);
}

@end
