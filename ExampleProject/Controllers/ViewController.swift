//
//  ViewController.swift
//  ExampleProject
//
//  Created by vishal modem on 6/19/18.
//  Copyright © 2018 vishal modem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var actors : [Actor] = [Actor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func Make(_ sender: UIButton) {
       makeRequest()
    }
    func makeRequest() {
        guard let url = URL(string: "http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil, response != nil else{
           return
            }
            do{
            let decoder = JSONDecoder()
            let downloadedactors =  try decoder.decode(Actors.self, from: data)
//           self.actors = [Actor]()
//                for actor in downloadedactors.actors!{
//                  let a =   Actor(name: actor.name, image: actor.image)
//                    self.actors?.append(a)
//                }
                guard let actors =  downloadedactors.actors else { return }
                self.actors = actors
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "segue", sender: self)
                    
                }
            } catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            if let destinationVC = segue.destination as? ActorsTVC {
                //guard let actors = self.actors else{ return}
                let s = sender as? ViewController
                destinationVC.actors = s?.actors
            }
        }
    }
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue){
}

}
