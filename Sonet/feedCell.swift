//
//  feedCell.swift
//  Sonet
//
//  Created by Vinay Kumar Darna on 23/09/16.
//  Copyright © 2016 iSecurePayments. All rights reserved.
//

import UIKit

class feedCell: UITableViewCell {

    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var likeImage: UIImageView!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var feedText: UITextView!
    @IBOutlet weak var numberOfLikes: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   

}
