//
//  ViewController.swift
//  DiffableDataSource
//
//  Created by Junho Lee on 2022/02/23.
//

import UIKit

class ViewController: UIViewController {
class VideosViewController: UICollectionViewController {
  // MARK: - Properties
  private var searchController = UISearchController(searchResultsController: nil)
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    configureSearchController()
//    configureLayout()
  }
  
  // MARK: - Functions
}

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
// MARK: - UISearchResultsUpdating Delegate
extension VideosViewController: UISearchResultsUpdating {
    }
  func configureSearchController() {
    searchController.searchResultsUpdater = self
    searchController.obscuresBackgroundDuringPresentation = false
    searchController.searchBar.placeholder = "Search Videos"
    navigationItem.searchController = searchController
    definesPresentationContext = true
  }
}


}

