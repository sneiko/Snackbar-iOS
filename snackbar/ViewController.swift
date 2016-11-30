//
//  ViewController.swift
//  snackbar
//
//  Created by Сергей on 30.11.16.
//  Copyright © 2016 Fish in Sky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonPush(_ sender: Any) {
        let sb = Snackbar()
        sb.showText("Покажись!!! Тарататата стреляю с калакаша!!!", sbLength: .shot)
    }
}

