//
//  ViewController.swift
//  ExampleProject
//
//  Created by vishal modem on 6/19/18.
//  Copyright © 2018 vishal modem. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

var actors : [Actor] = [Actor]()
    var hollyActors = [HollyActors]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
        loadData()
    }
    @IBAction func Make(_ sender: UIButton) {
        RequestManager.shared.getActorsData({ (actors) in
            self.actors = actors
            if self.hollyActors.count < 6 {
                self.hollyActors.forEach({ (hA) in
                    self.context.delete(hA)
                    self.saveData()
                })
                self.loadData()
            let operationQueue = OperationQueue()
                operationQueue.maxConcurrentOperationCount = 1
            for actor in actors{
                let operation = {
                let hA = HollyActors(context: self.context)
                hA.image = actor.image
                hA.name = actor.name
                self.hollyActors.append(hA)
                self.saveData()
                }
                operationQueue.addOperation(operation)
            }
            }
            })
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "segue", sender: self)
                }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            if let destinationVC = segue.destination as? ActorsTVC {
                guard let s = sender as? ViewController else{ return }
                destinationVC.actors = s.actors
            }
        }
    }
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue){
}
    
    private func saveData(){
        do{
        try context.save()
        } catch{
            print(error)
        }
    }
    private func loadData(){
        let request: NSFetchRequest = HollyActors.fetchRequest()
        do{
            hollyActors = try context.fetch(request)
            print(hollyActors.count)
        }
        catch{
            print(error)
        }
    }

}
