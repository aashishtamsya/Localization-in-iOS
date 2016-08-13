//
//  MovieTableViewCell.swift
//  ATLocalization
//
//  Created by Felix ITs 01 on 14/07/16.
//  Copyright © 2016 Aashish Tamsya. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelYear: UILabel!
    
    @IBOutlet weak var labelGenre: UILabel!
    
    @IBOutlet weak var labelRated: UILabel!
    
    
    @IBOutlet weak var labelReleased: UILabel!
    
    @IBOutlet weak var labelRuntime: UILabel!
    
    @IBOutlet weak var labelDirector: UILabel!
    
    @IBOutlet weak var labelWriter: UILabel!
    
    @IBOutlet weak var labelCast: UILabel!
    
    @IBOutlet weak var labelPlot: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
