//
//  Nasa_imagesTests.m
//  Nasa_imagesTests
//
//  Created by CHRISTIAN BEYNIS on 8/6/22.
//

#import <XCTest/XCTest.h>
#import "NetworkManager.h"



@interface Nasa_imagesTests : XCTestCase

@property NetworkManager *NtwkTest;
@property (nonatomic, strong) NSMutableArray* NasaInfos;


@end

@implementation Nasa_imagesTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _NtwkTest = [[NetworkManager alloc] init];
    self.NasaInfos = [[NSMutableArray alloc] init];
    
   
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testfetchNasaInfo {
//    _NasaInfos = [];
    [[NetworkManager sharedInstance] fetchNasaInfo: ^(NSMutableArray * _Nullable NasaInfo) {
        [self.NasaInfos addObjectsFromArray: NasaInfo];
        //self.NasaInfos.count == NasaInfo.count;
        NSLog(@"ok");
        XCTAssertTrue(self.NasaInfos.count == NasaInfo.count);
        XCTAssertEqual(self.NasaInfos.count, 1);
        
        
        
        
      }] ;
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    //XCTAssertEqual(self.NasaInfos.count,1);

    XCTAssertTrue(self.NasaInfos.count == 0);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
