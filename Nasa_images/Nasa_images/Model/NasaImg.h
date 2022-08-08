//
//  NasaImg.h
//  Nasa_images
//
//  Created by CHRISTIAN BEYNIS on 8/6/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NasaImg : NSObject


@property (nonatomic, assign) NSString* copyright;
@property (nonatomic, assign) NSString* date;
@property (nonatomic, assign) NSString* explanation;
@property (nonatomic, strong) NSString* hdurl;
@property (nonatomic, assign) NSString* mediaType;
@property (nonatomic, assign) NSString* serviceVersion;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* url;

-(instancetype)initWithJsonDictionary:(NSDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END
