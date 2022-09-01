//
//  isKayitRouter.swift
//  YapilacakIsler(SQLite Veritabani ile)
//
//  Created by Aykut ATABAY on 1.09.2022.
//

import Foundation
class isKayitRouter:presenterToRouterKayitProtocol {
    static func createModule(ref: isKayitVC) {
        ref.isKayitViewNesne = isKayitPresenter()
        ref.isKayitViewNesne?.isKayitInteractor = isKayitInteractor()
    }
    
    
}
