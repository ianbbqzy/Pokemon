//
//  ViewController.swift
//  Pokemon
//
//  Created by Ian Lee on 7/20/16.
//  Copyright © 2016 Ian Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DestinationViewDelegate {
    @IBOutlet var newFeed: UITableView!
    var handles : [String] = ["Ash", "Red"]
    var profilePics : [UIImage] = []
    var tweets : [String] = ["Gotta catch them allhgjkhghjkggkjggjkgjgjkggjkgjkgkghjkg", "fck u ash"]
    var myImages : [UIImage] = []
    
    var index = 1
    
    
    override func viewDidAppear(animated: Bool) {
        newFeed.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pp1 : UIImage = UIImage(named:"pp1.jpg")!
        let pp2 : UIImage = UIImage(named:"pp2.PNG")!
        let t1 : UIImage = UIImage(named:"t1.png")!
        let t2 : UIImage = UIImage(named:"t2.png")!
        
        profilePics.append(pp1)
        profilePics.append(pp2)
        myImages.append(t1)
        myImages.append(t2)
        
        newFeed.dataSource = self
        newFeed.delegate = self
        
        newFeed.rowHeight = UITableViewAutomaticDimension
        newFeed.estimatedRowHeight = 140

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return handles.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        index = indexPath.row
        print(indexPath.row)
        self.performSegueWithIdentifier("tabCellSegue", sender: indexPath);
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if (segue.identifier == "tabCellSegue") {
            var controller = segue.destinationViewController as! DestinationViewController
            
            var row = (sender as! NSIndexPath).row
            controller.LabelText = tweets[row]
            controller.index = row
            controller.delegate = self
            
        }
        
        
        
    }
    
    func setText(text: String, index: Int) {
        print(text)
        print(index)
        tweets[index] = text
    }
    
    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("postCell",
                                                               forIndexPath: indexPath) as! PostCell
        
        cell.handle.text = handles[indexPath.row]
        cell.profilePic.image = profilePics[indexPath.row]
        cell.tweet.text = tweets[indexPath.row]
        cell.myImage.image = myImages[indexPath.row]
        
        return cell
    }

}

