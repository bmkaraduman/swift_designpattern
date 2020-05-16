//
//  DetailViewController.swift
//  ProxyMethod
//
//  Created by macbookpro on 29.04.20.
//  Copyright © 2020 macbookpro. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let url = URL(string: "https://www.liga-zwei.de/heute-fenerbahce-vs-galatasaray-tipp-wetten-quoten-2019/")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImage()
    }
    
    
    @IBAction func refreshButton(_ sender: UIButton) {
        cacheData = nil
        imageView.image = nil
        loadImage()
    }
    
    func loadImage()
    {
        let imageService = LoadImageService()
        let proxy = Proxy(m_service: imageService)
        proxy.loadImage(url: url) { [weak self](data, response, error) in
            guard let self = self, let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
    }
    
    
    
}
