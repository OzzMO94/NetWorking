//
//  ImageViewController.swift
//  NetWorking
//
//  Created by Максим Хабиров on 22.02.2022.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        fetchImage()
    }
    
    private func fetchImage() {
        guard let url = URL(string: URLExamples.imageURL.rawValue) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let responce = response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            print(responce)
            
            guard let image = UIImage(data: data) else {return}
            
            DispatchQueue.main.async {
                self.imageView.image = image
                self.activityIndicator.stopAnimating()
            }
        }.resume()
    }
}
