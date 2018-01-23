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
    
    fileprivate lazy var fetchedResultsController: NSFetchedResultsController<Calendar> = {
        // Initialize Fetch Request
        let fetchRequest: NSFetchRequest<Calendar> = Calendar.fetchRequest()
        
        // Add Sort Descriptors
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // Initialize Fetched Results Controller
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        return fetchedResultsController
    }()
    
    var calendar = [Calendar]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            let fetchError = error as NSError
            print("Unable to Save Note")
            print("\(fetchError), \(fetchError.localizedDescription)")
        }
        
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
        guard let sections = fetchedResultsController.sections else {
            return 0
        }
        
        let sectionInfo = sections[section]
        return sectionInfo.numberOfObjects
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celIdentifier", for: indexPath)

        // Configure the cell...
        let calendar = fetchedResultsController.object(at: indexPath)
        cell.textLabel?.text = calendar.race
        cell.detailTextLabel?.text = calendar.circuit
        cell.imageView?.image = UIImage.init(named: calendar.image!)

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
