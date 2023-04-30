//
//  ViewController.swift
//  StockApp
//
//  Created by Димаш Алтынбек on 29.04.2023.
//

import UIKit

class WatchListViewController: UIViewController {
    //MARK: -LifeCycle-
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpSearchController()
        setUpTitleView()
    }
    //MARK: -Functions-
    private func setUpSearchController() {
        let result = SearchResultsViewController()
        let searchVC  = UISearchController(searchResultsController: result)
        searchVC.searchResultsUpdater = self
        navigationItem.searchController = searchVC
    }

    private func setUpTitleView(){
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: navigationController?.navigationBar.height ?? 100))
        
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: titleView.width - 20, height: titleView.height))
        label.text = "Stocks"
        label.font = .systemFont(ofSize: 40, weight: .medium)
        navigationItem.titleView = titleView
    }
}
//MARK: -Extension-
extension WatchListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text,
              let resultVC = searchController.searchResultsUpdater as? SearchResultsViewController,
              !query.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty else {
            return
        }
        //optimize to reduce number of search when user stops typing
        
        //Call API to search
        print(query)
    }
    
}
