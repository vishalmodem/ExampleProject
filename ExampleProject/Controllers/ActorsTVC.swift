//
//  ActorsTVC.swift
//  ExampleProject
//
//  Created by vishal modem on 6/20/18.
//  Copyright © 2018 vishal modem. All rights reserved.
//

import UIKit

class ActorsTVC: UITableViewController {

    var actors : [Actor]?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actors!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = actors![indexPath.row].name
        let url = URL(string: actors![indexPath.row].image!)
        if let imageUrl = url {
            do {
            let data = try Data(contentsOf: imageUrl)
                cell.imageView?.image = UIImage(data: data)

        } catch{
            print(error.localizedDescription)
            }
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue1" {
            if let destinationVC = segue.destination as? ImageShowVC {
                //guard let actors = self.actors else{ return}
                guard let cell = sender as? UITableViewCell, let actrs = actors  else { return }
                
                guard let indexpath = tableView.indexPath(for: cell), let imgURL = actrs[indexpath.row].image, let name = actrs[indexpath.row].name else { return }
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
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
