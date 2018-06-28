//
//  ActorsTVC.swift
//  ExampleProject
//
//  Created by vishal modem on 6/20/18.
//  Copyright © 2018 vishal modem. All rights reserved.
//

import UIKit
import CoreData
import RequestManagerFramework

class ActorsTVC: UITableViewController {

    var actors : [Actor]?
    var hollyActors = [HollyActors]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        loadData()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actors?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ActorTableViewCell
        cell.updateCell(actor: actors![indexPath.row])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue1" {
            if let destinationVC = segue.destination as? ImageShowVC {
                //guard let actors = self.actors else{ return}
                guard let cell = sender as? UITableViewCell  else { return }
                guard let indexpath = tableView.indexPath(for: cell), let imgURL = hollyActors[indexpath.row].image, let name = hollyActors[indexpath.row].name else { return }
                do{
                    guard let url = URL(string: imgURL) else{ return}
                    let data = try Data(contentsOf: url)
                    let image = UIImage(data: data)
                    destinationVC.image = image
                    destinationVC.name = name

                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
 

   
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }


  
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            actors?.remove(at: indexPath.row)
            context.delete(hollyActors[indexPath.row])
            do{
                try context.save()
            } catch{
                print(error)
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
loadData()
        }
    }
    private func loadData(){
        let request: NSFetchRequest = HollyActors.fetchRequest()
        do{
            hollyActors = try context.fetch(request)
        }
        catch{
            print(error)
        }
    }

}
