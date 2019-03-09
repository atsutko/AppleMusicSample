//
//  ViewController.swift
//  AppleMusicSample
//
//  Created by TakaoAtsushi on 2019/03/09.
//  Copyright © 2019 TakaoAtsushi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var array = ["あっちゃん", "りょう", "さとし"]
    
    @IBOutlet weak var appleMusicTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        appleMusicTableView.dataSource = self
        appleMusicTableView.delegate = self
        
        let cell = UINib(nibName: "AppleMusicTableViewCell", bundle: Bundle.main)
        appleMusicTableView.register(cell, forCellReuseIdentifier: "AppleMusicTableViewCell")
        
        //レイアウト調整
        appleMusicTableView.separatorStyle = .none
        appleMusicTableView.tableFooterView = UIView()
        
        appleMusicTableView.rowHeight = 250.0
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppleMusicTableViewCell") as! AppleMusicTableViewCell
        cell.categoryNameLabel.text = array[indexPath.row]
        cell.setCollectionViewDelegate(dataSource: self, delegate: self, forRow: indexPath.row)
        return cell
    }
    
    
}

extension ViewController:  UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return 5
        } else if collectionView.tag == 1 {
            return 2
        } else {
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppleMusicCollectionViewCell", for: indexPath) as! AppleMusicCollectionViewCell
        
        cell.musicImageView.image = UIImage(named: "写真_正方形.jpg")
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: collectionView.frame.size.width / 2 - 8 , height: collectionView.frame.size.width / 2 - 8)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.collectionViewLayout = layout
        
        return cell
    }
    
    
}

