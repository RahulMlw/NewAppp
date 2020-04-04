//
//  ViewController.swift
//  NewApp
//
//  Created by Rahul Bhandari on 03/04/20.
//  Copyright © 2020 Rahul Bhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func showAlert(Title : String , message : String , actions : [String],complition : @escaping (String?)->()){
        let alert = UIAlertController(title: Title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        for title in actions{
            alert.addAction(UIAlertAction(title: title ,style: UIAlertAction.Style.default, handler: { (action) in
                complition(action.title) // My closure
            }))
        }
        
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func AlertButton(_ sender: Any) {
        showAlert(Title: "hello", message: "How are you?", actions: ["good","not good"]) { (selectedTitle) in
            print(selectedTitle ?? "No title")
        }
        
    }
    
    
}

