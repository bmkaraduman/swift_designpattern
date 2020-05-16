//
//  Proxy.swift
//  ProxyMethod
//
//  Created by macbookpro on 29.04.20.
//  Copyright © 2020 macbookpro. All rights reserved.
//

import Foundation

var cacheData: Data?

class Proxy: LoadServiceProtocol
{
    private var service: LoadServiceProtocol
    
    init(m_service: LoadServiceProtocol) {
        self.service = m_service
    }
    
    func loadImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        if cacheData == nil {
            service.loadImage(url: url) { (data, response, error) in
                cacheData = data
                completion(data, response, error)
            }
        } else
        {
            completion(cacheData, nil, nil)
        }
    }
    
    
}
