//
//  FirstViewController.swift
//  treatcard-dbc
//
//  Created by Chris Wong on 4/2/16.
//  Copyright © 2016 treatcard. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let cardDataSource = CardDataSource()
    
//    @IBOutlet weak var myScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        // Do any additional setup after loading the view, typically from a nib.
        
//        let myImages=["1.jpg", "2.jpg", "3.jpg", "1.jpg", "2.jpg", "3.jpg", "1.jpg", "2.jpg", "3.jpg", "1.jpg", "2.jpg", "3.jpg"]
//
//        let imageWidth:CGFloat = 275
//        let imageHeight:CGFloat = 147
//        var yPosition:CGFloat = 0
//        var scrollViewContentSize:CGFloat = 0;
//        
//        for index in 0 ..< myImages.count
//        {
//            let myImage:UIImage=UIImage(named: myImages[index])!
//            let myImageView:UIImageView = UIImageView()
//            myImageView.image = myImage
//            
//            myImageView.frame.size.width = imageWidth
//            myImageView.frame.size.height = imageHeight
//            myImageView.frame.origin.x = 10
//            myImageView.center = self.view.center
//            myImageView.frame.origin.y = yPosition
//            
//            myScrollView.addSubview(myImageView)
//            
//            let spacer:CGFloat = 20
//            
//            yPosition+=imageHeight + spacer
//            scrollViewContentSize+=imageHeight + spacer
//            
//            myScrollView.contentSize = CGSize(width: imageWidth, height: scrollViewContentSize)
//            
//            
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
//        let myImages=["1.jpg", "2.jpg", "3.jpg", "1.jpg", "2.jpg", "3.jpg", "1.jpg", "2.jpg", "3.jpg", "1.jpg", "2.jpg", "3.jpg"]
//        let myImage:UIImage=UIImage(named: myImages[0])!
//        
//        if segue.identifier == "Personalize" {
//            let dvc = segue.destinationViewController as! PersonalizeViewController
//            dvc.newImage = myImage
        
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
            return cardDataSource.cards.count
        }
        
        func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return cardDataSource.numbeOfRowsInEachGroup(section)
        }
        
        func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CellIdentifier",forIndexPath:indexPath) as! CardCell
            
            let cards: [Card] = cardDataSource.cardsInType(indexPath.section)
            let card = cards[indexPath.row]
            
            let templateID = card.templateID!
            
            cell.imageView.image = UIImage(named: templateID.lowercaseString)
//            cell.caption.text = templateID.capitalizedString
            
            return cell
        }
    
    }

