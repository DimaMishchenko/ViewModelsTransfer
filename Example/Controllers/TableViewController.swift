//
//  TableViewController.swift
//  ViewModelsTransfer
//
//  Created by Dima Mishchenko on 20.12.2017.
//  Copyright © 2017 Dima Mishchenko. All rights reserved.
//

import UIKit

enum ViewModels: Int
{
    case stringViewModel
    case structViewModel
    case classViewModel
    
    static let count: Int = {
        var max: Int = 0
        while let _ = ViewModels(rawValue: max) { max += 1 }
        return max
    }()
}

class TableViewController: UITableViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tableView.register(TableViewCellWithString.self, for: String.self)
        self.tableView.register(TableViewCellWithStruct.self, for: StructViewModel.self)
        self.tableView.register(TableViewCellWithClass.self, for: ClassViewModel.self)
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return ViewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let type = ViewModels(rawValue: indexPath.row)
        switch type!
        {
        case .stringViewModel:
            let viewModel = "String ViewModel"
            let cell: TableViewCellWithString = tableView.dequeueReusableCell(withViewModel: viewModel, for: indexPath)
            return cell
        case .structViewModel:
            let viewModel = StructViewModel(title: "Struct ViewModel")
            let cell: TableViewCellWithStruct = tableView.dequeueReusableCell(withViewModel: viewModel, for: indexPath)
            return cell
        case .classViewModel:
            let viewModel = ClassViewModel.viewModelWith(text: "Class ViewModel")
            let cell: TableViewCellWithClass = tableView.dequeueReusableCell(withViewModel: viewModel, for: indexPath)
            return cell
        }
    }

}
