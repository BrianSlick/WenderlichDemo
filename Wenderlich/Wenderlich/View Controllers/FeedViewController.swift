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
    
    var dataManager: FeedProvider = DataManager.shared
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
//        let feedItem1 = FeedItem(name: "Article 1", artworkURL: nil, itemDescription: "Description 1", releaseDate: Date(), contentType: .article)
//        let feedItem2 = FeedItem(name: "Article 2", artworkURL: nil, itemDescription: "Description 2", releaseDate: Date().addingTimeInterval(2000), contentType: .article)
//        let feedItem3 = FeedItem(name: "Article 3", artworkURL: nil, itemDescription: "Description 3", releaseDate: Date().addingTimeInterval(4000), contentType: .article)
//
//        let feedItem4 = FeedItem(name: "Video 1", artworkURL: nil, itemDescription: "Description 4", releaseDate: Date().addingTimeInterval(1000), contentType: .video)
//        let feedItem5 = FeedItem(name: "Video 2", artworkURL: nil, itemDescription: "Description 5", releaseDate: Date().addingTimeInterval(3000), contentType: .video)
//        let feedItem6 = FeedItem(name: "Video 3", artworkURL: nil, itemDescription: "Description 6", releaseDate: Date().addingTimeInterval(5000), contentType: .video)
//
//        data = [feedItem1, feedItem2, feedItem3, feedItem4, feedItem5, feedItem6]
        
        Task {
            do {
                let articles = try await dataManager.allItems()
                data = articles
                refreshCurrentList()
            } catch {
                // TODO: Handle error
            }
        }
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
        Task {
            var newList = [FeedItem]()

            do {
                let data: [FeedItem]
                
                switch displayMode {
                case .all:
                    data = try await dataManager.allItems()
                case .articles:
                    data = try await dataManager.articles()
                case .videos:
                    data = try await dataManager.videos()
                }
                
                newList.append(contentsOf: data)
            }
            catch {
                // TODO: Handle error
            }
            
            currentList = newList
            tableView.reloadData()
        }
    }
    
    func feedItem(at indexPath: IndexPath) -> FeedItem {
        return currentList[indexPath.row]
    }
    
    func populate(cell: FeedTableViewCell, at indexPath: IndexPath) {
        let feedItem = feedItem(at: indexPath)

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
        cell.dateLabel.text = Constants.displayDateFormatter.string(from: feedItem.releaseDate)
    }
    
}

// MARK: - UITableViewDataSource Functions

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(reflecting: FeedTableViewCell.self), for: indexPath) as? FeedTableViewCell else {
            fatalError("Failed to load FeedTableViewCell")
        }
        
        populate(cell: cell, at: indexPath)
        
        return cell
    }
}

// MARK: - UITableViewDelegate Functions

extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
