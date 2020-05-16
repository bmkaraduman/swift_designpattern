//
//  LoadImageService.swift
//  ProxyMethod
//
//  Created by macbookpro on 29.04.20.
//  Copyright © 2020 macbookpro. All rights reserved.
//

import Foundation

class LoadImageService: LoadServiceProtocol {
    func loadImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        
        let session = URLSession.init(configuration: config)
        session.dataTask(with: url, completionHandler: completion).resume()
    }
}
