//
//  AFConnectionManager.h
//  dummy
//
//  Created by Kulraj Singh on 16/06/15.
// methods for using AFnetworking

//please go through the readme

#define kBaseUrl @"https://montanaflynn-fifa-world-cup.p.mashape.com/"

#define kResponseObject @"response_object"
#define kError @"error"
#define kRequestType @"requestType"

//for different response formats
typedef enum {
    RESPONSE_JSON,
    RESPONSE_XML,
    RESPONSE_PLIST
}responseType;

typedef enum {
    TASK_GET_GAME = 200
}taskType;

typedef enum {
    METHOD_GET,
    METHOD_POST,
    METHOD_PUT,
    METHOD_PATCH,
    METHOD_DELETE
} serviceMethod;

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@protocol AFConnectionDelegate <NSObject>

@required
- (void)requestFinishedWithResponse:(id)response;
- (void)requestFailedWithError:(NSMutableDictionary*)errorDict;

@end

@interface AFConnectionManager : NSObject

//Upload a foto
- (void)uploadPhoto:(UIImage*)image urlEndPoint:(NSString*)endPoint requestType:(taskType)requestType params:(NSMutableDictionary*)parameters imageKey:(NSString*)imageKey;

- (void)uploadPhoto:(UIImage*)image urlEndPoint:(NSString*)endPoint requestType:(taskType)requestType params:(NSMutableDictionary*)parameters imageKey:(NSString*)imageKey responseFormat:(responseType)responseFormat;

//video
- (void)uploadVideoWithLocalUrl:(NSURL*)videoUrl urlEndPoint:(NSString*)endPoint requestType:(taskType)requestType params:(NSMutableDictionary*)postDict videoKey:(NSString*)videoKey imageKey:(NSString*)imageKey;

//upload two photos
//pass nil for second image and second image key if only one is there
- (void)uploadPhoto:(UIImage *)image secondPhoto:(UIImage*)secondImage urlEndPoint:(NSString *)endPoint requestType:(taskType)requestType params:(NSMutableDictionary *)parameters imageKey:(NSString *)imageKey secondImageKey:(NSString*)secondImageKey;

//call any get/post/put/patch/delete service
- (void)callServiceWithRequestType:(taskType)requestType method:(serviceMethod)method params:(NSMutableDictionary*)params urlEndPoint:(NSString*)endPoint;

//default response type is json but for xml and plist we can specify with another parameter
- (void)callServiceWithRequestType:(taskType)requestType method:(serviceMethod)method params:(NSMutableDictionary*)params urlEndPoint:(NSString*)endPoint responseFormat:(responseType)responseFormat;

//any secondary url
- (void)getContentOfUrl:(NSString*)url requestType:(taskType)requestType;

- (void)getContentOfUrl:(NSString*)url requestType:(taskType)requestType responseFormat:(responseType)responseFormat;

//cancel requests
- (void)cancelAllRequests;

@property (strong, nonatomic) id<AFConnectionDelegate> delegate;

@end
