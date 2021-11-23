//
//  ImageViewExt.swift
//  GithubAwesomeRepos
//
//  Created by Ghadeer El-Mahdy on 22/11/2021.
//

import Foundation
import  UIKit

let imageCache = NSCache<NSString, UIImage>()
extension UIImageView {
    func loadImageUsingCache(withUrl urlString : String) {
        let url = URL(string: urlString)
        if url == nil {return}
        self.image = nil

        // check cached image
        if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
            self.image = cachedImage
            return
        }

        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .medium)
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.center = self.center

        // if not, download image from url
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }

            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                    activityIndicator.removeFromSuperview()
                }
            }

        }).resume()
    }
}
//    // Image downloader with cache option
//    fileprivate let imageCache = NSCache<NSString, UIImage>()
//    extension UIImageView {
//        func loadImageUsingCache(withUrl urlString : String) {
//            self.image = nil
//            // check cached image
//            if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
//                self.image = cachedImage
//                return
//            }
//
//            let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .medium)
//            addSubview(activityIndicator)
//            activityIndicator.startAnimating()
//            activityIndicator.center = self.center
//
//            // if not, download image from url
//            fetchImageURL(imageURL: urlString) { res in
//                DispatchQueue.main.async {
//                switch res {
//                case .success(let imageData):
//                    if let image = UIImage(data: imageData) {
//                        imageCache.setObject(image, forKey: urlString as NSString)
//                        self.image = image
//                        activityIndicator.removeFromSuperview()
//                    }
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//              }
//            }
//        }
//        private func fetchImageURL (imageURL:String, completion: @escaping ResponseHandler<Data>) {
//            NetworkManager.shared.performNetworRequest(url: imageURL, completion: completion)
//        }
//    }
