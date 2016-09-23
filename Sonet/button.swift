//
//  button.swift
//  Sonet
//
//  Created by Vinay Kumar Darna on 11/09/16.
//  Copyright © 2016 iSecurePayments. All rights reserved.
//

import UIKit

class button: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.yellow.cgColor
        
        
    }

}
