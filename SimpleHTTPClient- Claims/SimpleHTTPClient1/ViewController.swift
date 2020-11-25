//
//  ViewController.swift
//  SimpleHTTPClient1
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let pService = ClaimService()
//         Testing getAll() method
        pService.getAll()
        let pList = pService.ClaimList
        
        // Testing addPerson() method
        pService.addClaim(pObj: Claim(this_title: "First Title", this_date: "2020-10-24"))
        pService.addClaim(pObj: Claim(this_title: "Second Title", this_date: "2020-10-24"))
        pService.addClaim(pObj: Claim(this_title: "Third Title", this_date: "2020-10-24"))
        
        print(pList)
    }


}

