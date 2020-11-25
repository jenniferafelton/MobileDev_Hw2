//
//  Summary1ViewController.swift
//  SimpleHTTPClient1
//
//  Created by ITLoaner on 11/17/20.
//  Copyright © 2020 ITLoaner. All rights reserved.
//

import UIKit

class Summary1ViewController : UITableViewController {


    @IBAction func toggleEditMode(_ sender : UIButton) {
        print("EDIT button was clicked")
        sender.setTitle("Done", for: .normal)
    }


}
