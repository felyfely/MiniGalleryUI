//
//  MiniGalleryUIUtils.swift
//  MiniGalleryUI
//
//  Created by 付 旦 on 3/8/20.
//  Copyright © 2020 付 旦. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()
let currentBundle = Bundle.init(for: MiniGalleryUIServiceProvider.self)

public struct GalleryItem: Codable, Hashable {
    public let id: Int
    public let imageUrl: URL
    public let videoUrl: URL
}

func loadImage(imageUrl: URL, completionHandler: @escaping (URL, UIImage?) -> Void ) {
    if let image = imageCache.object(forKey: imageUrl.absoluteString as NSString) {
        completionHandler(imageUrl, image)
    } else {
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: imageUrl)
                if let image = UIImage(data: data) {
                    imageCache.setObject(image, forKey: imageUrl.absoluteString as NSString)
                    completionHandler(imageUrl, image)
                }
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
    }
}

class CacheManager {
    
    static let shared = CacheManager()
    
    private let fileManager = FileManager.default
    
    private lazy var mainDirectoryUrl: URL = {
        
        let documentsUrl = self.fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first!
        return documentsUrl
    }()
    
    func getFileWith(url: URL, completionHandler: @escaping (Result<URL, Error>) -> Void ) {
        
        let file = directoryFor(url: url)
        
        //return file path if already exists in cache directory
        guard !fileManager.fileExists(atPath: file.path)  else {
            completionHandler(Result.success(file))
            return
        }
        
        DispatchQueue.global().async {
            if let videoData = try? Data(contentsOf: url) {
                try? videoData.write(to: file)
            }
        }
        
        DispatchQueue.main.async {
            completionHandler(Result.success(url))
        }
    }
    
    private func directoryFor(url: URL) -> URL {
        
        let fileURL = url.lastPathComponent
        
        let file = self.mainDirectoryUrl.appendingPathComponent(fileURL)
        
        return file
    }
}
