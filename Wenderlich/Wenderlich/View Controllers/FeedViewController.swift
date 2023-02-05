//
//  ViewController.swift
//  Wenderlich
//
//  Created by Brian Slick on 2/2/23.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CellIdentifier"
        
        let cell: UITableViewCell
        if let existingCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) {
            cell = existingCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        
        cell.textLabel?.text = "Row \(indexPath.row)"
        
        return cell
    }
}
