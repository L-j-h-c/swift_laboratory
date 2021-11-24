//
//  ViewController.swift
//  CustomSegmentedControl
//
//  Created by Junho Lee on 2021/11/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        

        let array: [String] = ["Red", "Blue", "Green"]
        let sc = CustomSegmentedControl(items: array)
        sc.frame = CGRect(x: 50, y: 400, width: 150, height: 30)
        sc.center = CGPoint(x: self.view.frame.width/2, y: 400)
        sc.backgroundColor = UIColor.gray
        sc.tintColor = UIColor.white
        sc.addTarget(self, action: #selector(segconChanged(segcon:)), for: UIControl.Event.valueChanged)
        sc.selectedSegmentIndex = 1
        self.view.addSubview(sc)
    }

    
    @objc func segconChanged(segcon: UISegmentedControl) {
        
        var color: UIColor!
        var text: String!
        switch segcon.selectedSegmentIndex {
        case 0: color = UIColor.red
            text = "Red"
        case 1: color = UIColor.blue
            text = "Blue"
        case 2: color = UIColor.green
            text = "Green"
        default: return
        }
        self.segLabel.backgroundColor = color
        self.segLabel.text = text
        
    }
    
    lazy var segLabel: UILabel = {
        // Create Label.
        let l: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        l.backgroundColor = UIColor.white
        l.layer.masksToBounds = true
        l.layer.cornerRadius = 75.0
        l.textColor = UIColor.white
        l.shadowColor = UIColor.gray
        l.font = UIFont.systemFont(ofSize: 30.0)
        l.textAlignment = NSTextAlignment.center
        l.layer.position = CGPoint(x: self.view.bounds.width/2, y: 200)
        return l
    }()
    
}

class CustomSegmentedControl: UISegmentedControl{
    private let segmentInset: CGFloat = 5       //your inset amount
    private let segmentImage: UIImage? = UIImage(color: UIColor.red)    //your color

    override func layoutSubviews(){
        super.layoutSubviews()

        //background
        layer.cornerRadius = bounds.height/2
        //foreground
        let foregroundIndex = numberOfSegments
        if subviews.indices.contains(foregroundIndex),  let foregroundImageView = subviews[foregroundIndex] as? UIImageView
        {
            foregroundImageView.bounds = foregroundImageView.bounds.insetBy(dx: segmentInset, dy: segmentInset)
            foregroundImageView.image = segmentImage    //substitute with our own colored image
            foregroundImageView.layer.removeAnimation(forKey: "SelectionBounds")    //this removes the weird scaling animation!
            foregroundImageView.layer.masksToBounds = true
            foregroundImageView.layer.cornerRadius = foregroundImageView.bounds.height/2
        }
    }
}

extension UIImage{
    
    //creates a UIImage given a UIColor
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
