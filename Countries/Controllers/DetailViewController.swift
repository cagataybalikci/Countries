//
//  DetailViewController.swift
//  Countries
//
//  Created by Çağatay Balıkçı on 3.09.2022.
//

import UIKit
import SVGKit
import CoreData

class DetailViewController: UIViewController {

    var countryCode = ""
    
    @IBOutlet weak var countryFlagImageView: UIImageView!
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    var wikiID = ""
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
                    self.setupImage(url: detail.flagImageUri)
                    self.wikiID = detail.wikiDataId
                    
                }
            }
        }
    }
    
    func setupImage(url:String){
        let mySVGImage: SVGKImage = SVGKImage(contentsOf: URL(string: url))
        countryFlagImageView.image = mySVGImage.uiImage
    }
    
    
    @IBAction func infoButtonPressed(_ sender: Any) {
        if let url = URL(string: "https://www.wikidata.org/wiki/\(self.wikiID)") {
            UIApplication.shared.open(url)
        }
    }
    
    
    
}
