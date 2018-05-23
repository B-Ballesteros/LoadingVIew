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
        let loadingView = LoadingView(frame: frame)
        view.isUserInteractionEnabled = false
        view.addSubview(loadingView)
    }
    
    public func hideLoadingView(){
        guard let loadingView = view.viewWithTag(LoadingView.identifier) else {
            return
        }
        loadingView.removeFromSuperview()
        view.isUserInteractionEnabled = true
    }
    
//    fileprivate func addSpinningWheel(to aView: UIView){
//        let firstRing = createRingLayer(for: aView, radiusFactor: 0.6, speed: 1, clockwise: false)
//        let secondRing = createRingLayer(for: aView, radiusFactor: 0.5, speed: 1, clockwise: true)
//        aView.layer.addSublayer(firstRing)
//        aView.layer.addSublayer(secondRing)
//    }
//
//    fileprivate func createRingLayer(for view: UIView, radiusFactor: CGFloat, speed: Double, clockwise: Bool) ->CAShapeLayer {
//        let width = view.frame.width
//        let height = view.frame.height
//        let squareLength = height > width ? width : height
//        let raidus = (squareLength / 2) * radiusFactor
//        let frame = CGRect(x: (width - squareLength) / 2, y: (height - squareLength) / 2, width: squareLength, height: squareLength)
//        let xCenter = frame.width / 2
//        let yCEnter = frame.height / 2
//        let center = CGPoint(x: xCenter, y: yCEnter)
//        let path = UIBezierPath(arcCenter: center, radius: raidus, startAngle: convertToRadians(angle: 0), endAngle: convertToRadians(angle: 360), clockwise: true)
//        let layer = CAShapeLayer(layer: view.layer)
//        layer.path = path.cgPath
//        layer.frame = frame
//        layer.strokeColor = UIColor.white.cgColor
//        layer.strokeStart = 0.2
//        layer.strokeEnd = 1.5
//        layer.lineWidth = 10
//        layer.lineCap = kCALineCapButt
//        layer.fillColor = UIColor.clear.cgColor
//        let startAngle: CGFloat = clockwise ? 0 : 360
//        let endAngle: CGFloat = clockwise ? 360 : 0
//        animate(layer: layer, keyPath: "transform.rotation", duration: speed, from: convertToRadians(angle: startAngle), to: convertToRadians(angle: endAngle), autoreverse: false)
//        animate(layer: layer, keyPath: "strokeColor", duration: speed / 2, from: UIColor.white.cgColor, to: UIColor.gray.cgColor, autoreverse: true)
//        return layer
//    }
//
//    fileprivate func convertToRadians(angle: CGFloat) -> CGFloat{
//        return (.pi * angle) / 180
//    }
//
//
//    fileprivate func animate(layer: CALayer, keyPath: String, duration: Double, from value: Any, to endValue: Any, autoreverse: Bool){
//        let animation = CABasicAnimation(keyPath: keyPath)
//        animation.fromValue = value
//        animation.toValue = endValue
//        animation.duration = duration
//        animation.repeatCount = .infinity
//        animation.autoreverses = autoreverse
//        layer.add(animation, forKey: nil)
//    }
}
