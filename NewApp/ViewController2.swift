//
//  viewController2ViewController.swift
//  NewApp
//
//  Created by Rahul Bhandari on 05/04/20.
//  Copyright © 2020 Rahul Bhandari. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITableViewDelegate ,UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    
    
   var refreshControl = UIRefreshControl()
    var dataToShow : [Int] = [1,2,3,4,5,6,7,8,9,10,11]
    var datatypes : datatype = datatype.straight
    var count: Int = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
            count = dataToShow.count
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        myTableView.addSubview(refreshControl)
        
                myTableView.delegate = self
                myTableView.dataSource = self
     
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        count = dataToShow.count
        return dataToShow.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell")!
        if datatypes == datatype.straight  {
            cell.textLabel?.text = String(dataToShow[indexPath.row])
        }
        else{
        print(count - 1 )
            cell.textLabel?.text = String(dataToShow[count - 1 ])
            count -= 1
        }
        
        return cell
 
    }
    @objc func refresh(sender:AnyObject) {
        print("refreshed")
        if datatypes == datatype.straight{
            datatypes = datatype.reverse
            self.myTableView.reloadData()
        }
        else{
            datatypes = datatype.straight
             self.myTableView.reloadData()
        }
    }
    
}
