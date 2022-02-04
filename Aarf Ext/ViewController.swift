//
//  ViewController.swift
//  Aarf Ext
//
//  Created by 123 on 04/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tabView:UIView!
    @IBOutlet weak var roundView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabView.layer.cornerRadius = 40
        tabView.layer.masksToBounds = true
        
        roundView.layer.cornerRadius = 40
        roundView.layer.masksToBounds = true
    }
    
    override func viewDidLayoutSubviews() {
        tabView.addTabLayer(roundViewH: 80)
    }
}


extension UIView{
    
    func addTabLayer(roundViewH:Int){
        
        let aPath = UIBezierPath()
        aPath.move(to: CGPoint(x:0, y:0))
        aPath.addLine(to: CGPoint(x: self.frame.size.width/2 - CGFloat(roundViewH)*0.7, y: 0))
        aPath.addLine(to: CGPoint(x: self.frame.size.width/2, y: CGFloat(roundViewH/2)))
        aPath.addLine(to: CGPoint(x: self.frame.size.width/2 + CGFloat(roundViewH)*0.7, y: 0))
        aPath.addLine(to: CGPoint(x: self.frame.size.width, y: 0))
        aPath.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        aPath.addLine(to: CGPoint(x: 0, y: self.frame.size.height))
        aPath.close()
   
        //Add layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = aPath.cgPath
        
        // apply other properties related to the path
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 1.0
        shapeLayer.position = CGPoint(x: 0, y: 0)
        
        // add the new layer to our custom view
        self.layer.addSublayer(shapeLayer)
    }
    
}
