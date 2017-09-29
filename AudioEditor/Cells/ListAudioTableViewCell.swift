//
//  ListAudioTableViewCell.swift
//  AudioEditor
//
//  Created by Lorence Lim on 28/09/2017.
//  Copyright © 2017 Ingenuity. All rights reserved.
//

import UIKit

class ListAudioTableViewCell: UITableViewCell {

    @IBOutlet weak var fileLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(filename: String) {
        self.fileLabel.text = filename
    }
}
