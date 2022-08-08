//
//  NasaViewModel.swift
//  Nasa_images
//
//  Created by CHRISTIAN BEYNIS on 8/7/22.
//

import UIKit

@objcMembers
class NasaViewModel: NSObject {
    
    private let networkManager: NetworkManager
    private var NasaInfos: [NasaImg] = [] {
        didSet {
            self.updateHandler?()
        }
    }
    
    //private var currentPage: PageResult?
    private var updateHandler: (() -> Void)?
    
    @objc
    init(networkManager: NetworkManager = NetworkManager.sharedInstance()) {
        self.networkManager = networkManager
    }
    
    @objc
    func bind(updateHandler: @escaping () -> Void) {
        self.updateHandler = updateHandler
    }
    
    @objc
    func fetchNasa() {
        
//        var pageNumber = 1
//        if let pageN = self.currentPage?.page {
//            pageNumber = pageN + 1
//        }
        
        self.networkManager.fetchNasaInfo { [weak self] NasaInfo in
            // unowned -> let
            // weak -> var
           // self?.currentPage = pageResult
            guard let NasaInfos = NasaInfo as? [NasaImg] else { return }
            self?.NasaInfos.append(contentsOf: NasaInfos)
        }
    }
    
    var count: Int {
        return self.NasaInfos.count
    }
    
    func title(for index: Int) -> String? {
        guard index < self.NasaInfos.count else { return nil }
        return self.NasaInfos[index].title
    }
    
    func image(for index: Int, completion: @escaping (UIImage?) -> Void) {
        guard index < self.NasaInfos.count else {
            completion(nil)
            return
        }

        self.networkManager.fetchImage(with: self.NasaInfos[index].url) { (image: UIImage?) in
            completion(image)
        }
    }
    
    func example() -> (Int, String) {
        return (5, "Hello")
    }
    
}

extension NasaViewModel {
    
    @objc
    func exampleToObjc() -> TupleSubstitute {
        let tuple = self.example()
        return TupleSubstitute(num: tuple.0, str: tuple.1)
    }
    
}

class TupleSubstitute: NSObject {
    
    let number: Int
    let str: String
    
    init(num: Int, str: String) {
        self.number = num
        self.str = str
    }
    
}

extension NetworkManager {
    
    @objc
    func doSomething() {
        
    }
    
}

