//
//  NotaryCell.swift
//  Notary
//
//  Created by Avi Davidov on 09/06/2019.
//  Copyright © 2019 Avi Davidov. All rights reserved.
//

import UIKit


class NotaryCell: UITableViewCell {
    
    @IBOutlet weak var notaryNumLabel : UILabel!
    @IBOutlet weak var notaryClientNameLabel : UILabel!
    @IBOutlet weak var notaryActionLabel : UILabel!
    
    private func setupView(notary : Notary) {
        notaryNumLabel.text = String(notary.indexNumber)
        notaryClientNameLabel.text = notary.clientName
        notaryActionLabel.text = notary.approveKind.rawValue
    }

}
