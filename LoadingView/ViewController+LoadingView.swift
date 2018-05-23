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
        let color = UIColor.gray.withAlphaComponent(0.33)
        let loadingView = UIView(frame: frame)
        loadingView.backgroundColor = color
        loadingView.tag = 5623444 //5623444 translates to 'loading' in numeric pad
        loadingView.isUserInteractionEnabled = false
        view.addSubview(loadingView)
    }
    
    public func hideLoadingView(){
        let tag = 5623444
        guard let loadingView = view.viewWithTag(tag) else {
            return
        }
        loadingView.removeFromSuperview()
    }
}
