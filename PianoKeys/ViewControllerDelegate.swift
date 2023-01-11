//
//  ViewControllerDelegate.swift
//  PianoKeys
//
//  Created by Елисей Коновалов on 24.12.22..
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func didButtonPresed(vc: MainViewController, buttonName: String)
    func didButtonReleased(vc: MainViewController, buttonName: String)
}

class LoggingViewControllerDelegate: ViewControllerDelegate {

    func didButtonReleased(vc: MainViewController, buttonName: String) {
        print("Button released: " + "\(buttonName)")
    }
    
    func didButtonPresed(vc: MainViewController, buttonName: String) {
        print("Button pressed: " + "\(buttonName)")
    }
}
