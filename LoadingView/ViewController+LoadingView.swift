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
}
