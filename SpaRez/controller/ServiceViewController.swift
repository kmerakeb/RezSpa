//
//  ServiceViewController.swift
//  SpaRez
//
//  Created by apple on 7/10/18.
//  Copyright © 2018 merakeb. All rights reserved.
//

import UIKit

class ServiceViewController: UIViewController {
    
        
    @IBOutlet weak var tableView: UITableView!
    
    var servicesArray: [Service] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        RefService.instance.getAllServices { (returnedServiceArray) in
            self.servicesArray = returnedServiceArray
            self.tableView.reloadData()
    }

}
}

extension ServiceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return servicesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let myCell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell") as? ServiceCell
            else {
                return UITableViewCell()
        }
        let idx: Int = indexPath.row
        myCell.serviceName?.text = servicesArray[idx].serviceName
        myCell.serviceDuration?.text = servicesArray[idx].serviceDuration
        myCell.servicePrice?.text = servicesArray[idx].servicePrice
        displayBusinessLogo(idx, myCell: myCell)
        return myCell
        
}
    func displayBusinessLogo(_ row: Int, myCell: ServiceCell) {
        let url: String = (URL(string: servicesArray[row].serviceLogo!)?.absoluteString)!
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler:{
            (data, response, error) -> Void in
            if error != nil {
                print("error: \(String(describing: error))")
                return
            }
            DispatchQueue.main.async(execute: {
                let image = UIImage(data: data!)
                myCell.serviceLogo?.image = image
                
            })
        }).resume()
    }
 
}

