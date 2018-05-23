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
        showLoadingView(with: .blue)
    }
    
    public func showLoadingView(with color: UIColor) {
        let frame = UIScreen.main.bounds
        let loadingView = LoadingView(frame: frame, color: color)
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
}
