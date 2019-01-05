
//
//  TableViewDataSource.swift
//  Goodwrather
//
//  Created by Adarsha Upadhya on 05/01/19.
//  Copyright © 2019 Adarsha Upadhya. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSource<CellType,ViewModel>:NSObject,UITableViewDataSource where CellType:UITableViewCell{
    
    var items = [ViewModel]()
    let cellIdentifier:String
    let configureCell:(CellType,ViewModel)->()
    
    init(cellIdentifier:String,viewModel:[ViewModel],configureCell:@escaping(CellType,ViewModel)->()) {
        self.cellIdentifier = cellIdentifier
        self.items = viewModel
        self.configureCell = configureCell
    }
    
    func update(items:[ViewModel]){
        
        self.items = items
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CellType else{
            fatalError("Unable to create cell")
        }
        let viewModel = items[indexPath.row]
        self.configureCell(cell,viewModel)
        
        return cell
    }
    
}
