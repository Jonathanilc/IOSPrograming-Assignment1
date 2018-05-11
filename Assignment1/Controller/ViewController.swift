//
//  ViewController.swift
//  Assignment1
//
//  Created by Jonathan on 20/03/18.
//  Copyright © 2018 Jonathan. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    

    
    var lastPoint = CGPoint(x:0 ,y: 0)
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var brushWidth: CGFloat = 10.0
    var opacity: CGFloat = 1.0
    var swiped = false
    var currentTag = 0
    
    var startPoint = CGPoint()
    var beforePoint = CGPoint()
    var selectedColor : UIColor = UIColor.blue
    var shapeType = 0
    
    
    @IBOutlet weak var setting: UIView!

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var tempImageView: UIImageView!
    
    
    @IBOutlet weak var buttonEclipce: UIButton!
    
    @IBOutlet weak var buttonRect: UIButton!
    
    @IBOutlet weak var buttonLine: UIButton!
    
    @IBOutlet weak var buttonFreeStyle: UIButton!
    
    @IBOutlet weak var buttonRoundedRect: UIButton!
    
    @IBOutlet weak var buttonEraser: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Settings(_ sender: Any) {
        handleMore()
        resetBtns()
    }
    
    func resetBtns() {
        if buttonEclipce.tag == currentTag {
            buttonEclipce.setImage(#imageLiteral(resourceName: "circleSelected"), for: .selected)
        }else{
            buttonEclipce.setImage(#imageLiteral(resourceName: "circle"), for: .selected)
        }
        
        if buttonLine.tag == currentTag {
            buttonLine.setImage(#imageLiteral(resourceName: "lineIconSelected"), for: .selected)
            print("selected")
        }else{
            buttonLine.setImage(#imageLiteral(resourceName: "lineIcon"), for: .selected)
            print("normal")
        }
        
        if buttonRect.tag == currentTag {
            buttonRect.setImage(#imageLiteral(resourceName: "rectSelected"), for: .selected)
        }else{
            buttonRect.setImage(#imageLiteral(resourceName: "rect"), for: .selected)
        }
        
        if buttonFreeStyle.tag == currentTag {
            buttonFreeStyle.setImage(#imageLiteral(resourceName: "wavelineSelected"), for: .selected)
        }else{
            buttonFreeStyle.setImage(#imageLiteral(resourceName: "waveline"), for: .selected)
        }
        
        if buttonRoundedRect.tag == currentTag {
            buttonRoundedRect.setImage(#imageLiteral(resourceName: "roundedRectSelected"), for: .selected)
        }else{
            buttonRoundedRect.setImage(#imageLiteral(resourceName: "roundedRect"), for: .selected)
        }
        if buttonEraser.tag == currentTag {
            buttonEraser.setImage(#imageLiteral(resourceName: "eraser-1"), for: .selected)
        }else{
            buttonEraser.setImage(#imageLiteral(resourceName: "eraser"), for: .selected)
        }
    }
    
    let blackView = UIView()
    func handleMore() {
        if let window = UIApplication.shared.keyWindow {
            
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            window.addSubview(blackView)
            
            window.addSubview(setting)
            
            let height: CGFloat = 200
            let y = window.frame.height - height
            
            setting.frame = CGRect(x: 0,y: window.frame.height,width: window.frame.width,height: height)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                self.setting.frame = CGRect(x: 0,y: y,width: self.setting.frame.width,height: self.setting.frame.height)
            }, completion: nil)
            
        }
        
    }
    
    @objc func handleDismiss() {
        print(123)
        UIView.animate(withDuration: 0.5) {
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow {
                
                self.setting.frame = CGRect(x: 0, y: window.frame.height, width: self.setting.frame.width, height: self.setting.frame.height)
            }
            
        }
        
        
        
    }
    
    
    @IBOutlet weak var labelRGBA: UILabel!
    
    @IBAction func redColorChange(_ sender: UISlider) {
        
        red = CGFloat(sender.value / 255)
        labelRed.text = NSString(format: "%d", Int(sender.value)) as String
        labelRGBA.textColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1)
        selectedColor = UIColor.init(red: red, green: green, blue: blue, alpha: 1)
        print(selectedColor)
    }
    
    @IBOutlet weak var labelRed: UILabel!
    
    @IBAction func greenColorChange(_ sender: UISlider) {
        
        green = CGFloat(sender.value / 255)
        labelGreen.text = NSString(format: "%d", Int(sender.value)) as String
        labelRGBA.textColor = UIColor.init(red: red, green: green, blue: blue, alpha: opacity)
        selectedColor = UIColor.init(red: red, green: green, blue: blue, alpha: opacity)
    }
    
    @IBOutlet weak var labelGreen: UILabel!
    
    @IBAction func blueColorChange(_ sender: UISlider) {
        
        blue = CGFloat(sender.value / 255)
        labelBlue.text = NSString(format: "%d", Int(sender.value)) as String
        labelRGBA.textColor = UIColor.init(red: red, green: green, blue: blue, alpha: opacity)
        selectedColor = UIColor.init(red: red, green: green, blue: blue, alpha: opacity)
    }
    @IBOutlet weak var labelBlue: UILabel!
    
    
    @IBAction func opacityChange(_ sender: UISlider) {
        opacity = CGFloat(sender.value)
        labelOpacity.text = NSString(format: "%.2f", sender.value) as String
        labelOpacity.textColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: opacity)
        labelRGBA.textColor = UIColor.init(red: red, green: green, blue: blue, alpha: opacity)
        selectedColor = UIColor.init(red: red, green: green, blue: blue, alpha: opacity)
    }
    
    @IBOutlet weak var labelOpacity: UILabel!
    
    @IBOutlet weak var labelWidth: UILabel!
    
    @IBAction func widthChange(_ sender: UISlider) {
        brushWidth = CGFloat(sender.value)
        labelWidth.text = NSString(format: "%d", Int(sender.value)) as String
    }
    
    
    
    
    
    
    
    @IBAction func Delete(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Warning", message: "Tap \"Delete All\" button to delete everything in the board", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Delete All", style: .default, handler: { (action: UIAlertAction!) in
            self.mainImageView.image = nil
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
        }))
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
        
    
    @IBAction func Save(_ sender: UIButton) {
        
        UIGraphicsBeginImageContext(mainImageView.bounds.size)
        mainImageView.image?.draw(in: CGRect(x: 0, y: 0,
                                               width: mainImageView.frame.size.width, height: mainImageView.frame.size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        

        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        
        let alert = UIAlertController(title:"saved", message:"Your Image has been saved",preferredStyle:.alert)
        let okAction = UIAlertAction(title:"Ok",style:.default,handler:nil)
        alert.addAction(okAction)
        self.present(alert,animated: true,completion: nil)
    }
    
    
    
    
    
    @IBAction func ShapeBtnDidTap(_ sender: UIButton) {
        
        let tag = sender.tag
        switch tag
        {
        case Shape.eclipse.rawValue:
            shapeType = Shape.eclipse.rawValue
            sender.setImage(#imageLiteral(resourceName: "circleSelected"), for: .selected )
            currentTag = tag
        case Shape.rect.rawValue:
            shapeType = Shape.rect.rawValue
            sender.setImage(#imageLiteral(resourceName: "rectSelected"), for: .selected)
            currentTag = tag
        case Shape.line.rawValue:
            shapeType = Shape.line.rawValue
            sender.setImage(#imageLiteral(resourceName: "lineIconSelected"), for: .selected)
            currentTag = tag
        case Shape.freeStyle.rawValue:
            shapeType = Shape.freeStyle.rawValue
            sender.setImage(#imageLiteral(resourceName: "wavelineSelected"), for: .selected)
            currentTag = tag
        case Shape.roundRect.rawValue:
            shapeType = Shape.roundRect.rawValue
            sender.setImage(#imageLiteral(resourceName: "roundedRectSelected"), for: .selected)
            currentTag = tag
        case Shape.eraser.rawValue:
            shapeType = Shape.eraser.rawValue
            sender.setImage(#imageLiteral(resourceName: "eraser-1"), for: .selected)
            currentTag = tag
        default :
            shapeType = Shape.eclipse.rawValue
        }
        resetBtns()
    }
    
    
    
    
    
    
    @IBAction func handlePan(_ sender: UIPanGestureRecognizer) {
        UIGraphicsBeginImageContext(tempImageView.frame.size)
        let context = UIGraphicsGetCurrentContext()
        if sender.state == .began
        {
            startPoint = sender.location(in: sender.view)
            beforePoint = startPoint
            
            
            
            context?.setBlendMode(CGBlendMode.normal)
            context?.setFillColor(selectedColor.cgColor)
            tempImageView.image?.draw(in: CGRect(x: 0, y: 0, width: tempImageView.frame.size.width, height: tempImageView.frame.size.height))
            
        }
        else if sender.state == .changed
        {
            let translation = sender.translation(in: sender.view)
            
            switch shapeType {
                case Shape.eclipse.rawValue:
                    context?.addPath((UIBezierPath(ovalIn:CGRect(x:startPoint.x,
                                                                 y: startPoint.y,
                                                                 width: translation.x,
                                                                 height: translation.y))).cgPath)
                    
                    context?.setFillColor(selectedColor.cgColor)
                    context!.fillPath()
                    tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
                    UIGraphicsEndImageContext()
                case Shape.rect.rawValue:
                    context?.addPath((UIBezierPath(rect:CGRect(x:startPoint.x,
                                                                 y: startPoint.y,
                                                                 width: translation.x,
                                                                 height: translation.y))).cgPath)
                    
                    context?.setFillColor(selectedColor.cgColor)
                    context!.fillPath()
                    tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
                    UIGraphicsEndImageContext()
                case Shape.line.rawValue:
                    context?.move(to: startPoint)
                    context?.addLine(to: CGPoint(x:translation.x + startPoint.x, y:translation.y + startPoint.y))
                    context?.setLineWidth(brushWidth)
                    context?.setStrokeColor(selectedColor.cgColor)
                    context?.setBlendMode(CGBlendMode.normal)
                    
                    // 4
                    context!.strokePath()
                    
                    // 5
                    tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
                    tempImageView.alpha = opacity
                    UIGraphicsEndImageContext()
                
                case Shape.freeStyle.rawValue:
                    let currentPoint = CGPoint(x: beforePoint.x + translation.x, y:beforePoint.y + translation.y )
                    drawLineFrom(fromPoint: startPoint, toPoint:currentPoint, color: selectedColor.cgColor,tempImageView: tempImageView,brushWidth: brushWidth)
                    print("\(startPoint):\(currentPoint):\(translation)")
                    startPoint = currentPoint
                
                case Shape.roundRect.rawValue:
                    context?.addPath((UIBezierPath(roundedRect:CGRect(x:startPoint.x,
                                                           y: startPoint.y,
                                                           width: translation.x,
                                                           height: translation.y),cornerRadius:CGFloat(15))).cgPath)
                
                    context?.setFillColor(selectedColor.cgColor)
                    context!.fillPath()
                    tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
                    UIGraphicsEndImageContext()
                
                
                case Shape.eraser.rawValue:
                    let currentPoint = CGPoint(x: beforePoint.x + translation.x, y:beforePoint.y + translation.y )
                    drawLineFrom(fromPoint: startPoint, toPoint:currentPoint, color: UIColor.init(white: 1, alpha: 1).cgColor,tempImageView: tempImageView,brushWidth: brushWidth)
                    context?.setBlendMode(CGBlendMode.clear)
                    print("\(startPoint):\(currentPoint):\(translation)")
                    startPoint = currentPoint
                default :
                    context?.addPath((UIBezierPath(ovalIn:CGRect(x:startPoint.x,
                                                                 y: startPoint.y,
                                                                 width: translation.x,
                                                                 height: translation.y))).cgPath)
                    
                    context?.setFillColor(selectedColor.cgColor)
                    context!.fillPath()
                    tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
                    UIGraphicsEndImageContext()
            }
            
            
        }
        else if sender.state == .ended {
            UIGraphicsBeginImageContext(mainImageView.frame.size)
            mainImageView.image?.draw(in: CGRect(x: 0, y: 0, width: mainImageView.frame.size.width, height: mainImageView.frame.size.height), blendMode: CGBlendMode.normal, alpha: 1.0)
            tempImageView.image?.draw(in: CGRect(x: 0, y: 0, width: tempImageView.frame.size.width, height: tempImageView.frame.size.height), blendMode: CGBlendMode.normal, alpha: opacity)
            mainImageView.image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            tempImageView.image = nil
        }
        
        
        
        
        
        
    }
    
    
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            dismiss(animated: true, completion: nil)
        }
        catch{
            print("Somethings going wrong")
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    

}

