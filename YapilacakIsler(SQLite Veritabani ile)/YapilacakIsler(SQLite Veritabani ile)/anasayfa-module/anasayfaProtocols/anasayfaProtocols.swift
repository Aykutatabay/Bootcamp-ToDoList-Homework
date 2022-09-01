//
//  anasayfaProtocols.swift
//  YapilacakIsler(SQLite Veritabani ile)
//
//  Created by Aykut ATABAY on 1.09.2022.
//

import Foundation
//ANA
protocol viewToPresenterAnasayfa{
    var interactorAnasayfa:presenterToInteractorAnasayfa? {get set}
    var viewAnasayfa:presenterToViewAnasayfa? {get set}
    func isleriYukle()
    func ara(aramaKelimesi:String)
    func sil(is_id:Int)
    
}
protocol presenterToInteractorAnasayfa{
    var presenterAnasayfa:interactorToPresenterAnasayfa? {get set}
    func isleriAl()
    func isAra(aramaKelimesi:String)
    func isSil(is_id:Int)
}
//TASIYICI
protocol interactorToPresenterAnasayfa{
    func presenteraVeriGonder(isListesi:Array<YapilacakIsler>)
    
    
}
protocol presenterToViewAnasayfa{
    func vieweVeriGonder(isListesi:Array<YapilacakIsler>)
}
//ROUTER

protocol presenterToRouterAnasayfa{
    static func createModule(ref:AnasayfaVC)
}
