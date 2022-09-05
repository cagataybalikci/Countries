//
//  StarCheckBoxButton.swift
//  Countries
//
//  Created by Çağatay Balıkçı on 4.09.2022.
//

import Foundation
import UIKit
import CoreData

class StarCheckBoxButton : UIButton {
    let checkImage = UIImage(named: "star")! as UIImage
    let uncheckImage = UIImage(named: "star")! as UIImage
    
    
    var isChecked : Bool = false {
        didSet{
            if isChecked  == false {
                self.setImage(uncheckImage , for: .normal)
                self.tintColor = .lightGray
            }else{
                self.setImage(checkImage, for: .normal)
                self.tintColor = .black
            }
        }
    }
    
    override  func awakeFromNib() {
        self.isUserInteractionEnabled = true
    }
     
    
}
