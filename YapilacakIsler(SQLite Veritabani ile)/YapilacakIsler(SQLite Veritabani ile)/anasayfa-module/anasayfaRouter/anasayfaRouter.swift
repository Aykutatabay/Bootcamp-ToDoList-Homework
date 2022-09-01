//
//  anasayfaRouter.swift
//  YapilacakIsler(SQLite Veritabani ile)
//
//  Created by Aykut ATABAY on 1.09.2022.
//

import Foundation
class AnasayfaRouter:presenterToRouterAnasayfa {
    static func createModule(ref: AnasayfaVC) {
        let presenter = anasayfaPresenter()
        //view
        ref.anasayfaPresenterNesne = presenter
        //presenter
        ref.anasayfaPresenterNesne?.interactorAnasayfa = anasayfaInteractor()
        ref.anasayfaPresenterNesne?.viewAnasayfa = ref
        
        //interactor
        
        ref.anasayfaPresenterNesne?.interactorAnasayfa?.presenterAnasayfa = presenter
    }
    
    
}
