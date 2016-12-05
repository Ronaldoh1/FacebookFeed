//
//  FeedController.swift
//  FacebookFeed
//
//  Created by Ronald Hernandez on 12/4/16.
//  Copyright © 2016 Ronaldoh1. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FeedController: UICollectionViewController , UICollectionViewDelegateFlowLayout{

    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let postMark = Post()
        postMark.name = "Mark Zuckerberg"
        postMark.statusText = "Meanwhile, beast turned to the dark side"
        postMark.profileImageName = "zuckprofile"
        
        let postSteve = Post()
        postSteve.name = "Steve Jobs"
        postSteve.statusText = "Another great thing about XCode is its amazing autocomplete functionality. This becomes really apparent in those old-style job interviews where they get you to code Objective-C on a whiteboard – my usual response is this method is something like this…. I rely on XCode autocomplete so much, I actually don’t know all the long iOS API method names by heart. However, I’ve noticed that in XCode 6 with Swift, autocomplete doesn’t work as smoothly in all cases. So I learned a new trick"
        postSteve.profileImageName = "steve_profile"
        
        posts.append(postMark)
        posts.append(postSteve)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
        
        self.collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        self.navigationItem.title = "Facebook Feed"
        
        // Register cell classes
        self.collectionView!.register(FeedCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // what collection to bounce ?
        collectionView?.alwaysBounceVertical = true
        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return posts.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FeedCell
       
        cell.post = posts[indexPath.item]
     
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let statusText = posts[indexPath.item].statusText {
            //calculate the height of the cell 
            let rect = NSString(string: statusText).boundingRect(with: CGSize.init(width: view.frame.width, height: 1000) , options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)], context: nil) // this gives us rough estimate of string height
            let knowHeight: CGFloat = 8 + 44 + 4 + 4 + 200 + 8 + 24 + 8 + 44
            
            return CGSize(width: view.frame.width, height: rect.height + knowHeight + 24)
        }
        
         return CGSize(width: view.frame.width, height: 500)
        
    }
   
    //make the controller aware of rotation 
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        collectionView?.collectionViewLayout.invalidateLayout()
    }
    
}
