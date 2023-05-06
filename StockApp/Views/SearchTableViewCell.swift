//
//  File.swift
//  StockApp
//
//  Created by Димаш Алтынбек on 30.04.2023.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    static let idendifier = "Cell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
