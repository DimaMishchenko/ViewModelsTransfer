//
//  TableViewCellWithStruct.swift
//  ViewModelsTransfer
//
//  Created by Dima Mishchenko on 20.12.2017.
//  Copyright © 2017 Dima Mishchenko. All rights reserved.
//

import UIKit

class TableViewCellWithStruct: UITableViewCell, ViewModelTransfer
{
    func update(with viewModel: StructViewModel)
    {
        self.textLabel?.text = viewModel.title
    }
}
