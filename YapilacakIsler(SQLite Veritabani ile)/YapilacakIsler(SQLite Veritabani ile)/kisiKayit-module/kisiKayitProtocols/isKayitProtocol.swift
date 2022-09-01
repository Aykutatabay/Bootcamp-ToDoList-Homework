//
//  kisiKayitProtocol.swift
//  YapilacakIsler(SQLite Veritabani ile)
//
//  Created by Aykut ATABAY on 1.09.2022.
//

import Foundation
protocol viewToPresenterKayitProtocol{
    var isKayitInteractor:presenterToInteractorKayitProtocol? {get set}
    func ekle(is_ad:String)
    
}
protocol presenterToInteractorKayitProtocol {
    func isEkle(is_ad:String)
    
}

protocol presenterToRouterKayitProtocol {
    static func createModule(ref:isKayitVC)
}
