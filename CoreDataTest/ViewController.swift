//
//  ViewController.swift
//  CoreDataTest
//
//  Created by Mario Hercules Portela on 17/01/18.
//  Copyright © 2018 Mario Hercules Portela. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var tracks = [Tracks]()
    
    let managedObjectContext = (UIApplication.shared.delegate
        as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //saveDataOnCoreData()
        //saveArrayOnCoreData(array: generateData())
        //getDataFromCoreData()
        
        // Save data on CoreData based on array of Races
        saveArrayOnCoreDataRaceCalendarEntity(array: generateRacesData())
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getDataFromCoreData() {
        
        let track = NSFetchRequest<NSFetchRequestResult>(entityName: "Tracks")
        
        do {
            let fetchTrack = try managedObjectContext.fetch(track) as! [Tracks]
            
            tracks = fetchTrack
            
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
        
        
        for thisTrack in tracks {
            print(thisTrack.name)
        }
        
    }
    
    func saveDataOnCoreData() {
        
        let entityDescription = NSEntityDescription.entity(forEntityName: "Tracks",
                                                           in: managedObjectContext)
        
        let track = Tracks(entity: entityDescription!, insertInto: managedObjectContext)
        
        track.name = "First"
        
        do {
            try managedObjectContext.save()
        } catch let error as NSError {
            print(error.localizedFailureReason!)
        }
        
    }
    
    
//    func saveArrayOnCoreData(array: [String]) {
//
//        for (value) in array {
//
//            let obj = NSEntityDescription.insertNewObject(forEntityName: "Tracks", into: managedObjectContext) as! Tracks
//                obj.name = value
//        }
//
//        do {
//            try managedObjectContext.save()
//        } catch let error as NSError {
//            print(error.localizedFailureReason!)
//        }
//
//    }
//
    func generateData() -> [String] {
        
        let array = [
         "First",
         "Second",
         "Third",
         "Fourth"
        ]
        
        return array
        
    }
 
    func saveArrayOnCoreDataRaceCalendarEntity(array: [Race]) {
        
        for (raceCalendar) in array {
            
            let obj = NSEntityDescription.insertNewObject(forEntityName: "Calendar", into: managedObjectContext) as! Calendar
            
            obj.id      = raceCalendar.id
            obj.race    = raceCalendar.race
            obj.circuit = raceCalendar.circuit
            obj.image   = raceCalendar.image
            
        }
        
        do {
            try managedObjectContext.save()
        } catch let error as NSError {
            print(error.localizedFailureReason!)
        }
        
    }
    
    func generateRacesData() -> [Race] {
    
        var array:[Race] = []
        
        array.append(Race(1,"Australian Grand Prix","Albert Park March 23 – 25","Australian-Grand-Prix"))
        array.append(Race(2,"Bahrain Grand Prix","Bahrain International Circuit April 6 – 8","Bahrain-Grand-Prix"))
        array.append(Race(3,"Chinese Grand Prix","Shanghai International Circuit April 13 – 15","Chinese-Grand-Prix"))
        array.append(Race(4,"Azerbaijan Grand Prix","Baku City Circuit April 27 – 29","Azerbaijan-Grand-Prix"))
        array.append(Race(5,"Spanish Grand Prix","Circuit de Catalunya May 11 – 13","Spanish-Grand-Prix"))
        array.append(Race(6,"Monaco Grand Prix","Monaco May 24 – 27","Monaco-Grand-Prix"))
        array.append(Race(7,"Canadian Grand Prix","Circuit Gilles Villeneuve June 8 – 10","Canadian-Grand-Prix"))
        array.append(Race(8,"French Grand Prix","Paul Ricard June 22 – 24","French-Grand-Prix"))
        array.append(Race(9,"Austrian Grand Prix","Red Bull Ring June 29 – July 1","Australian-Grand-Prix"))
        array.append(Race(10,"British Grand Prix","Silverstone July 6 – 8","British-Grand-Prix"))
        array.append(Race(11,"German Grand Prix","Hockenheimring July 20 – 22","German-Grand-Prix"))
        array.append(Race(12,"Hungarian Grand Prix","Hungaroring July 27 – 29","Hungarian-Grand-Prix"))
        array.append(Race(13,"Belgian Grand Prix","Spa-Francorchamps August 24 – 26","Belgian-Grand-Prix"))
        array.append(Race(14,"Italian Grand Prix","Monza August 31 – September 2","Italian-Grand-Prix"))
        array.append(Race(15,"Singapore Grand Prix","Singapore September 14 – 16","Singapore-Grand-Prix"))
        array.append(Race(16,"Russian Grand Prix","Sochi Autodrom September 28 – 30","Russian-Grand-Prix"))
        array.append(Race(17,"Japanese Grand Prix","Suzuka October 5 – 7","Japanese-Grand-Prix"))
        array.append(Race(18,"United States Grand Prix","Circuit of the Americas October 19 – 21","United-States-Grand-Prix"))
        array.append(Race(19,"Mexican Grand Prix","Autodromo Hermanos Rodriguez October 26 – 28","Mexican-Grand-Prix"))
        array.append(Race(20,"Brazilian Grand Prix","Interlagos November 9 – 11","Brazilian-Grand-Prix"))
        array.append(Race(21,"Abu Dhabi Grand Prix","Yas Marina November 23 – 25","Abu-Dhabi-Grand-Prix"))
     
        return array
    
    }
    
    struct Race {
        
        var id: Int16
        var race: String
        var circuit: String
        var image: String
    
        init(_ id: Int16,_ race: String,_ circuit: String,_ image: String) {
            self.id = id
            self.race = race
            self.circuit = circuit
            self.image = image
        }
        
    }

}

