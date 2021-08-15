//
//  RestaurantTableViewCell.swift
//  TravelHistory
//
//  Created by IOS-Vishnu on 06/08/21.
//
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var detailslbl: UILabel!
    @IBOutlet weak var ratingslbl: UILabel!
    @IBOutlet weak var shopstatuslbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
