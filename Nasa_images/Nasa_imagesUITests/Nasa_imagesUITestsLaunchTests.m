//
//  Nasa_imagesUITestsLaunchTests.m
//  Nasa_imagesUITests
//
//  Created by CHRISTIAN BEYNIS on 8/6/22.
//

#import <XCTest/XCTest.h>

@interface Nasa_imagesUITestsLaunchTests : XCTestCase

@end

@implementation Nasa_imagesUITestsLaunchTests

+ (BOOL)runsForEachTargetApplicationUIConfiguration {
    return YES;
}

- (void)setUp {
    self.continueAfterFailure = NO;
}

- (void)testLaunch {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    // Insert steps here to perform after app launch but before taking a screenshot,
    // such as logging into a test account or navigating somewhere in the app

    XCTAttachment *attachment = [XCTAttachment attachmentWithScreenshot:XCUIScreen.mainScreen.screenshot];
    attachment.name = @"Launch Screen";
    attachment.lifetime = XCTAttachmentLifetimeKeepAlways;
    [self addAttachment:attachment];
}

@end
