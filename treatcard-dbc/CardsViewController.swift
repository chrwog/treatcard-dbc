//
//  FirstViewController.swift
//  treatcard-dbc
//
//  Created by Chris Wong on 4/2/16.
//  Copyright © 2016 treatcard. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    var category: Category?
    
    let identifier = "CardCellIdentifier"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let cardDataSource = CardDataSource()
    
    
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
            
            let card = cardDataSource.cardsInType(indexPath.section)[indexPath.row]
            
            let dvc = segue.destinationViewController as! PersonalizeViewController
            dvc.card = card
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

    extension CardsViewController : UICollectionViewDataSource {
        
        func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
            return cardDataSource.types.count
        }
        
        func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return cardDataSource.numbeOfRowsInEachGroup(section)
        }
        
        func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier,forIndexPath:indexPath) as! CardCell
            
            let cards: [Card] = cardDataSource.cardsInType(indexPath.section)
            let card = cards[indexPath.row]
            
            let templateID = card.templateID!
            
            
            navigationItem.title = category!.type?.capitalizedString
            cell.imageView.image = UIImage(named: templateID.lowercaseString)
//            cell.caption.text = templateID.capitalizedString
            
            return cell
        }
    
    }

