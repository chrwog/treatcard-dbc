//
//  FirstViewController.swift
//  treatcard-dbc
//
//  Created by Chris Wong on 4/2/16.
//  Copyright © 2016 treatcard. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    
    let identifier = "CategoryCellIdentifier"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let categoryDataSource = CategoryDataSource()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Not sure why use "dataSource" instead of "cardDataSource"
        
        collectionView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let indexPath = getIndexPathForSelectedCell() {
            
            let category = categoryDataSource.categoriesInType(indexPath.section)[indexPath.row]
            
            let dvc = segue.destinationViewController as! CardsViewController
            dvc.category = category
        }
        
    }
    
    // MARK:- Should Perform Segue
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        return !editing
    }
    
    // MARK:- Selected Cell IndexPath
    
    func getIndexPathForSelectedCell() -> NSIndexPath? {
        
        var indexPath:NSIndexPath?
        
        if collectionView.indexPathsForSelectedItems()!.count > 0 {
            indexPath = collectionView.indexPathsForSelectedItems()![0]
        }
        return indexPath
    }
    
    
}

extension CategoriesViewController : UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return categoryDataSource.types.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryDataSource.numbeOfRowsInEachGroup(section)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier,forIndexPath:indexPath) as! CategoryCell
        
        let categories: [Category] = categoryDataSource.categoriesInType(indexPath.section)
        let category = categories[indexPath.row]
        
        let templateID = category.templateID!
        
        cell.imageView.image = UIImage(named: templateID.lowercaseString)
        //            cell.caption.text = templateID.capitalizedString
        
        return cell
    }
    
}

