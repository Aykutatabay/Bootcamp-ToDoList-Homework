//
//  isDetayRouter.swift
//  YapilacakIsler(SQLite Veritabani ile)
//
//  Created by Aykut ATABAY on 1.09.2022.
//

import Foundation
class isDetayRouter:presenterToRouterIsDetayProtocol{
    static func createModule(ref: isDetayVC) {
        ref.isDetayViewNesne = isDetayPresenter()
        ref.isDetayViewNesne?.isDetayInteractor = isDetayInteractor()
    }
    
    
}
