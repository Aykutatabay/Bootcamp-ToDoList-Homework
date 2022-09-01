//
//  isDetayVC.swift
//  YapilacakIsler(SQLite Veritabani ile)
//
//  Created by Aykut ATABAY on 1.09.2022.
//

import UIKit

class isDetayVC: UIViewController {

    @IBOutlet weak var TFLabel: UITextField!
    var isDetayViewNesne:viewToPresenterIsDetayProtocol?
    var yapilacak_is:YapilacakIsler?
    override func viewDidLoad() {
        super.viewDidLoad()
        isDetayRouter.createModule(ref: self)
        if let i = yapilacak_is {
            TFLabel.text = i.is_ad
            
        }

      
    }
    
    @IBAction func buttonGuncelle(_ sender: Any) {
        if let ia = TFLabel.text, let id = yapilacak_is{
            
            isDetayViewNesne?.isDetayInteractor?.is_guncelle(is_id: id.is_id!, is_ad: ia)
            
        }
    }
    
}
