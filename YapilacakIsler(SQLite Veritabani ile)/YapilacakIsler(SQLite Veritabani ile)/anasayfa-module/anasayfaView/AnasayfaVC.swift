//
//  ViewController.swift
//  YapilacakIsler(SQLite Veritabani ile)
//
//  Created by Aykut ATABAY on 1.09.2022.
//

import UIKit

class AnasayfaVC: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    var isListesi = [YapilacakIsler]()
    var anasayfaPresenterNesne:viewToPresenterAnasayfa?
    override func viewDidLoad() {
        AnasayfaRouter.createModule(ref: self)
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        veritabaniKopyalama()
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action:#selector(isEkle))
        navigationItem.title = "Yapılacak İş"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesne?.isleriYukle()
        //anasayfaya donuldugunde veriler yuklenmis olacak
    }
    func veritabaniKopyalama(){
        let bundleYolu = Bundle.main.path(forResource: "Yapilacaklar", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("Yapilacaklar.sqlite")
        let fm = FileManager.default
        if fm.fileExists(atPath: kopyalanacakYer.path){
            print("veritabanı zaten var")
        }else{
            do{
                try fm.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    @objc func isEkle(){
        performSegue(withIdentifier: "toKayit", sender: nil)
    }


}

extension AnasayfaVC : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaPresenterNesne?.ara(aramaKelimesi: searchText)
    }
}

extension AnasayfaVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yapilacak_is = isListesi[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "isCell", for: indexPath) as! isCell
        hucre.isLabel.text = "\(yapilacak_is.is_ad!)"
        
        return hucre
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yapilacak_is = isListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yapilacak_is)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "sil"){(contextualAction,view,bool) in
            let yapilacak = self.isListesi[indexPath.row]
            print("\(yapilacak.is_id!) silindi")
            
            let alert = UIAlertController(title: "Silme islemi", message: "\(String(describing: yapilacak.is_id)) silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "iptal", style: .cancel)
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action
                in
                self.anasayfaPresenterNesne?.sil(is_id: yapilacak.is_id!)
                
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
    
}
extension AnasayfaVC : presenterToViewAnasayfa {
    func vieweVeriGonder(isListesi: Array<YapilacakIsler>) {
        self.isListesi = isListesi
        self.tableView.reloadData()
    }
    
    
}
