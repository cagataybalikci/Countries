//
//  CountryTableViewCell.swift
//  Countries
//
//  Created by Çağatay Balıkçı on 3.09.2022.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var saveButton: StarCheckBoxButton!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryViewBG: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
        saveButton.addTarget(self, action: #selector(saveItem), for: UIControl.Event.touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupUI(){
        countryViewBG.layer.borderWidth = 2
        countryViewBG.layer.cornerRadius = 10
    }
    
    @objc func saveItem(sender: StarCheckBoxButton){
        
        if sender.isChecked {
                sender.isChecked = false
            }else{
                sender.isChecked = true
            }
        
    }
    
    
    

}
