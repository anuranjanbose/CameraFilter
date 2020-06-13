//
//  PhotosCollectionViewController.swift
//  CameraFilter
//
//  Created by Anuranjan Bose on 12/06/20.
//  Copyright © 2020 Anuranjan Bose. All rights reserved.
//

import Foundation
import UIKit
import Photos

class PhotosCollectionViewController: UICollectionViewController {
    
    private var images = [PHAsset]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populatePhotos()
    }
    
    private func populatePhotos() {
        
        PHPhotoLibrary.requestAuthorization { [weak self] status in
            
            if status == .authorized {
                /// access photo from photo library
                let assets = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: nil)
                
                assets.enumerateObjects { (object, count, stop) in
                    
                    self?.images.append(object)
                }
                
                self?.images.reverse()
                print(self?.images)
            }
            
        }
    }
}
