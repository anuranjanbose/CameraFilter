//
//  ViewController.swift
//  CameraFilter
//
//  Created by Anuranjan Bose on 12/06/20.
//  Copyright © 2020 Anuranjan Bose. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var applyFilterButton: UIButton!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.applyFilterButton.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navC = segue.destination as? UINavigationController,
            let photoCollectionVC = navC.viewControllers.first as? PhotosCollectionViewController else {
                return
        }
        
        photoCollectionVC.selectedPhoto.subscribe(onNext: {[weak self] photo in
            
            DispatchQueue.main.async {
                self?.updateUI(with: photo)
            }
        })
        .disposed(by: disposeBag)
    }

    private func updateUI(with image: UIImage) {
        photoImageView.image = image
        applyFilterButton.isHidden = false
    }
    
    @IBAction func applyFilter() {
        
        guard let sourceImage = self.photoImageView.image else { return }
        FilterService().applyFilter(to: sourceImage) {[weak self] image in
            DispatchQueue.main.async {
                self?.photoImageView.image = image
            }
            
        }
    }

}

