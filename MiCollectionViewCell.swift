//
//  MiCollectionViewCell.swift
//  AdvancedInterface
//
//  Created by user190722 on 1/26/22.
//

import UIKit

class MiCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    var isInEditingMode: Bool = false {
        didSet {
            title.isHidden = !isInEditingMode
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if isInEditingMode {
                title.text = isSelected ? "✓" : ""
            }
        }
    }
}
