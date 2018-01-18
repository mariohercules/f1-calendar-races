//
//  RacesTableViewController.swift
//  CoreDataTest
//
//  Created by Mario Hercules Portela on 18/01/18.
//  Copyright © 2018 Mario Hercules Portela. All rights reserved.
//

import UIKit
import CoreData

class RacesTableViewController: UITableViewController {

    
    let managedObjectContext = (UIApplication.shared.delegate
        as! AppDelegate).managedObjectContext
    
    var calendar = [Calendar]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calendar.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = calendar[indexPath.row].race
        cell.detailTextLabel?.text = calendar[indexPath.row].circuit

        return cell
    }
 
    // MARK: Fetch data from CoreData
    
    func setupUI() {
        
        self.title = "Circuits List"
        
        getDataFromCoreData()
        
        tableView.reloadData()
        
    }
    
    func getDataFromCoreData() {
        
        let track = NSFetchRequest<NSFetchRequestResult>(entityName: "Calendar")
        
        do {
            
            let fetchData = try managedObjectContext.fetch(track) as! [Calendar]
            
            calendar = fetchData
            
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
        
    }
    

}
