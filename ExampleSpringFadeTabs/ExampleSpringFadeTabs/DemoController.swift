//
//  DemoController.swift
//  ExampleSpringFadeTabs
//
//  Created by Azhar Anwar on 7/13/23.
//

import UIKit

class DemoController: UIViewController {
    
    // MARK: - Properties
    private let imageUrlString: String
    
    // MARK: - init
    init(imageUrlString: String) {
        self.imageUrlString = imageUrlString
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let demoImageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: view.frame.width, height: view.frame.height)))
        view.addSubview(demoImageView)
        demoImageView.contentMode = .scaleAspectFill
        
        let imageUrl: URL = URL(string: imageUrlString)!
        
        let task = URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            if error != nil {
                print("Error: \(String(describing: error))")
            } else {
                if let imageData = data {
                    DispatchQueue.main.async {
                        let image = UIImage(data: imageData)
                        demoImageView.image = image
                    }
                }
            }
        }
        
        task.resume()
    }
    
    // MARK: - Methods
}
