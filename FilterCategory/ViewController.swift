//
//  ViewController.swift
//  test
//
//  Created by YoNa on 2021/03/12.
//

import UIKit

class ViewController: UIViewController {
    
    let categories = ["全て","アジア","北米","中南米","ヨーロッパ","オセアニア","中東","アフリカ"]
    var countries:[[String]] = [
        ["インド","インドネシア","カンボジア","シンガポール","スリランカ","タイ"],
        ["アメリカ","カナダ"],
        ["アルゼンチン","アンティグア・バーブーダ","ウルグアイ","エクアドル","エルサルバドル","キューバ"],
        ["アイスランド","アイルランド","アゼルバイジャン","アルバニア","アルメニア","イタリア"],
        ["オーストラリア","キリバス","クック諸島","サモア","ソロモン","ツバル"],
        ["アフガニスタン","アラブ首長国連邦","イエメン","イスラエル","イラク","イラン"],
        ["アルジェリア","ウガンダ","エジプト","エリトリア","エスワティニ","エチオピア"]
    ]
    var showMode:Bool = false
    var categoryNumber = 0
    
    @IBOutlet weak var testTableView: UITableView!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    
}


extension ViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCollectionViewCell
        cell.categoryLabel.text = categories[indexPath.row]
        if indexPath.row == categoryNumber {
            cell.categoryLabel.layer.backgroundColor = UIColor.lightGray.cgColor
        }else{
            cell.categoryLabel.layer.backgroundColor = nil
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let font = UIFont(name: "HiraMaruProN-W4", size: 17) ?? UIFont.systemFont(ofSize: 17)
        let width = categories[indexPath.row].size(withAttributes: [.font:font]).width
        return CGSize(width: round(width) + 30, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row != 0 {
            showMode = true
            categoryNumber = indexPath.row
        }else{
            showMode = false
            categoryNumber = 0
        }
        testTableView.reloadData()
        categoryCollectionView.reloadData()
       
    }
    
}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    // セクションタイトル
    func numberOfSections(in tableView: UITableView) -> Int {
        if !showMode {
            return categories.count - 1
        }else{
            return 1
        }
        
    }
    // セクションのタイトル
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if !showMode {
            return categories[section + 1]
            
        }else{
            return categories[categoryNumber]
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !showMode {
            return countries[section].count
        }else{
            return countries[categoryNumber - 1].count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = testTableView.dequeueReusableCell(withIdentifier: "countryCell") as! CountyTableViewCell
        if !showMode {
            cell.countryLabel.text = countries[indexPath.section][indexPath.row]
            cell.countryFlagImageView.image = UIImage(named: "\(countries[indexPath.section][indexPath.row]).png")
        }else{
            cell.countryLabel.text = countries[categoryNumber - 1][indexPath.row]
            cell.countryFlagImageView.image = UIImage(named: "\(countries[categoryNumber - 1][indexPath.row]).png")
        }
        
        
        return cell
    }
    
}

extension ViewController {
    func setupUI() {
        
        
        
        categoryView.frame.size.height = 50
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        
        categoryCollectionView.collectionViewLayout = layout
        
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        testTableView.dataSource = self
        testTableView.delegate = self
    }
    
    
    
}
