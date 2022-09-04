//
//  StarCheckBoxButton.swift
//  Countries
//
//  Created by Çağatay Balıkçı on 4.09.2022.
//

import Foundation
import UIKit

class StarCheckBoxButton : UIButton {
    let checkImage = UIImage(named: "star")! as UIImage
    let uncheckImage = UIImage(named: "star")! as UIImage
    
    var isChecked : Bool = false {
        didSet{
            if isChecked  == true {
                self.setImage(uncheckImage , for: .normal)
            }else{
                self.setImage(checkImage, for: .normal)
            }
        }
    }
    
    override  func awakeFromNib() {
        self.isUserInteractionEnabled = true
        self.addTarget(self, action: #selector(StarCheckBoxButton.ButtonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
    }
     
    @objc func ButtonClicked(sender: UIButton){
        if sender == self {
            if isChecked {
                isChecked = false
                self.tintColor = .lightGray
            }else{
                isChecked = true
                self.tintColor = .black
            }
        }
    }
}
