//
//  NewAppointmentVC.swift
//  Homathon
//
//  Created by يعرب المصطفى on 4/23/20.
//  Copyright © 2020 yarob. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class NewAppointmentVC: BaseVC {
    
    // containers views
    @IBOutlet weak var infoContainerView: CustomView!
    @IBOutlet weak var dateContainerView: CustomView!
    @IBOutlet weak var timeContainerView: CustomView!
    @IBOutlet weak var loader: NVActivityIndicatorView!
    
    // store info
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var capacityLabel: UILabel!
    @IBOutlet weak var timesLabel: UILabel!
    @IBOutlet weak var storeImage: CustomizableImageView!
    
    // store
    var store: Store!
    var dateObject: Date?
    var timeObject: Date?
    
    // date time picker
    var datePicker: UIDatePicker!
    @IBOutlet weak var datePickerTextfield: UITextField!
    @IBOutlet weak var timePickerTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPickers()
        setUI()
        setHiddenElements()
    }
    
    private func setUI(){
        nameLabel.text = store.name
        storeImage.image = store.image
        distanceLabel.text = store.distance
        capacityLabel.text = store.capacity
        timesLabel.text = store.times
    }
    
    private func setPickers(){
        datePickerTextfield.setInputViewDatePicker(target: self, selector: #selector(dateDoneTapped))
        timePickerTextfield.setInputViewDatePicker(target: self, selector: #selector(timeDoneTapped), type: "time")
    }
    
    @objc func dateDoneTapped() {
        if let datePicker = self.datePickerTextfield.inputView as? UIDatePicker {
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "MM-d"
            self.datePickerTextfield.text = dateformatter.string(from: datePicker.date)
            self.dateObject = datePicker.date
        }
        self.datePickerTextfield.resignFirstResponder()
    }
    
    @objc func timeDoneTapped() {
        if let datePicker = self.timePickerTextfield.inputView as? UIDatePicker {
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "hh:mm"
            self.timePickerTextfield.text = dateformatter.string(from: datePicker.date)
            self.timeObject = datePicker.date
        }
        self.timePickerTextfield.resignFirstResponder()
    }
    
    override func setHiddenElements(){
        super.setHiddenElements()
        infoContainerView.alpha = 0
        dateContainerView.alpha = 0
        timeContainerView.alpha = 0
    }
    
    override func showElements(){
        super.showElements()
        infoContainerView.isHidden = false
        dateContainerView.isHidden = false
        timeContainerView.isHidden = false
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
        dateContainerView.animation = "fadeInUp"
        dateContainerView.curve = "easeInOut"
        dateContainerView.duration = duration
        dateContainerView.delay = delay
        dateContainerView.animate()
        
        
        // map animation
        delay = delay + 0.3
        timeContainerView.velocity = 1.0
        timeContainerView.animation = "fadeInUp"
        timeContainerView.curve = "easeInOut"
        timeContainerView.duration = duration
        timeContainerView.delay = delay
        timeContainerView.animate()
    }
    
    private func showDialog(added: Bool){
        let alert = AlertManager.getAlert {
            self.dismiss(animated: true, completion: nil)
        }
        let title = added ? "تم الحجز" : "خطأ"
        let subTitle = added ? "تم إضافة الحجز لقائمة مواعيدك، كن على استعداد" : "يوجد لديك حجز في نفس الفرع مسبقا"
        if added {
          alert.showSuccess(title, subTitle: subTitle)
        }else{
            alert.showError(title, subTitle: subTitle)
        }
    }
    
    
    @IBAction func closeBtnTappped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func completeBookingTapped(_ sender: UIButton) {
        let date = datePickerTextfield.text
        let time = timePickerTextfield.text
        
        // check the date
        guard date != "" else {
            AlertManager.showErrorAlert(message: "الرجاء تحديد التاريخ")
            return
        }
        
        // check the time
        guard time != "" else {
            AlertManager.showErrorAlert(message: "الرجاء تحديد الوقت")
            return
        }
        
        sender.setTitle("", for: .normal)
        sender.imageView?.isHidden = true
        sender.setImage(nil, for: .normal)
        loader.startAnimating()
        DataStore.addAppointmentForStore(store: store, date: date!, time: time!, dateObject: dateObject!, timeObject: timeObject!)
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
           self.loader.stopAnimating()
           self.showDialog(added: true)
        }
    }
    
}
