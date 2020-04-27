//
//  StoreCell.swift
//  Homathon
//
//  Created by يعرب المصطفى on 4/21/20.
//  Copyright © 2020 yarob. All rights reserved.
//

import UIKit

protocol handleBookBtnTappedProtocol {
    func buttonTapped(cell: StoreCell)
}

class StoreCell: UITableViewCell {
    @IBOutlet weak var storeImageView: UIImageView!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var bookBtn: UIButton!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var store: Store?
    
    var delegate:handleBookBtnTappedProtocol?
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
        self.distanceLabel.text = store.distance
        self.timeLabel.text = store.times
    }
    
    @IBAction func bookBtnTapped(_ sender: UIButton) {
        if let vc = delegate{
            vc.buttonTapped(cell: self)
        }
    }
    
}
