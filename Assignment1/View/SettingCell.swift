//
//  SettingCell.swift
//  Assignment1
//
//  Created by Jonathan on 24/03/18.
//  Copyright © 2018 Jonathan. All rights reserved.
//

import UIKit

class SettingCell: UICollectionViewCell {
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Setting"
        return label
    }()
    
    let btnBlue: UIButton = {
        let button = UIButton()
        button.setTitle("fuck", for: .normal)
        return button
    }()
    

    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundView = btnBlue
        
        
        
        
    }
}
