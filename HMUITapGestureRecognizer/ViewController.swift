//
//  ViewController.swift
//  HMUITapGestureRecognizer
//
//  Created by Дмитрий Яновский on 17.01.24.
//

import UIKit

class ViewController: UIViewController {
    
   
    let spider = UIImageView(frame: CGRect(x: 150, y: 450, width: 100, height: 100))
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
        setupSpider()
    }
    
    func setupSpider(){
        let tapGesturere = UITapGestureRecognizer(target: self, action: #selector(imageTap))
        spider.image = UIImage(named: "spider")
        view.addSubview(spider)
        spider.isUserInteractionEnabled = true
        spider.addGestureRecognizer(tapGesturere)
    }
    @objc func imageTap(){
        print("tap")
        
        let sizeViewBounds = view.bounds
        let newX = CGFloat.random(in: 0...(sizeViewBounds.width - spider.frame.width))
        let newY = CGFloat.random(in: 0...(sizeViewBounds.height - spider.frame.height))
        
        UIView.animate(withDuration: 0.2){
            self.spider.frame.origin = CGPoint(x: newX, y: newY)
            
            UIView.animate(withDuration: 0.2, animations: {
                self.spider.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: -0.5...0.2))
            }) { finished in
                UIView.animate(withDuration: 0.2){
                    self.spider.transform = .identity
                }
                
            }
        }
    }
}

