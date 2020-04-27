//
//  AppointmentCell.swift
//  Homathon
//
//  Created by يعرب المصطفى on 4/22/20.
//  Copyright © 2020 yarob. All rights reserved.
//

import UIKit

protocol appointmentCellProtocol {
    func deleteBtnTapped(cell: AppointmentCell)
}

class AppointmentCell: UITableViewCell {

    @IBOutlet weak var storeImageView: UIImageView!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var store: Store?
    var delegate:appointmentCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(store:Store){
        self.store = store
        self.storeNameLabel.text = store.name
        self.storeImageView.image = store.image
    }
    
    func configureDateAndTime(app: Appointment){
        self.dateLabel.text = app.date
        self.timeLabel.text = app.time
    }
    
    @IBAction func deleteBtnTapped(_ sender: UIButton) {
        if let vc = delegate{
            vc.deleteBtnTapped(cell: self)
        }
    }

}
