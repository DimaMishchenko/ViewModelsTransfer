//
//  TableViewCellWithString.swift
//  ViewModelsTransfer
//
//  Created by Dima Mishchenko on 20.12.2017.
//  Copyright © 2017 Dima Mishchenko. All rights reserved.
//

import UIKit

class TableViewCellWithString: UITableViewCell, ViewModelTransfer
{
    func update(with viewModel: String)
    {
        self.textLabel?.text = viewModel
    }
}
