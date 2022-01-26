//
//  MyTableViewCell.swift
//  AdvancedInterface
//
//  Created by user190722 on 1/25/22.
//

import UIKit

protocol MiCeldaDelegate {
    func callPressed(name: String)
}

class MyTableViewCell: UITableViewCell {

    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var subtitle: UILabel!
    
    @IBOutlet weak var btnCall: UIButton!
    
    var delegate: MiCeldaDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setInfo(_ titleInfo: String, _ subtitleInfo: String){
        self.title.text = "\(titleInfo)"
        self.subtitle.text = "\(subtitleInfo)"
    }
    
    @IBAction func callPressed(_ sender: UIButton) {
        delegate?.callPressed(name: title.text ?? "")
    }
}
