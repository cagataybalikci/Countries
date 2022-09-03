//
//  HomeViewController.swift
//  Countries
//
//  Created by Çağatay Balıkçı on 3.09.2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var countryTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        countryTableView.delegate = self
        countryTableView.dataSource = self
    }
    

   

}


extension HomeViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! CountryTableViewCell
        cell.countryNameLabel.text = "Turkey"
        return cell
    }
    
    
}
