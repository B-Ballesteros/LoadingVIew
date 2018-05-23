//
//  ViewController.swift
//  LoadingView
//
//  Created by Joel Bejamin Ballesteros Martinez on 5/22/18.
//  Copyright © 2018 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func testTapped(_ sender: Any) {
        showLoadingView(with: .random)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) {
            self.hideLoadingView()
        }
    }
    
}
extension CGFloat {
    static var random: CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random, green: .random, blue: .random, alpha: 1.0)
    }
}

