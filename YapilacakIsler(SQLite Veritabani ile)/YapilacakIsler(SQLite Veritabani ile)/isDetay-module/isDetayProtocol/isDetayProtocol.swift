//
//  isDetayProtocol.swift
//  YapilacakIsler(SQLite Veritabani ile)
//
//  Created by Aykut ATABAY on 1.09.2022.
//

import Foundation
protocol viewToPresenterIsDetayProtocol{
    var isDetayInteractor:presenterToInteractorIsDetayProtocol? {get set}
    func guncelle(is_id:Int, is_ad:String)
    
}
protocol presenterToInteractorIsDetayProtocol{
    func is_guncelle(is_id:Int, is_ad:String)
    
}
protocol presenterToRouterIsDetayProtocol{
    static func createModule(ref:isDetayVC)
}
