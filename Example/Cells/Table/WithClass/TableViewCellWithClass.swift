//
//  TableViewCellWithClass.swift
//  ViewModelsTransfer
//
//  Created by Dima Mishchenko on 25.12.2017.
//  Copyright © 2017 Dima Mishchenko. All rights reserved.
//

import UIKit

class TableViewCellWithClass: UITableViewCell, ViewModelTransfer
{
    func update(with viewModel: ClassViewModel)
    {
        self.textLabel?.text = viewModel.title
    }
}
