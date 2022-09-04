//
//  HomeViewController.swift
//  Countries
//
//  Created by Çağatay Balıkçı on 3.09.2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var countryTableView: UITableView!
    var countryList = [Country]()
    var countryCode = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        countryTableView.delegate = self
        countryTableView.dataSource = self
        
        getData()
        
        setupUI()
        
    }
    
    //MARK: API Integration
    func getData(){
            WebServices().getCountry { [weak self] result in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let countries):
                    DispatchQueue.main.async() {
                        self?.countryList = countries
                        self?.countryTableView.reloadData()
                    }
                }
            }
        }
    
    
    
    
    func setupUI(){
        // Tabbar
        tabBarController?.tabBar.tintColor = .white
        tabBarController?.tabBar.unselectedItemTintColor = .black
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let destinationVC = segue.destination as! DetailViewController
                destinationVC.countryCode = countryCode
        }
    }
    
   

}


//MARK: TableView
extension HomeViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! CountryTableViewCell
        cell.countryNameLabel.text = countryList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        countryCode = countryList[indexPath.row].code
        countryTableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "toDetail", sender: self)
    }
    
    
}
