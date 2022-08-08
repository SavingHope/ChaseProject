//
//  CustomTableViewCell.swift
//  20220803-JaavionDavis-NYCSchools
//
//  Created by Jaavion Davis on 8/3/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var testScoreLbl: UILabel!
    @IBOutlet weak var schoolNameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        testScoreLbl.numberOfLines = 0
        schoolNameLbl.numberOfLines = 0
        schoolNameLbl.textAlignment = .center
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
