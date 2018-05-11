//
//  DrawLine.swift
//  Assignment1
//
//  Created by Jonathan on 31/03/18.
//  Copyright © 2018 Jonathan. All rights reserved.
//

import UIKit

func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint, color: CGColor, tempImageView: UIImageView,brushWidth: CGFloat) {
    
    // 1
    UIGraphicsBeginImageContext(tempImageView.frame.size)
    let context = UIGraphicsGetCurrentContext()
    tempImageView.image?.draw(in: CGRect(x: 0, y: 0, width: tempImageView.frame.size.width, height: tempImageView.frame.size.height))
    
    // 2
    context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
    context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
    
    // 3
    context?.setLineCap(CGLineCap.round)
    context?.setLineWidth(brushWidth)
    context?.setStrokeColor(color)
    context?.setBlendMode(CGBlendMode.normal)
    
    // 4
    context!.strokePath()
    
    // 5
    tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
    
    UIGraphicsEndImageContext()
    
}
