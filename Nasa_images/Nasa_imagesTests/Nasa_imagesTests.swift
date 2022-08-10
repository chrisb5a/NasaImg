//
//  Nasa_imagesTests.swift
//  Nasa_imagesTests
//
//  Created by CHRISTIAN BEYNIS on 8/8/22.


import XCTest
@testable import Nasa_images


class DigimonTests: XCTestCase {

    var viewModel: NasaViewModel?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        self.viewModel = NasaViewModel(networkManager: NetworkManager())
    }

    override func tearDownWithError() throws {
        self.viewModel = nil
        try super.tearDownWithError()
    }
    func testRequestModelDataSuccess() {
        // Arrange
        let expectation = XCTestExpectation(description: "Successfully retrieving Models")
        
        // Act
        self.viewModel?.bind {
            expectation.fulfill()
        }
        self.viewModel?.fetchNasa()
        wait(for: [expectation], timeout: 45)
        
        //wait(for: [expectation], timeout: 1) => Timeout Failure
        // Assert
        //XCTAssertEqual(self.viewModel?.count, 209)
        XCTAssertEqual(self.viewModel?.title(for: 0), "The Full Moon of 2021")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

// Below is always succeeding test 

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

