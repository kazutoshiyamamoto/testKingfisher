//
//  ViewController.swift
//  testKingfisher
//
//  Created by home on 2019/03/23.
//  Copyright © 2019 Swift-beginners. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showImage(imageView: imageView, imageUrl: "https://o.aolcdn.com/images/dims?resize=2000%2C2000%2Cshrink&image_uri=https%3A%2F%2Fs.yimg.com%2Fos%2Fcreatr-uploaded-images%2F2019-03%2F17a673a0-4d14-11e9-a77f-c09a6c680f31&client=a1acac3e1b3290917d92&signature=ab5e9583dc50d6e43a5f54ba50b22eec11c35102")
    }
    
    private func showImage(imageView: UIImageView, imageUrl: String) {
        let url = URL(string: imageUrl)!
        
        let task = URLSession.shared.dataTask(with: url) { data, responds, error in
            // リクエストに失敗
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data, let response = responds as? HTTPURLResponse else {
                return
            }
            
            // リクエスト成功
            if response.statusCode == 200 {
                DispatchQueue.main.async {
                    imageView.image = UIImage(data: data)
                }
            } else {
                // サーバー側でリクエストされたものが正常に返せていない
                print(response.statusCode)
            }
        }
        task.resume()
    }
}
