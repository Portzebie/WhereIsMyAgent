//
//  ViewController.swift
//  Table View Buttons
//
//  Created by PJ Vea on 4/15/15.
//  Copyright (c) 2015 Vea Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var objects: NSMutableArray! = NSMutableArray()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.objects.add("Amogh Huilgol")
        self.objects.add("Adeel Raja")
        self.objects.add("Hemanth Shetty")
        self.objects.add("Abhiram Hosmane")
        self.objects.add("Mohit Gupta")
        self.objects.add("John Doe")
        self.objects.add("Mark Richards")
        self.objects.add("Nick Stevenson")
        self.objects.add("John B")
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table View Delegate
    
    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.titleLabel.text = self.objects.object(at: (indexPath as NSIndexPath).row) as? String
        
        cell.logButton.tag = (indexPath as NSIndexPath).row;
        cell.logButton.addTarget(self, action: #selector(ViewController.logAction(_:)), for: .touchUpInside)
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath)
    {
        self.performSegue(withIdentifier: "showView", sender: self)
        
    }
    
    @IBAction func logAction(_ sender: UIButton) {
        
        let titleString = self.objects[sender.tag] as? String
        
        let firstActivityItem = "\(titleString!)"
        
        let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: [firstActivityItem], applicationActivities: nil)
        
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if (segue.identifier == "showView")
        {
            let upcoming: NewViewController = segue.destination as! NewViewController
            
            let indexPath = self.tableView.indexPathForSelectedRow!
            
            let titleString = self.objects.object(at: indexPath.row) as? String
            
            upcoming.titleString = titleString
            
            self.tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }

}

