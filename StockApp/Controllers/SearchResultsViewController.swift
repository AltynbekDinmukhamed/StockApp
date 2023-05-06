//
//  SearchResultsViewController.swift
//  StockApp
//
//  Created by Димаш Алтынбек on 29.04.2023.
//

import UIKit

protocol SearchResultViewControllerDelegate: AnyObject {
    func searchResultViewController(searchResult: SearchResults)
}

class SearchResultsViewController: UIViewController {
    
    weak var delegate: SearchResultViewControllerDelegate?
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.idendifier)
        return table
    }()
    
    private var results: [SearchResults] = []
    
    //MARK: -LifeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpTable()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func setUpTable() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    public func update(with result: [SearchResults]) {
        self.results = result
        tableView.reloadData()
    }

}

extension SearchResultsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.idendifier, for: indexPath)
        let model = results[indexPath.row]
        cell.textLabel?.text = model.displaySymbol
        cell.detailTextLabel?.text = model.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = results[indexPath.row]
        delegate?.searchResultViewController(searchResult: model)
    }
    
}
