//
//  FirstViewController.swift
//  SpaRez
//
//  Created by kabir merakeb on 7/7/18.
//  Copyright © 2018 merakeb. All rights reserved.
//

import UIKit
import Foundation

class BusinessViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var businessArray = [Business]()
    
    var selectedBusiness = [Business] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func phoneButtonPressed(_ sender: Any) {
        let url: URL = URL(string: "Tel://9254824843")!
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        let activityViewController = UIActivityViewController(activityItems: ["sharing SpaRez ..."], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func addFavorite (sender: UIButton) {
   //     print(" \(sender.tag) was selected as favorites")
  //  self.delegate.favoriteBusiness.append(businessArray[sender.tag])
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        RefService.instance.getAllBusinesses { (returnedBusinessArray) in
            self.businessArray = returnedBusinessArray
            self.tableView.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension BusinessViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businessArray.count
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessCell") as? BusinessCell
            else {
                return UITableViewCell()
        }
        let idx: Int = indexPath.row
        cell.favBusiness.tag = idx
        cell.businessName?.text = businessArray[idx].businessName
        cell.businessLocation?.text = businessArray[idx].businessCity
        cell.businessPhone?.text = businessArray[idx].businessPhone
        cell.businessStreet?.text = businessArray[idx].businessStreet
        displayBusinessLogo(idx, cell: cell)

        return cell
        
    }
    
    func displayBusinessLogo(_ row: Int, cell: BusinessCell) {
        let url: String = (URL(string: businessArray[row].businessLogo!)?.absoluteString)!
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler:{
            (data, response, error) -> Void in
            if error != nil {
                print("error: \(String(describing: error))")
                return
            }
            DispatchQueue.main.async(execute: {
                let image = UIImage(data: data!)
                cell.businessLogo?.image = image
                
            })
        }).resume()
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBusiness = businessArray[indexPath.row]
        print("\(selectedBusiness.businessCity)")
        
     
    }
}

