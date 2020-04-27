//
//  BaseVC.swift
//  Homathon
//
//  Created by يعرب المصطفى on 4/22/20.
//  Copyright © 2020 yarob. All rights reserved.
//

import UIKit
import Spring

class BaseVC: UIViewController {

    @IBOutlet weak var titleLabel: SpringLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setHiddenElements()
        animateIn()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateIn()
    }
    

    func setHiddenElements(){
        titleLabel.isHidden = true
    }
    
    func showElements(){
        titleLabel.isHidden = false
    }
    
    func animateIn()
    {
        showElements()
        let duration:CGFloat = 1.5
        titleLabel.animation = "fadeInLeft"
        titleLabel.curve = "easeInOut"
        titleLabel.duration = duration
        titleLabel.animate()
        
        //logo view
//        logoImageView.animation = "fadeInDown"
//        logoImageView.curve = "easeIn"
//        logoImageView.duration = duration
//        logoImageView.animate()
//
//
//        //username view
//        usernameView.animation = "fadeInRight"
//        usernameView.curve = "easeIn"
//        usernameView.duration = duration
//        usernameView.delay = 0.5
//        usernameView.animate()
//
//
//
//        //sign in button
//        signInButton.animation = "fadeInRight"
//        signInButton.curve = "easeIn"
//        signInButton.duration = duration
//        signInButton.delay = 1.5
//        signInButton.animate()
//
//
//        //signIn Label
//        signInLabel.animation = "fadeIn"
//        signInLabel.curve = "easeIn"
//        signInLabel.duration = 0.7
//        signInLabel.delay = 1.8
//        signInLabel.animate()
        
        
        //description Label
//        descriptionLabel.animation = "fadeIn"
//        descriptionLabel.curve = "easeIn"
//        descriptionLabel.duration = 0.7
//        descriptionLabel.delay = 2.3
//        descriptionLabel.animate()
    }

}
