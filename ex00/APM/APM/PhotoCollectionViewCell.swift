//
//  PhotoCollectionViewCell.swift
//  APM
//
//  Created by Gordon RASS-KWASI on 2/7/17.
//  Copyright © 2017 Gordon RASS-KWASI. All rights reserved.
//

import UIKit

enum Status {
    case Download
    case finish
}

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var Image: UIImageView!
    
    @IBOutlet weak var ActivityMonitor: UIActivityIndicatorView!
    
    var status: Status {
        return Status.Download
    }
    
}
