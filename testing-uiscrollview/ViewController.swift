//
//  ViewController.swift
//  testing-uiscrollview
//
//  Created by Seb Insua on 07/10/2014.
//  Copyright (c) 2014 Momentum. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView:UIScrollView?
    @IBOutlet weak var topView:UIView?
    
    @IBOutlet weak var heightOfTopViewConstraint:NSLayoutConstraint?
    @IBOutlet weak var verticalOffsetConstraint:NSLayoutConstraint?
    
    var originalHeight:CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView?.delegate = self
        
        originalHeight = CGRectGetHeight(topView!.frame)

        let leftConstraint = NSLayoutConstraint(item: self.topView!, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Leading, multiplier: 1.0, constant: 0)
        let rightConstraint = NSLayoutConstraint(item: self.topView!, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0)
        
        self.view.addConstraint(leftConstraint)
        self.view.addConstraint(rightConstraint)
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        let originalHeight = self.originalHeight!
        let contentOffsetY = scrollView.contentOffset.y
        
        let hasScrolledDown = contentOffsetY < 0
        if hasScrolledDown {
            heightOfTopViewConstraint?.constant = originalHeight + abs(contentOffsetY) // Increase the height...
            verticalOffsetConstraint?.constant = contentOffsetY
        } else {
            heightOfTopViewConstraint?.constant = originalHeight - contentOffsetY // Decrease the height...
            verticalOffsetConstraint?.constant = contentOffsetY
        }
    }
    
    
}

