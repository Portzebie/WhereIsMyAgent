//
//  NewViewController.swift
//  Table View Buttons
//
//  Created by PJ Vea on 4/15/15.
//  Copyright (c) 2015 Vea Software. All rights reserved.
//

import UIKit
import MessageUI

class NewViewController: UIViewController,MFMailComposeViewControllerDelegate
{

    @IBOutlet weak var titleLabel: UILabel!
    
    var titleString: String!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.titleLabel.text = self.titleString
        
    }

    @IBAction func onClick(_ sender: AnyObject) {
        
               
        let alertController = UIAlertController(title: "Message Sent", message:
            "Message has been sent to customer ", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
