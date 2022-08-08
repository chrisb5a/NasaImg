//
//  NetworkManager.m
//  Nasa_images
//
//  Created by CHRISTIAN BEYNIS on 8/6/22.
//

#import "NetworkManager.h"

@implementation NetworkManager

+(instancetype)sharedInstance {
    static NetworkManager* _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

-(instancetype)init {
    self = [super self];
    return self;
}

// MARK: Network Fetching

//-(void)fetchNasaInfo {
//
//    NSString *urlString = @"https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&start_date=2022-01-01&end_date=2022-01-05";
//
//    NSURL *url = [NSURL URLWithString:urlString];
//
//    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        //NSLog(@"finished");
//
//        NSString *dummy = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//
//        NSLog(dummy);
//
//        }] resume];
//
//
//}


-(void)fetchNasaInfo:(void (^)(NSMutableArray* _Nullable))completion {
    
    //For pagination we can take date=**********&end_date=********** in urlString and truncate
    //Create an array for containing the date and end_date that will correspond to each page
    // at prefect and we can query the dates corresponding to each page
    
    
    
    NSString *urlString = @"https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&start_date=2022-01-01&end_date=2022-06-05";
    
    NSURL* url = [NSURL URLWithString:urlString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completion(nil);
            return;
        }
        
        if (data == nil) {
            NSLog(@"Empty");
            completion(nil);
            return;
        }
        
        
        
        id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        if ([object isKindOfClass:[NSArray class]]) {
            
            NSLog(@"Array");
            
            NSArray* Array = object;
            
            NSMutableArray *myArray = [NSMutableArray array];
            
            for( NasaImg __strong* element in Array) {
                element = [[NasaImg alloc] initWithJsonDictionary :element];
                [myArray addObject:element];
                
            }
                
            completion(myArray);
            
            return;
        }
                
                
    }] resume];
    
}



-(void)fetchImageWithString:(NSString *)imageString completion:(void (^)(UIImage * _Nullable))completion {
    
    
    NSURL* url = [NSURL URLWithString: imageString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            
            completion(nil);
            return;
        }
        
        if (data == nil) {
            completion(nil);
            return;
        }
        
        UIImage* image = [UIImage imageWithData:data];
        completion(image);
    }] resume];
    
}




//-(void)fetchImageWithString:(NSString *)imageString completion:(void (^)(UIImage * _Nullable))completion {
//
//    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", BASE_IMAGE_URL, imageString]];
//
//    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        if (error) {
//            completion(nil);
//            return;
//        }
//
//        if (data == nil) {
//            completion(nil);
//            return;
//        }
//
//        UIImage* image = [UIImage imageWithData:data];
//        completion(image);
//    }] resume];
//
//}




@end
