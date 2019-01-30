//
//  SecondViewController.swift
//  SpaRez
//
//  Created by apple on 7/7/18.
//  Copyright © 2018 merakeb. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    var feedsArray: [Feed] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        RefService.instance.getAllFeeds { (returnedFeedsArray) in
            self.feedsArray = returnedFeedsArray.reversed()
            self.tableView.reloadData()

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
    
extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return feedsArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell") as? FeedCell
                else {
                    return UITableViewCell()
            }
            let image = UIImage(named: "ic_account_box")
            let feed = feedsArray[indexPath.row]
            RefService.instance.getUsername(forUID: feed.senderId) { (returnedUserName) in
                cell.configureCell(profileImage: image!, email: returnedUserName, content: feed.content)

            }
            //let idx: Int = indexPath.row
           // cell.favBusiness.tag = idx
           // cell.businessName?.text = feed[idx].emai
           // cell.businessLocation?.text = favoriteBusiness[idx].businessCity
            // cell.image?.UIImage(named: "ic_account_box")
            //let business = businessArray[indexPath.row]
            // cell.configureCell(businessLogo: image!, businessName: business.businessName, businessLocation: business.businessCity)
            return cell
            
        }



}

