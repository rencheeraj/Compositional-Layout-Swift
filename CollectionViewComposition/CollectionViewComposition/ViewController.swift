//
//  ViewController.swift
//  CollectionViewComposition
//
//  Created by Rencheeraj Mohan on 20/06/23.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDataSource{

    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: ViewController.createLayout()
    )
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(collectionView)
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
    }
    static func createLayout() -> UICollectionViewCompositionalLayout{
        // LeadingItemSize
        let leadingItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        // Item
        let leadingItem = NSCollectionLayoutItem(layoutSize: leadingItemSize)
        leadingItem.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        // Leading Group
        let leadingGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7), heightDimension: .fractionalHeight(0.8))
        let leadingGroup = NSCollectionLayoutGroup.vertical(layoutSize: leadingGroupSize, repeatingSubitem: leadingItem, count: 1)
        // Trailing item Size
        let trailingItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        // trailingItem
        let trailingItem = NSCollectionLayoutItem(layoutSize: trailingItemSize)
        trailingItem.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        // Trailing Group Size
        let trailingGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(0.4))
        // Trailing Group
        let trailingGroup = NSCollectionLayoutGroup.vertical(layoutSize: trailingGroupSize, repeatingSubitem: trailingItem, count: 2)
        
        // Main Group Size
        let mainGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.2))
        
        // Both Groups
        let mainGroup = NSCollectionLayoutGroup.horizontal(layoutSize: mainGroupSize, subitems: [leadingGroup, trailingGroup])
        
        // Section
        let section = NSCollectionLayoutSection(group: mainGroup)
        // Layer
        let layOut = UICollectionViewCompositionalLayout(section: section)
        return layOut
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
//        cell.backgroundColor = .red
        return cell
    }

}
