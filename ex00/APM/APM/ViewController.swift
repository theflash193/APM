//
//  ViewController.swift
//  APM
//
//  Created by Gordon RASS-KWASI on 2/7/17.
//  Copyright © 2017 Gordon RASS-KWASI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {
    // define background qos class
    // define queue with qos
    var qos: DispatchQoS.QoSClass {
        return DispatchQoS.background.qosClass
    }
    // counter Image download
    
    var queue: DispatchQueue {
        return DispatchQueue.global(qos: qos)
    }
//    var queue: DispatchQueue
    
    let URLRessource = ["https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/a3411.jpg?itok=oxF0ZLL0", "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/pia14454.jpg?itok=6C1bhU6q", "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/potw1652a.jpg?itok=5osF5N3n", "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/aurora_vir_2016357_lrg.jpg?itok=t_C47OWx", "https://jojo"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PhotoCollectionViewCell
        
        let url = URL(string: URLRessource[indexPath.row])
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        // animate ActivityMonitor
        cell.ActivityMonitor.startAnimating()
        
        let task = session.dataTask(with: url!) { (data, reponse, error) in
            if error == nil {
                if let httpreponse = reponse as? HTTPURLResponse {
                    switch httpreponse.statusCode {
                    case 200:
                        DispatchQueue.main.async {
                            UIApplication.shared.isNetworkActivityIndicatorVisible = true
                            let image = UIImage(data: data!)
                            cell.Image.image = image
                            cell.ActivityMonitor.stopAnimating()
                            cell.ActivityMonitor.isHidden = true
                            UIApplication.shared.isNetworkActivityIndicatorVisible = false
                        }
                    default:
                        self.ShowErrorAlert(message: "Server send statut code error for " + self.URLRessource[indexPath.row])
                    }
                }
            } else {
                self.ShowErrorAlert(message: "fail to Access to " + self.URLRessource[indexPath.row])
                cell.ActivityMonitor.stopAnimating()
                cell.ActivityMonitor.isHidden = false
            }
        }
        task.resume()
        // request online
        return cell
    }
    
    // create an Alert whit ok
    func ShowErrorAlert(message: String) {
        let Alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let ActionCancel = UIAlertAction(title: "Ok", style: .default) { _ in
            Alert.dismiss(animated: true)
        }
        Alert.addAction(ActionCancel)
        self.present(Alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EnvoieImage" {
            if let destination = segue.destination as? ImageViewController {
                if let cell = sender as? PhotoCollectionViewCell {
                    destination.image = cell.Image.image
                }
            }
        }
    }
}

