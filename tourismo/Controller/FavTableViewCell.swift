//
//  FavTableViewCell.swift
//  pro5
//
//  Created by Shivam Sharma on 2021-12-02.
//

import UIKit

class FavTableViewCell: UITableViewCell {
    @IBOutlet var imgPhoto : UIImageView!
    @IBOutlet var lblName : UILabel!
    @IBOutlet var lblPrice : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
