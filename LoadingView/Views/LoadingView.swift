//
//  LoadingView.swift
//  LoadingView
//
//  Created by Joel Bejamin Ballesteros Martinez on 5/23/18.
//  Copyright © 2018 Benjamin. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    static let identifier = 5623444 //5623444 translates to 'loading' in numeric pad
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        frame = UIScreen.main.bounds
        let newFrame = createLayerFrame(from: frame)
        layer.sublayers?.forEach({ (layer) in
            if let layer = layer as? CAShapeLayer {
                layer.frame = newFrame
            }
        })
    }
    
    fileprivate func configure() {
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
        tag = LoadingView.identifier
        let outerRing = createRingLayer(using: frame, radiusFactor: 0.6, speed: 1, clockwise: false)
        let innerRing = createRingLayer(using: frame, radiusFactor: 0.5, speed: 1, clockwise: true)
        layer.addSublayer(outerRing)
        layer.addSublayer(innerRing)
    }
    
    fileprivate func createRingLayer(using frame: CGRect, radiusFactor: CGFloat, speed: Double, clockwise: Bool) ->CAShapeLayer {
        let layerFrame = createLayerFrame(from: frame)
        let path = createLayerPath(with: radiusFactor, for: layerFrame)
        let startAngle: CGFloat = clockwise ? 0 : .pi * 2
        let endAngle: CGFloat = clockwise ? .pi * 2 : 0
        let layer = CAShapeLayer()
        
        layer.path = path.cgPath
        layer.frame = layerFrame
        layer.strokeColor = UIColor.white.cgColor
        layer.strokeStart = 0.2
        layer.strokeEnd = 1.5
        layer.lineWidth = 10
        layer.lineCap = kCALineCapButt
        layer.fillColor = UIColor.clear.cgColor
        
        animate(layer: layer, keyPath: "transform.rotation", duration: speed, from: startAngle, to: endAngle, autoreverse: false)
        animate(layer: layer, keyPath: "strokeColor", duration: speed / 2, from: UIColor.white.cgColor, to: UIColor.gray.cgColor, autoreverse: true)
        return layer
    }
    
    fileprivate func createLayerPath(with radiusFactor: CGFloat, for layerFrame: CGRect) ->UIBezierPath {
        let raidus = (layerFrame.width / 2) * radiusFactor
        let xCenter = layerFrame.width / 2
        let yCEnter = layerFrame.height / 2
        let center = CGPoint(x: xCenter, y: yCEnter)
        let path = UIBezierPath(arcCenter: center, radius: raidus, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        return path
    }
    
    fileprivate func createLayerFrame(from fram: CGRect) -> CGRect {
        let width = frame.width
        let height = frame.height
        let squareLength = height > width ? width : height
        let layerFrame = CGRect(x: (width - squareLength) / 2, y: (height - squareLength) / 2, width: squareLength, height: squareLength)
        return layerFrame
    }
    
    fileprivate func animate(layer: CALayer, keyPath: String, duration: Double, from value: Any, to endValue: Any, autoreverse: Bool){
        let animation = CABasicAnimation(keyPath: keyPath)
        animation.fromValue = value
        animation.toValue = endValue
        animation.duration = duration
        animation.repeatCount = .infinity
        animation.autoreverses = autoreverse
        layer.add(animation, forKey: nil)
    }

}
