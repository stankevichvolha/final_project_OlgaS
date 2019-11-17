//
//  AvatarPickerVC.swift
//  Smack(10)
//
//  Created by Volha  Stankevich on 11/16/19.
//  Copyright © 2019 Volha  Stankevich. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    //Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var SegmentControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self

    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt cellForItemAtIndexPath: IndexPath)-> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: cellForItemAtIndexPath) as? AvatarCell
        {
            return cell
        }
        return AvatarCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }

    @IBAction func segmentControlChanged(_ sender: Any) {
    }
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
