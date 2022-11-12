//
//  TableViewCell.swift
//  TextAwto
//
//  Created by Kevin Amador Rios on 11/11/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let lblJokes:UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints =  false
        return lbl
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        SetupView()
    }
    
    //setup
    func SetupView() {
        addSubview(lblJokes)
        
        NSLayoutConstraint.activate([
            lblJokes.leftAnchor.constraint(equalTo: self.leftAnchor),
        ])
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
