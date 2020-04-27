//
//  AppointmentsVC.swift
//  Homathon
//
//  Created by يعرب المصطفى on 4/22/20.
//  Copyright © 2020 yarob. All rights reserved.
//

import UIKit
import ViewAnimator

class AppointmentsVC: BaseVC {

    private var stores = [Store]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStores()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupStores()
        if DataStore.appointments.count > 0{
            self.tableView.isHidden = true
            animateTableViewIn()
        }
        
    }
    
    private func setupStores(){
       self.tableView.reloadData()
   }
    
     private func animateTableViewIn(){
        DispatchQueue.main.asyncAfter(deadline: .now()+0.6) {
                self.tableView.isHidden = false
                let cells = self.tableView.visibleCells
    //            let animation = AnimationType.zoom(scale: 0.5)
    //            let animation = AnimationType.from(direction: .top, offset: 30.0)
                let fromAnimation = AnimationType.from(direction: .right, offset: 30.0)
                let zoomAnimation = AnimationType.zoom(scale: 0.2)
                let rotateAnimation = AnimationType.rotate(angle: CGFloat.pi/6)
    //            UIView.animate(views: cells, animations: [fromAnimation, zoomAnimation, rotateAnimation])
                UIView.animate(views: cells, animations: [fromAnimation], reversed: false, initialAlpha: 0.0, finalAlpha: 1.0, delay: 0, animationInterval: 0.1, duration: 1, usingSpringWithDamping: ViewAnimatorConfig.springDampingRatio, initialSpringVelocity: ViewAnimatorConfig.initialSpringVelocity, options: [], completion: nil)
            }
        }

}



extension AppointmentsVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if DataStore.appointments.count == 0
        {
            tableView.showEmpty(image: UIImage(named: "masool")?.withRenderingMode(.alwaysTemplate),
                                imageTintColor: UIColor(hex: "D96C00"),
                                message: "ليس لديك مواعيد حاليا، قم بحجز موعد جديد من قائمة المتاجر",
                                color: UIColor(hex: "D96C00"),
                                font: Constants.Font.defaultFont(size: 18),
                                stackOffset: CGSize(width: 0, height: -120))
        }
        else {
            tableView.removeEmpty()
        }
        return DataStore.appointments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppointmentCell") as! AppointmentCell
        let app = DataStore.appointments[indexPath.row]
        let store = app.store
        cell.configure(store: store!)
        cell.configureDateAndTime(app: app)
        cell.delegate = self
        
        if app.isCompleted {
            cell.deleteBtn.setTitle("منتهي", for: .normal)
            cell.deleteBtn.backgroundColor = .gray
            cell.deleteBtn.layer.shadowColor = UIColor.gray.cgColor
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}



extension AppointmentsVC: appointmentCellProtocol{
    
    func deleteBtnTapped(cell: AppointmentCell) {
//        let store = cell.store
//        let newBtnColor = UIColor(hex: "26A69A")
//        cell.deleteBtn.backgroundColor = newBtnColor
//        cell.deleteBtn.layer.shadowColor = newBtnColor.cgColor
//        cell.deleteBtn.setTitle("ملغي", for: .normal)
//        let added = DataStore.addAppointmentForStore(store: store!)
//        showDialog(added: added)
    }
    
    
    private func showDialog(added: Bool){
        let alert = AlertManager.getAlert()
        let title =  "تم الحذف"
        let subTitle = "تم حذف موعدك"
        if added {
          alert.showSuccess(title, subTitle: subTitle)
        }
        
    }
    
    
    
}
