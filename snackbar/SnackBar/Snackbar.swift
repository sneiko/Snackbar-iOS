//
//  Snackbar.swift
//  snackbar
//
//  Created by Сергей on 30.11.16.
//  Copyright © 2016 Fish in Sky. All rights reserved.
//

import UIKit

enum SBAnimationLength {
    case shot
    case long
}

class Snackbar: NSObject {
    
    var snackbarHeight: CGFloat = 65
    var backgroundColor: UIColor = .darkGray
    var textColor: UIColor = .white
    var buttonColor:UIColor = .cyan
    
    
    let snackbarView: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    private let window: UIWindow = {
        let window = UIApplication.shared.keyWindow
        return window!
    }()
    
    override init(){
        super.init()
    }
    
    
    /// Show simple text notification
    func showText(_ text: String, sbLength: SBAnimationLength) {
        
        let txt: UILabel = UILabel()
        
        window.addSubview(snackbarView)
        
        // snackbar settings
        snackbarView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: snackbarHeight)
        snackbarView.backgroundColor = self.backgroundColor
        
        //textView settings
        snackbarView.addSubview(txt)
        txt.text = text
        txt.textColor = textColor
//        txt.backgroundColor = .green
        
        txt.frame = CGRect(x: window.frame.width * 1/15, y: 0, width: window.frame.width * 13/15, height: snackbarHeight)
        
        
        
        switch sbLength {
        case .shot:
            animateBar(2)
            
        case .long:
            animateBar(3)
            
        }
    }
    
    private func animateBar(_ timerLength: Float){
        
        UIView.animate(withDuration: 0.4, animations: {
            self.snackbarView.frame = CGRect(x: 0, y: self.window.frame.height - self.snackbarHeight, width: self.window.frame.width, height: self.snackbarHeight)
            
            Timer.scheduledTimer(timeInterval: TimeInterval(timerLength), target: self, selector: #selector(self.hide), userInfo: nil, repeats: false)
        })
    }
    
    @objc private func hide(){
        UIView.animate(withDuration: 0.4, animations: {
            self.snackbarView.frame = CGRect(x: 0, y: self.window.frame.height, width: self.window.frame.width, height: self.snackbarHeight)
         })
    }
    
    
}
