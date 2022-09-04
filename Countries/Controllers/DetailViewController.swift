//
//  DetailViewController.swift
//  Countries
//
//  Created by Çağatay Balıkçı on 3.09.2022.
//

import UIKit

class DetailViewController: UIViewController {

    var countryCode = ""
    
    @IBOutlet weak var countryFlagImageView: UIImageView!
    @IBOutlet weak var countryCodeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getCountryDetailData(countryCode: countryCode)
        
        
    }
    
    func getCountryDetailData(countryCode:String){
        WebServices().getCountryDetail(countryCode: countryCode) { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let detail):
                DispatchQueue.main.async() {
                    self.navigationItem.title = detail.name?.capitalized
                    self.countryCodeLabel.text = detail.code
                }
            }
        }
    }

}
