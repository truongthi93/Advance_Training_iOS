//
//  CoreDataImage.swift
//  DemoVIPER
//
//  Created by Bao Ngo Mau on 9/24/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit
import CoreData

class CoreDataImage {
    static let shared = CoreDataImage()
    private init() {
    }
    
    func saveData(list : [SplashbaseImage]) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: Constants.nameDataAPI, in: managedContext)!
        
        for image in list{
            let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
            user.setValue(image.url, forKeyPath: Constants.nameDataAPIUrl)
            user.setValue(image.large_url, forKey: Constants.nameDataAPILarge_url)
            do {
                try managedContext.save()
            } catch let error as NSError {
                print("Could not save id), \(error), \(error.userInfo)")
            }
        }
    
    }
    
    func fetchData() -> [SplashbaseImage]? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return []}
        let managedContext = appDelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: Constants.nameDataAPI, in: managedContext)!
        
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.nameDataAPI)
        //userFetch.fetchLimit = 1
        //userFetch.predicate = NSPredicate(format: "name = %@", "John")
        let users = try! managedContext.fetch(userFetch)
        
        var list : [SplashbaseImage] = []
        for user in users{
            var image = SplashbaseImage()
            image.url = (user as! DataImage).url
            image.large_url = (user as! DataImage).large_url
            
            list.append(image)
        }
        return list
    }
    
    func deleteData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return}
        let managedContext = appDelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: Constants.nameDataAPI, in: managedContext)!
        
        let fetchRequest: NSFetchRequest<DataImage> = DataImage.fetchRequest()
        //fetchRequest.predicate = Predicate.init(format: "profileID==\(withID)")
        
        do {
            let objects = try managedContext.fetch(fetchRequest)
            for object in objects {
                managedContext.delete(object)
            }
            try managedContext.save()
        } catch _ {
            // error handling
        }
    }
}
