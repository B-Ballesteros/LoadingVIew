//
//  ViewController+LoadingView.swift
//  LoadingView
//
//  Created by Joel Bejamin Ballesteros Martinez on 5/22/18.
//  Copyright © 2018 Benjamin. All rights reserved.
//

import UIKit

extension UIViewController {
    public func showLoadingView(){
        let frame = UIScreen.main.bounds
        let color = UIColor.black.withAlphaComponent(0.5)
        let loadingView = UIView(frame: frame)
        loadingView.backgroundColor = color
        loadingView.tag = 5623444 //5623444 translates to 'loading' in numeric pad
        view.isUserInteractionEnabled = false
        addSpinningWheel(to: loadingView)
        view.addSubview(loadingView)
    }
    
    public func hideLoadingView(){
        let tag = 5623444
        guard let loadingView = view.viewWithTag(tag) else {
            return
        }
        loadingView.removeFromSuperview()
        view.isUserInteractionEnabled = true
    }
    
    fileprivate func addSpinningWheel(to aView: UIView){
        let width = aView.frame.width
        let height = aView.frame.height
        let squareLength = height > width ? width : height
        let raidus = (squareLength / 2) * 0.8
        let frame = CGRect(x: (width - squareLength) / 2, y: (height - squareLength) / 2, width: squareLength, height: squareLength)
        let xCenter = frame.width / 2
        let yCEnter = frame.height / 2
        let center = CGPoint(x: xCenter, y: yCEnter)
        let path = UIBezierPath(arcCenter: center, radius: raidus, startAngle: convertToRadians(angle: 0), endAngle: convertToRadians(angle: 360), clockwise: true)
        let layer = CAShapeLayer(layer: aView.layer)
        layer.path = path.cgPath
        layer.frame = frame
        layer.strokeColor = UIColor.white.cgColor
        layer.strokeStart = 0.2
        layer.strokeEnd = 1
        layer.lineWidth = 15
        layer.lineCap = kCALineCapRound
        layer.fillColor = UIColor.clear.cgColor
        aView.layer.addSublayer(layer)
        animate(layer: layer, keyPath: "transform.rotation", duration: 1, from: convertToRadians(angle: 0), to: convertToRadians(angle: 360))
    }
    
    fileprivate func convertToRadians(angle: CGFloat) -> CGFloat{
        return (.pi * angle) / 180
    }
    
    
    fileprivate func animate(layer: CALayer, keyPath: String, duration: Double, from value: CGFloat, to endValue: CGFloat){
        let animation = CABasicAnimation(keyPath: keyPath)
        animation.fromValue = value
        animation.toValue = endValue
        animation.duration = duration
        animation.repeatCount = .infinity
        layer.add(animation, forKey: nil)
    }
}
