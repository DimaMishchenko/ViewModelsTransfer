//
//  ViewModelsTransfer.swift
//  ViewModelsTransfer
//
//  Created by Dima Mishchenko on 20.12.2017.
//  Copyright © 2017 Dima Mishchenko. All rights reserved.
//

import Foundation
import UIKit

protocol ViewModelTransfer where Self: UIView
{
    associatedtype ViewModelType
    
    func update(with viewModel: ViewModelType)
}

fileprivate var associatedCellViewModelDictionaryKey: UInt8 = 1

extension UICollectionView
{
    private typealias IdentifierViewModel = (identifier: String,
        viewModelType: Any.Type,
        cellType: Any.Type)
    
    private var identifierViewModelArray: [IdentifierViewModel]
    {
        get
        {
            return objc_getAssociatedObject(self, &associatedCellViewModelDictionaryKey) as? [IdentifierViewModel] ?? [IdentifierViewModel]()
        }
        set(newValue)
        {
            objc_setAssociatedObject(self,
                                     &associatedCellViewModelDictionaryKey,
                                     newValue,
                                     objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func register<Cell: ViewModelTransfer & UICollectionViewCell>(_ cellType: Cell.Type,
                                                              for viewModelType: Any.Type)
    {
        let identifier = String(describing: cellType)
        self.register(cellType, forCellWithReuseIdentifier: identifier)
        self.identifierViewModelArray.append((identifier, viewModelType, cellType))
    }
    
    func dequeueReusableCell<T: ViewModelTransfer & UICollectionViewCell>(withViewModel viewModel: Any,
                                                                      for indexPath: IndexPath) -> T
    {
        var cell: T?
        for idetifierViewModel in self.identifierViewModelArray
        {
            if idetifierViewModel.viewModelType == type(of: viewModel) &&
                idetifierViewModel.cellType == T.self
            {
                cell = self.dequeueReusableCell(withReuseIdentifier: idetifierViewModel.identifier,
                                                for: indexPath) as? T
                cell?.update(with: viewModel as! T.ViewModelType)
            }
        }
        if cell == nil
        {
            assertionFailure("You must call register(cell:, for:)")
        }
        return cell!
    }
}

extension UITableView
{
    private typealias IdentifierViewModel = (identifier: String,
        viewModelType: Any.Type,
        cellType: Any.Type)
    
    private var identifierViewModelArray: [IdentifierViewModel]
    {
        get
        {
            return objc_getAssociatedObject(self, &associatedCellViewModelDictionaryKey) as? [IdentifierViewModel] ?? [IdentifierViewModel]()
        }
        set(newValue)
        {
            objc_setAssociatedObject(self,
                                     &associatedCellViewModelDictionaryKey,
                                     newValue,
                                     objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func register<Cell: ViewModelTransfer & UITableViewCell>(_ cellType: Cell.Type,
                                                              for viewModelType: Any.Type)
    {
        let identifier = String(describing: cellType)
        self.register(cellType, forCellReuseIdentifier: identifier)
        self.identifierViewModelArray.append((identifier, viewModelType, cellType))
    }
    
    func dequeueReusableCell<T: ViewModelTransfer & UITableViewCell>(withViewModel viewModel: Any,
                                                                      for indexPath: IndexPath) -> T
    {
        var cell: T?
        for idetifierViewModel in self.identifierViewModelArray
        {
            if idetifierViewModel.viewModelType == type(of: viewModel) &&
                idetifierViewModel.cellType == T.self
            {
                cell = self.dequeueReusableCell(withIdentifier: idetifierViewModel.identifier, for: indexPath) as? T
                cell?.update(with: viewModel as! T.ViewModelType)
            }
        }
        if cell == nil
        {
            assertionFailure("You must call register(cell:, for:)")
        }
        return cell!
    }
}
