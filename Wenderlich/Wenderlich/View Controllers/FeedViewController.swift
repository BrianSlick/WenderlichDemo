//
//  ViewController.swift
//  Wenderlich
//
//  Created by Brian Slick on 2/2/23.
//

import UIKit

enum DisplayMode: Int {
    case all
    case articles
    case videos
}

class FeedViewController: UIViewController {

    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    
    var data: [FeedItem] = []
    var currentList: [FeedItem] = []
    var displayMode = DisplayMode.all
    
    // MARK: - UIViewController Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleData()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        refreshCurrentList()
    }

    // MARK: - IBActions
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        let newMode: DisplayMode = DisplayMode(rawValue: index) ?? .all
        displayMode = newMode
        refreshCurrentList()
        tableView.reloadData()
    }
    
    // MARK: - Misc Methods
    
    func loadSampleData() {
        let feedItem1 = FeedItem(name: "Article 1", artworkURL: nil, itemDescription: "Description 1", releaseDate: Date(), contentType: .article)
        let feedItem2 = FeedItem(name: "Article 2", artworkURL: nil, itemDescription: "Description 2", releaseDate: Date().addingTimeInterval(2000), contentType: .article)
        let feedItem3 = FeedItem(name: "Article 3", artworkURL: nil, itemDescription: "Description 3", releaseDate: Date().addingTimeInterval(4000), contentType: .article)
        
        let feedItem4 = FeedItem(name: "Video 1", artworkURL: nil, itemDescription: "Description 4", releaseDate: Date().addingTimeInterval(1000), contentType: .video)
        let feedItem5 = FeedItem(name: "Video 2", artworkURL: nil, itemDescription: "Description 5", releaseDate: Date().addingTimeInterval(3000), contentType: .video)
        let feedItem6 = FeedItem(name: "Video 3", artworkURL: nil, itemDescription: "Description 6", releaseDate: Date().addingTimeInterval(5000), contentType: .video)
        
        data = [feedItem1, feedItem2, feedItem3, feedItem4, feedItem5, feedItem6]
    }

    func setupTableView() {
        let className = "FeedTableViewCell"
        let nib = UINib(nibName: className, bundle: nil)

        tableView.register(nib, forCellReuseIdentifier: String(reflecting: FeedTableViewCell.self))
        
        if let cell = nib.instantiate(withOwner: nil)[0] as? FeedTableViewCell {
            tableView.rowHeight = CGRectGetHeight(cell.frame)
        }
    }
    
    func refreshCurrentList() {
        var newList = [FeedItem]()
        
        switch displayMode {
        case .all:
            newList.append(contentsOf: data)
        case .articles:
            newList.append(contentsOf: data.filter({ $0.contentType == .article }))
        case .videos:
            newList.append(contentsOf: data.filter({ $0.contentType == .video }))
        }
        
        newList.sort(by: { $0.releaseDate > $1.releaseDate })
        
        currentList = newList
    }
    
}


extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FeedTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(reflecting: FeedTableViewCell.self), for: indexPath) as! FeedTableViewCell
        
        let feedItem = currentList[indexPath.row]

        cell.titleLabel.text = feedItem.name
        cell.descriptionLabel.text = feedItem.itemDescription
        switch feedItem.contentType {
        case .article:
            cell.contentTypeLabel.text = "Article"
        case .video:
            cell.contentTypeLabel.text = "Video"
        default:
            cell.contentTypeLabel.text = "Mystery"
        }
        
        return cell
    }
}
