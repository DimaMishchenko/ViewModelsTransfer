//
//  ClassViewModel.swift
//  ViewModelsTransfer
//
//  Created by Dima Mishchenko on 25.12.2017.
//  Copyright © 2017 Dima Mishchenko. All rights reserved.
//

import Foundation

class ClassViewModel
{
    private var text: String?
    
    class func viewModelWith(text: String?) -> ClassViewModel
    {
        let model = ClassViewModel()
        model.text = text
        return model
    }
    
    var title: String
    {
        return self.text ?? ""
    }
}
