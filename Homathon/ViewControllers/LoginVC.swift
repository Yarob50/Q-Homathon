//
//  LoginVC.swift
//  GoParking
//
//  Created by Hadi Albinsaad on 08/02/2019.
//  Copyright © 2019 SAP. All rights reserved.
//

import UIKit
//import SAPFiori
import Spring
import NVActivityIndicatorView

class LoginVC: UIViewController
{
    
    
    @IBOutlet weak var masoolImage: SpringImageView!
    @IBOutlet weak var signInLabel: SpringLabel!
    @IBOutlet weak var descriptionLabel: SpringLabel!
    @IBOutlet weak var logoImageView: SpringImageView!
    @IBOutlet weak var usernameView: CustomView!
    @IBOutlet weak var passwordView: CustomView!
    @IBOutlet weak var signInButton: SpringButton!
    @IBOutlet weak var loader: NVActivityIndicatorView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var isAnimated = false
    
//    var loadingIndicator: FUILoadingIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setHiddenElements()
        navigationController?.navigationBar.isHidden = true
//        loadingIndicator = FUILoadingIndicatorView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //if !isAnimated{
            isAnimated = true
            animateElements()
        //}
        
    }
    
    
    func setHiddenElements(){
//        signInLabel.isHidden = true
//        descriptionLabel.isHidden = true
//        logoImageView.isHidden = true
//        usernameView.isHidden = true
//        passwordView.isHidden = true
//        signInButton.isHidden = true
        signInLabel.alpha = 0
        descriptionLabel.alpha = 0
        logoImageView.alpha = 0
        usernameView.alpha = 0
        passwordView.alpha = 0
        signInButton.alpha = 0
        masoolImage.alpha = 0
    }
    
    func showElements(){
        signInLabel.isHidden = false
        descriptionLabel.isHidden = false
        logoImageView.isHidden = false
        usernameView.isHidden = false
        passwordView.isHidden = false
        signInButton.isHidden = false
    }
    
    func animateElements()
    {
        let duration:CGFloat = 1
        
        //logo view
        logoImageView.animation = "fadeInDown"
        logoImageView.curve = "easeIn"
        logoImageView.duration = duration
        logoImageView.animate()
        
        
        //username view
        usernameView.animation = "fadeInLeft"
        usernameView.curve = "easeIn"
        usernameView.duration = duration
        usernameView.delay = 0.5
        usernameView.animate()
        
        
        //password view
       passwordView.animation = "fadeInLeft"
        passwordView.curve = "easeIn"
        passwordView.duration = duration
        passwordView.delay = 1
        passwordView.animate()
        
        //sign in button
        signInButton.animation = "fadeInUp"
        signInButton.curve = "easeIn"
        signInButton.duration = duration
        signInButton.delay = 1.5
        signInButton.animate()
        
        
        //signIn Label
        signInLabel.animation = "fadeIn"
        signInLabel.curve = "easeIn"
        signInLabel.duration = 0.7
        signInLabel.delay = 2.0
        signInLabel.animate()
        
        
        //description Label
        descriptionLabel.animation = "fadeIn"
        descriptionLabel.curve = "easeIn"
        descriptionLabel.duration = 0.7
        descriptionLabel.delay = 2.3
        descriptionLabel.animate()
        
        //masool image
        masoolImage.animation = "fadeInDown"
        masoolImage.curve = "easeInOut"
        masoolImage.duration = 0.7
        masoolImage.delay = 2.8
        masoolImage.animate()
    }
    
    func animateOut(completion:@escaping ()->()){
        var duartion:CGFloat = 0.5
        
        //username view
        UIView.animate(withDuration: 0.1, delay: 0, options: [], animations: {
            self.usernameView.transform = CGAffineTransform(outside: self.view.bounds, from: .left)
        }, completion: nil)
        
        //password view
        UIView.animate(withDuration: 0.1, delay: 0.3, options: [], animations: {
            self.passwordView.transform = CGAffineTransform(outside: self.view.bounds, from: .left)
        }, completion: nil)
        
        //signIn Label
        signInLabel.animation = "fadeOut"
        signInLabel.curve = "easeIn"
        signInLabel.duration = duartion
        signInLabel.delay = 0.8
        signInLabel.animate()
        
        
        //description Label
        descriptionLabel.animation = "fadeOut"
        descriptionLabel.curve = "easeIn"
        descriptionLabel.duration = duartion
        descriptionLabel.delay = 1
        descriptionLabel.animate()
        
        //button view
        signInButton.animation = "zoomOut"
        signInButton.curve = "easeIn"
        signInButton.duration = duartion
        signInButton.delay = 1.2
        signInButton.animateNext {
            completion()
        }
        
//        logoImageView.animation = "zoomOut"
//        logoImageView.curve = "easeIn"
//        logoImageView.duration = duartion
//        logoImageView.delay = 1.6
//        logoImageView.animateNext {
//            completion()
//        }

        
        
//        usernameView.transform = CGAffineTransform(outside: view.bounds, from: .left)
//        usernameView.animation = "squeezeLeft"
//        usernameView.curve = "easeIn"
//        usernameView.duration = duartion
//        usernameView.delay = 0
//        usernameView.animateNext {
//            completion()
//        }
        
        
    }
 
    @IBAction func loginBtnTapped(_ sender: UIButton) {
        let id = usernameTextField.text
        let password = passwordTextField.text
        
        guard id != "", password != "" else {
            AlertManager.showErrorAlert(message: "الرجاء تعبئة البيانات")
            return
        }
        
        loader.startAnimating()
        NetworkManager.login(id: id!, password: password!) { (message, success) in
            self.loader.stopAnimating()
            if success{
                self.animateOut {
                     let vc = Constants.Storyboard.Main.instantiateViewController(withIdentifier: "MainTabBar")
                    self.present(vc, animated: true, completion: nil)
                
                }
            }else{
                AlertManager.showErrorAlert(message: "البيانات المدخلة غير مطابقة لأي من المستخدمين")
            }
            
        }
//        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
//
//
//        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

