//
//  ImageController.swift
//  APM
//
//  Created by Gordon RASS-KWASI on 6/2/17.
//  Copyright © 2017 Gordon RASS-KWASI. All rights reserved.
//

import Foundation
import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    var image: UIImage?
    var ImageView: UIImageView?
    @IBOutlet weak var ScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let img = image {
            ImageView = UIImageView(image: img)
            ScrollView.addSubview(ImageView!)
            ScrollView.contentSize = (ImageView?.frame.size)!
            ScrollView.delegate = self
            ScrollView.maximumZoomScale = 100
            ScrollView.minimumZoomScale = 0.3
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return ImageView
    }
    // create an Alert whit ok
}
