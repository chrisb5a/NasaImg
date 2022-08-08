//
//  NasaImg.m
//  Nasa_images
//
//  Created by CHRISTIAN BEYNIS on 8/6/22.
//

#import "NasaImg.h"



@implementation NasaImg

-(instancetype)initWithJsonDictionary:(NSDictionary *)dictionary {
    self = [super self];
    if (self) {
        self.copyright = [dictionary valueForKey:@"copyright"];
        self.date = [dictionary valueForKey:@"date"];
        self.title = [dictionary valueForKey:@"title"];
        self.explanation = [dictionary valueForKey:@"explanation"];
        self.hdurl = [dictionary valueForKey:@"hdurl"] ;
        self.mediaType = [dictionary valueForKey:@"media_type"];
        self.serviceVersion = [dictionary valueForKey:@"service_version"];
        self.url = [dictionary valueForKey:@"url"];
        
    }
    
    return self;
}


@end
