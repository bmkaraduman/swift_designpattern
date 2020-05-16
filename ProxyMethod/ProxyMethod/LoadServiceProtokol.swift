//
//  LoadServiceProtokol.swift
//  ProxyMethod
//
//  Created by macbookpro on 29.04.20.
//  Copyright © 2020 macbookpro. All rights reserved.
//

import Foundation

protocol  LoadServiceProtocol {
    func loadImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ())
}
