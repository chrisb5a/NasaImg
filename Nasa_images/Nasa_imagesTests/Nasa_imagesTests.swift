//
//  Nasa_imagesTests.swift
//  Nasa_imagesTests
//
//  Created by CHRISTIAN BEYNIS on 8/8/22.
//

import XCTest
@testable import Nasa_images

class NetworkManagerTests: XCTestCase {

    var networkManager: NetworkManager?
    
    private var NasaInfos: [NasaImg] = []
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        self.networkManager = NetworkManager.sharedInstance()
        
    }

    override func tearDownWithError() throws {
        self.networkManager = nil
        try super.tearDownWithError()
    }

    func testGetModelDataSuccess() {
        // Arrange  // models = NasaInfos
        
        var NasaInfosTest: [NasaImg] = []
        
//        let expectation = XCTestExpectation(description: "Successfully Fetched Movies")
        
        // Act
        
        
        self.networkManager?.fetchNasaInfo{  NasaInfo in
            
                guard let NasaInfos = NasaInfo as? [NasaImg]
                else {
                    print("Nothing")
                    return
                    
                }
                self.NasaInfos.append(contentsOf: NasaInfos)
//                expectation.fulfill()
                NasaInfosTest = self.NasaInfos
            }
                XCTAssert(NasaInfosTest.count == 0)
        
        }
        
        
//        self.networkManager?.fetchNasaInfo {
//            [weak self] NasaInfo in
//
//                guard let NasaInfos = NasaInfo as? [NasaImg] else { return }
//                self?.NasaInfos.append(contentsOf: NasaInfos)
//
//            }
//
//
//        // Assert
//        XCTAssert(self.NasaInfos.count==0)
//        //XCTAssertEqual(NasaInfos.first?.title, "The Full Moon of 2021")
//
//    }
    
    

}

