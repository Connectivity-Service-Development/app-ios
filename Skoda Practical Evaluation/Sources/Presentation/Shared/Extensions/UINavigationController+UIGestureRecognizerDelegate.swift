//
//  UINavigationController.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 24.10.2024.
//

import UIKit


extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
