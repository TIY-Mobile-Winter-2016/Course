//
//  OneViewController.swift
//  NavigationApp
//
//  Created by Phil Wright on 2/19/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class OneViewController: UIViewController {
    
    var currentRestaurant: Restaurant?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        print(currentRestaurant?.name)
    }
    
    @IBAction func goButtonTapped(sender: UIButton) {
        self.performSegueWithIdentifier("showTwoController", sender: currentRestaurant)
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        print("prepareForSegue called: \(segue.identifier)")
        
        if segue.identifier == "showTwoController" {
            let destinationController = segue.destinationViewController as? TwoViewController
            
            if let restaurant = sender as? Restaurant {
                destinationController?.currentRestaurant = restaurant
            }
            
        }
        
    }


}
