//
//  HomeViewController.swift
//  Countries
//
//  Created by Çağatay Balıkçı on 3.09.2022.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {

    @IBOutlet weak var saveButton: StarCheckBoxButton!
    @IBOutlet weak var countryTableView: UITableView!
    var countries = [NSManagedObject]()
    var countryList = [Country]()
    var countryCode = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        countryTableView.delegate = self
        countryTableView.dataSource = self
        
        setupUI()
        
        
        getData()
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
    
    
    func saveCountry(name:String,code:String, isSaved: Bool, countries: [NSManagedObject]){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context : NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let SavedCountry = NSEntityDescription.entity(forEntityName: "SavedCountry", in: context)
        let savedItem = NSManagedObject(entity: SavedCountry!, insertInto: context)
        
        savedItem.setValue(name, forKeyPath: "name")
        savedItem.setValue(code, forKeyPath: "code")
        savedItem.setValue(isSaved, forKey: "isSaved")

          // 4
          do {
            try context.save()
              self.countries.append(savedItem)
          } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
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
