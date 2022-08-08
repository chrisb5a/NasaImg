//
//  NetworkManager.h
//  Nasa_images
//
//  Created by CHRISTIAN BEYNIS on 8/6/22.
//

#import <UIKit/UIKit.h>
#import "NasaImg.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject

+(instancetype)sharedInstance;

-(void)fetchNasaInfo:(void(^)(NSMutableArray*))completion;

-(void)fetchImageWithString:(NSString*)imageString completion:(void(^)(UIImage*))completion;

@end

NS_ASSUME_NONNULL_END
