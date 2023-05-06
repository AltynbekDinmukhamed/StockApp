//
//  PercictenseManager.swift
//  StockApp
//
//  Created by Димаш Алтынбек on 30.04.2023.
//

import Foundation

final class PercictenseManager {
    static let shared = PercictenseManager()
    
    private let userDefault: UserDefaults = .standard
    
    private struct Constants {
        
    }
    
    private init() {
        
    }
    
    //MARK: -Public-
    
    var watchList: [String] {
        return []
    }
    
    public func addToWatchList() {
        
    }
    
    public func removeFromWatchList() {
        
    }
    //MARK: -Private-
    private var hasOnboarded: Bool {
        return false
    }
    
}
