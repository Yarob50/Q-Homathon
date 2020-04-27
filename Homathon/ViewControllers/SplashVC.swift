//
//  SplashVC.swift
//  GoParkingPlease
//
//  Created by يعرب المصطفى on 2/9/19.
//  Copyright © 2019 SAP. All rights reserved.
//

import UIKit
import RevealingSplashView

class SplashVC: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Initialize a revealing Splash with with the iconImage, the initial size and the background color
        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "qlogo")!,iconInitialSize: CGSize(width: 170, height: 170), backgroundColor: UIColor.clear)
        
        //Adds the revealing splash view as a sub view
        self.view.addSubview(revealingSplashView)
        
        //Starts animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            revealingSplashView.startAnimation(){
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
                self.present(loginViewController, animated: true, completion: {
                    
                })
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
