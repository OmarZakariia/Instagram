//
//  ExlporeViewController.swift
//  Instagram
//
//  Created by Omar Zakaria on /253/21.
//

import UIKit

class ExlporeViewController: UIViewController {

    //MARK:- Variables and Constants
    // Search bar
   private let searchBar: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.backgroundColor = .secondarySystemBackground
    return searchBar
    }()
    
    private var collectionView: UICollectionView?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.topItem?.titleView = searchBar
         
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        guard let collectionView = collectionView else {
            return
        }
        view.addSubview(collectionView)
    }
}

//MARK:- CollectionView Delegate and DataSource
extension ExlporeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    
}
