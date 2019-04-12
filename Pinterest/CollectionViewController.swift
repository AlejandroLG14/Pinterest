//
//  CollectionViewController.swift
//  Pinterest
//
//  Created by Alejandro Loza on 4/11/19.
//  Copyright © 2019 Alejandro Loza. All rights reserved.
//

import UIKit

private let sectionInsets = UIEdgeInsets(top: 50.0,
                                         left: 20.0,
                                         bottom: 50.0,
                                         right: 20.0)
var collectionView: UICollectionView?
var screenSize: CGRect!
var screenWidth: CGFloat!
var screenHeight: CGFloat!

class CollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        self.title = "Bienvenido a Pinterest"
      
        collectionView?.register(PinCell.self, forCellWithReuseIdentifier: "Pin")
        
    }
   /* func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenWidth/2, height: screenWidth/2);
    } */
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Pin", for: indexPath) as! PinCell
        return cell
    }
}

class PinCell : UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    let imageView1 : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named:"LogoPin.png")
        return img
    }()
    func setupViews(){
        self.addSubview(imageView1)
       // self.backgroundColor = .white
        imageView1.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView1.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView1.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 4/5).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
