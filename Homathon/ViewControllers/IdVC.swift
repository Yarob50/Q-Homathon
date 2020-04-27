//
//  IdVC.swift
//  Homathon
//
//  Created by يعرب المصطفى on 4/22/20.
//  Copyright © 2020 yarob. All rights reserved.
//

import UIKit
import Spring
import CountdownLabel

class IdVC: BaseVC {

    @IBOutlet weak var infoContainerView: CustomView!
    @IBOutlet weak var statusContainerView: CustomView!
    @IBOutlet weak var timerContainer: CustomView!
    @IBOutlet weak var mapContainerView: CustomView!
    @IBOutlet weak var timerLabel: CountdownLabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var nextAppStoreNameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusDetailsLabel: UILabel!
    @IBOutlet weak var nextAppTitleLabel: UILabel!
    
    private var currentTimerFor = "appToStart"
    private var nextAppointment: Appointment?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.countdownDelegate = self
        setHiddenElements()
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fillData()
    }
    
    
    override func setHiddenElements(){
        super.setHiddenElements()
        infoContainerView.alpha = 0
        statusContainerView.alpha = 0
        mapContainerView.alpha = 0
    }
    
    override func showElements(){
        super.showElements()
        infoContainerView.isHidden = false
        statusContainerView.isHidden = false
        mapContainerView.isHidden = false
    }
    
    private func fillData(){
        nextAppointment = DataStore.getNextAppointment()
        if nextAppointment == nil {
            timerLabel.text = ""
            dateTimeLabel.text = ""
            nextAppStoreNameLabel.text = "لا يوجد لديك مواعيد محجوزة"
        }
        else{
            dateTimeLabel.text = nextAppointment!.getDateTime()
            nextAppStoreNameLabel.text = nextAppointment!.store!.name
            let interval = DataStore.getMinutesUntilAppointment(appoint: nextAppointment!)
            startTimer(until: interval)
        }
        
    }
    
    private func startTimer(until interval: TimeInterval){
        timerLabel.timeFormat = "hh : mm : ss"
        timerLabel.setCountDownTime(minutes: interval)
        timerLabel.animationType = .Evaporate
        timerLabel.start()
    }
    
    private func changeStatusTo(success: Bool){
        statusContainerView.animation = "fadeOut"
        statusContainerView.curve = "easeInOut"
        statusContainerView.animateNext {
            let color = success ? UIColor(hex: "31A343") : UIColor(hex: "A20003")
            let status = success ? "مصرح" : "غير مصرح"
            let detailedStatus = success ? "بدأ موعدك الآن، قم بالتوجه لمنزلك بمجرد انتهاء موعدك" : "لا يوجد لديك موعد حاليا، يمنع تواجدك خارج المنزل"
            self.statusContainerView.backgroundColor = color
            self.statusLabel.text = status
            self.statusDetailsLabel.text = detailedStatus
            self.statusContainerView.animation = "fadeInLeft"
            self.statusContainerView.animate()
            self.statusContainerView.animation = "fadeInUp"
        }
        
        
    }
    
    override func animateIn()
    {
        super.animateIn()
        let duration:CGFloat = 1.0
        var delay:CGFloat = 0.6
        
        // info animation
        infoContainerView.animation = "fadeInUp"
        infoContainerView.curve = "easeInOut"
        infoContainerView.duration = duration
        infoContainerView.delay = delay
        infoContainerView.animate()
        
        // status animation
        delay = delay + 0.3
        statusContainerView.animation = "fadeInUp"
        statusContainerView.curve = "easeInOut"
        statusContainerView.duration = duration
        statusContainerView.delay = delay
        statusContainerView.animate()
        
        
        // timer animation
        delay = delay + 0.3
        timerContainer.velocity = 1.0
        timerContainer.animation = "fadeInUp"
        timerContainer.curve = "easeInOut"
        timerContainer.duration = duration
        timerContainer.delay = delay
        timerContainer.animate()
        
        // map animation
        delay = delay + 0.3
        mapContainerView.velocity = 1.0
        mapContainerView.animation = "fadeInUp"
        mapContainerView.curve = "easeInOut"
        mapContainerView.duration = duration
        mapContainerView.delay = delay
        mapContainerView.animate()
    }

}

extension IdVC: CountdownLabelDelegate{
    func countingAt(timeCounted: TimeInterval, timeRemaining: TimeInterval) {
    
    }
    
    func countdownFinished() {
        timerLabel.pause()
//        timerLabel.text = ""
        if currentTimerFor == "appToStart"{
            changeStatusTo(success: true)
            timerLabel.addTime(time: 15)
            DispatchQueue.main.async {
                self.nextAppTitleLabel.text = "موعدك ينتهي خلال"
                self.timerLabel.start()
            }
            currentTimerFor = "appToFinish"
        }else{ // appointment is done
            changeStatusTo(success: false)
            timerLabel.text = ""
            nextAppTitleLabel.text = "لا يوجد لديك مواعيد قادمة"
            nextAppStoreNameLabel.text = "يمكنك إضافة موعد جديد من قائمة المتاجر"
            dateTimeLabel.text = ""
            nextAppointment?.isCompleted = true
        }
        
    }
}
        
        
    
    
//    func countingAt(timeCounted timeCounted: NSTimeInterval, timeRemaining: NSTimeInterval) {
//        switch timeRemaining {
//        case 10:
//            self.countdownLabel6.animationType = .Pixelate
//            self.countdownLabel6.textColor = .greenColor()
//        case 5:
//            self.countdownLabel6.animationType = .Sparkle
//            self.countdownLabel6.textColor = .yellowColor()
//        default:
//            break
//        }
//    }
//    func countdownFinished() {
//        self.countdownLabel.textColor = .whiteColor()
//    }
//}
