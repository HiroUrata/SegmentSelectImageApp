//
//  ViewController.swift
//  SegmentSelectImageApp
//
//  Created by UrataHiroki on 2021/07/27.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentedControlView: UIView!
    
    let segmentFile = SegmentFile()
    let alamofireModel = AlamofireModel()
    let collectionViewFlowLayout = UICollectionViewFlowLayout()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        segmentFile.createSegmentControl(targetView: segmentedControlView)
        
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        collectionView.collectionViewLayout = collectionViewFlowLayout
        
        segmentFile.uiSegmentetControl.addTarget(self, action: #selector(displayImage), for: .valueChanged)
    }

    @objc func displayImage(sender:UISegmentedControl){
        
        let senderArray = [0,1,2,3,4]
        
        senderArray.forEach({
            
            if $0 == sender.selectedSegmentIndex{
                
                alamofireModel.searchGetImageURL(searchKeyword: segmentFile.segmentContentsArray[sender.selectedSegmentIndex])
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    
                    self.collectionView.reloadData()
                    
                }
             
            }
            
        })
        
    }
    
}


extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return alamofireModel.jsonResultDatasArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        let cellImageView = cell.contentView.viewWithTag(1) as! UIImageView
        
        cellImageView.frame = CGRect(x: cell.bounds.minX, y: cell.bounds.minY, width: cell.frame.size.width, height: cell.frame.size.height)

        cellImageView.contentMode = .scaleAspectFill
     
        cellImageView.sd_setImage(with: URL(string: alamofireModel.jsonResultDatasArray[indexPath.row].imageURLData), completed: nil)
        
        return cell
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.frame.size.width / 4 - 10, height: collectionView.frame.size.width / 4 - 10)

    }
    
    
}
