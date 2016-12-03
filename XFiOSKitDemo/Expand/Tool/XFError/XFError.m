//
//  XFError.m
//  XFiOSKitDemo
//
//  Created by DamonLiao on 03/12/2016.
//  Copyright © 2016 DamonLiao. All rights reserved.
//

#import "XFError.h"

#define KEY_ERROR_MSG                   @"msg"

@implementation XFError


+ (NSError *)webError:(int)code {
    NSString *msg = @"";
    int num = code;
    
    switch (code) {
        case XFHTTPStatusServiceUnavailable:
            msg = NSLocalizedStringFromTable(@"ServiceUnavailable", @"XFError", nil);
            break;
        case XFHTTPStatusNetworkError:
            msg = NSLocalizedStringFromTable(@"NetworkError", @"XFError", nil);
            break;
        case XFHTTPStatusTooManyRequests:
            msg = NSLocalizedStringFromTable(@"FrequentRequest", @"XFError", nil);
            break;
        default:
            break;
    }
    
    /*
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
     */
    
    return [self webErrorWithCode:num message:msg];
    
}


#pragma mark - Private

+ (NSError *)webErrorWithCode:(NSInteger)code message:(NSString *)message {
    return [self errorWithDomain:@"WebService" code:code message:message];
}

+ (NSError *)errorWithDomain:(NSErrorDomain)domain code:(NSInteger)code message:(NSString *)message {
    return [NSError errorWithDomain:domain code:code userInfo:@{KEY_ERROR_MSG: message}];
}

@end
