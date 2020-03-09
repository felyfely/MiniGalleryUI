//
//  MiniGalleryUIServiceProvider.swift
//  MiniGalleryUI
//
//  Created by 付 旦 on 3/8/20.
//  Copyright © 2020 付 旦. All rights reserved.
//

import Foundation
import UIKit

open class MiniGalleryUIServiceProvider {}

public extension MiniGalleryUIServiceProvider {
    class func getMiniGalleryUIViewController(items: [GalleryItem], delegate: MiniGallerySelectionDelegate? = nil) -> UIViewController {
        let miniGalleryUIViewController = MiniGalleryViewController.loadFromStoryboard()
        miniGalleryUIViewController.set(items: items)
        miniGalleryUIViewController.delegate = delegate
        return miniGalleryUIViewController
    }
}

/// a data structure required for display mini gallery UI
public struct GalleryItem: Codable, Hashable {
    public let id: Int
    public let imageUrl: URL
    public let videoUrl: URL
}

/// if additional action is required for selection, use this protocal to track the state
public protocol MiniGallerySelectionDelegate: class {
    func didSelect(item: GalleryItem, at index: Int, from viewController: UIViewController)
}
