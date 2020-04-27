//
//  StoresVC.swift
//  Homathon
//
//  Created by يعرب المصطفى on 4/21/20.
//  Copyright © 2020 yarob. All rights reserved.
//

import UIKit
import Spring
import Presentr
import PopupDialog
import PMAlertController
import CleanyModal
import SCLAlertView
import ViewAnimator

class StoresVC: BaseVC {

    @IBOutlet weak var searchContainerView: CustomView!
    private var stores = [Store]()
    
    @IBOutlet weak var tableView: UITableView!
    
    
//    let presenter: Presentr = {
//        let width = ModalSize.half
//        let height = ModalSize.half
//        let center = ModalCenterPosition.customOrigin(origin: CGPoint(x: 0, y: 0))
//        let customType = PresentationType.custom(width: width, height: height, center: center)
//
//        let customPresenter = Presentr(presentationType: customType)
//        customPresenter.transitionType = .coverVerticalFromTop
//        customPresenter.dismissTransitionType = .crossDissolve
//        customPresenter.roundCorners = true
//        customPresenter.backgroundColor = .green
//        customPresenter.backgroundOpacity = 0.5
//        customPresenter.dismissOnSwipe = true
//        customPresenter.dismissOnSwipeDirection = .top
//        return customPresenter
//    }()
    
    let presenter: Presentr = {
        let presenter = Presentr(presentationType: .alert)
        presenter.transitionType = TransitionType.coverHorizontalFromRight
        presenter.dismissOnSwipe = true
        return presenter
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHiddenElements()
        setupStores()
        NotificationCenter.default.addObserver(self, selector: #selector(updateData), name:NSNotification.Name(rawValue: "appointmentAdded"), object: nil)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTableViewIn()
    }
    
    @objc func updateData(){
        self.tableView.reloadData()
    }
    
    
    
    
    
    
    private func setupStores(){
        stores = DataStore.stores
        self.tableView.reloadData()
    }
    
    
    override func setHiddenElements(){
        super.setHiddenElements()
        titleLabel.isHidden = true
        searchContainerView.isHidden = true
    }
    
    override func showElements(){
        super.showElements()
        titleLabel.isHidden = false
        searchContainerView.isHidden = false
    }
    
    override func animateIn()
    {
        super.animateIn()
        let duration:CGFloat = 1.0
        let delay:CGFloat = 0.6
        searchContainerView.velocity = 1.0
        searchContainerView.animation = "fadeInDown"
        searchContainerView.curve = "easeInOut"
        searchContainerView.duration = duration
        searchContainerView.delay = delay
        searchContainerView.animate()
        
        self.tableView.isHidden = true
        
    }
    
    
    private func animateTableViewIn(){
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.tableView.isHidden = false
            let cells = self.tableView.visibleCells
//            let animation = AnimationType.zoom(scale: 0.5)
//            let animation = AnimationType.from(direction: .top, offset: 30.0)
            let fromAnimation = AnimationType.from(direction: .top, offset: 30.0)
            let zoomAnimation = AnimationType.zoom(scale: 0.2)
            let rotateAnimation = AnimationType.rotate(angle: CGFloat.pi/6)
//            UIView.animate(views: cells, animations: [fromAnimation, zoomAnimation, rotateAnimation])
            UIView.animate(views: cells, animations: [fromAnimation, rotateAnimation], reversed: false, initialAlpha: 0.0, finalAlpha: 1.0, delay: 0, animationInterval: 0.1, duration: 1, usingSpringWithDamping: ViewAnimatorConfig.springDampingRatio, initialSpringVelocity: ViewAnimatorConfig.initialSpringVelocity, options: [], completion: nil)
        }
    }

}


extension StoresVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreCell") as! StoreCell
        let store = stores[indexPath.row]
        cell.configure(store: store)
        cell.delegate = self
        
        if store.reserved {
            let newBtnColor = Constants.Colors.thirdColor
            cell.bookBtn.backgroundColor = newBtnColor
            cell.bookBtn.layer.shadowColor = newBtnColor.cgColor
            cell.bookBtn.setTitle("تم الحجز", for: .normal)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}


extension StoresVC: handleBookBtnTappedProtocol{
    func buttonTapped(cell: StoreCell) {
        let store = cell.store
        
        // check for availability
        guard store!.isAvailable! else {
            let alert = AlertManager.getAlert()
            alert.showError("خطأ", subTitle: "المتجر ممتلئ حسب الوقت المحدد> الرجاء الانتظار أو اختيار وقت آخر")
            return
        }
        
        // check if not already reserved
        guard !store!.reserved else {
            let alert = AlertManager.getAlert()
            alert.showError("خطأ", subTitle: "لديك بالفعل موعد محجوز في هذا المتجر")
            return
        }
        
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewAppointmentVC") as! NewAppointmentVC
        if #available(iOS 13.0, *) {
            vc.isModalInPresentation = true
        }
        vc.store = cell.store
        self.present(vc, animated: true, completion: nil)
        
//        let newBtnColor = UIColor(hex: "26A69A")
//        cell.bookBtn.backgroundColor = newBtnColor
//        cell.bookBtn.layer.shadowColor = newBtnColor.cgColor
//        cell.bookBtn.setTitle("تم الحجز", for: .normal)
//        let added = DataStore.addAppointmentForStore(store: store!)
//        showDialog(added: added)
    }
    
    
    private func showDialog(added: Bool){
        let alert = AlertManager.getAlert()
        let title = added ? "تم الحجز" : "خطأ"
        let subTitle = added ? "تم إضافة الحجز لقائمة مواعيدك، كن على استعداد" : "يوجد لديك حجز في نفس الفرع مسبقا"
        if added {
          alert.showSuccess(title, subTitle: subTitle)
        }else{
            alert.showError(title, subTitle: subTitle)
        }
    }
    
    
//    private func showDialog2(){
////        let alertVC = PMAlertController(title: "Done!", description: "My Description", image: #imageLiteral(resourceName: "masool"), style: .alert)
////
////        alertVC.addAction(PMAlertAction(title: "Cancel", style: .cancel, action: { () -> Void in
////                    print("Capture action Cancel")
////                }))
////
////        alertVC.addAction(PMAlertAction(title: "OK", style: .default, action: { () in
////                    print("Capture action OK")
////                }))
////
////        alertVC.addTextField { (textField) in
////                    textField?.placeholder = "Location..."
////                }
////
////        self.present(alertVC, animated: true, completion: nil)
//
//        let alert = MyAlertViewController(
//            title: "Hello world",
//            message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed massa a magna semper semper a eget justo",
//            imageName: "warning_icon")
//
//        alert.addAction(title: "OK", style: .default)
//        alert.addAction(title: "Cancel", style: .cancel)
//
//        present(alert, animated: true, completion: nil)
//    }
    
    
    
}
