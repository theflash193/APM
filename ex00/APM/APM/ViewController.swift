//
//  ViewController.swift
//  APM
//
//  Created by Gordon RASS-KWASI on 2/7/17.
//  Copyright © 2017 Gordon RASS-KWASI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource  {
    let URLRessource = ["https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/a3411.jpg?itok=oxF0ZLL0", "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/pia14454.jpg?itok=6C1bhU6q", "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/potw1652a.jpg?itok=5osF5N3n", "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/aurora_vir_2016357_lrg.jpg?itok=t_C47OWx"]
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func load_image(image_url_string:String, view:UIImageView)
    {
        
    }
}

