//
//  ImageController.swift
//  APM
//
//  Created by Gordon RASS-KWASI on 6/2/17.
//  Copyright © 2017 Gordon RASS-KWASI. All rights reserved.
//

import Foundation
import UIKit

class ImageViewController: UIViewController {
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
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // create an Alert whit ok
}
