//
//  ViewController.swift
//  Rounds Game
//
//  Created by Seyran Saakyan on 27.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var myViewsArray = [UIView]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(createView(touch:)))
        self.view.addGestureRecognizer(recognizer)
        
    }
    @IBAction func createView(touch: UITapGestureRecognizer){
        let touchPoint = touch.location(in: self.view)
        let myView = UIView()
        myView.frame = CGRect(x: touchPoint.x, y: touchPoint.y, width: 100, height: 100)
        myView.backgroundColor = .blue
        myView.center = touchPoint
        myView.layer.cornerRadius = myView.frame.width / 2
        removeCircles(for: myView)
        
        myViewsArray.append(myView)
        self.view.addSubview(myView)
    }
    
    func removeCircles(for myView: UIView){
        for circle in myViewsArray{
            if myView.frame.intersects((circle.frame)){
                circle.removeFromSuperview()
                myViewsArray = myViewsArray.filter({$0 != circle})
            }
        }
    }
}
