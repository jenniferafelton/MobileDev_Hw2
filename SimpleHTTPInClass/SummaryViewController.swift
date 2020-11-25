//
//  SummaryViewController.swift
//  SimpleHTTPClient1
//
//  Created by ITLoaner on 11/10/20.
//  Copyright © 2020 ITLoaner. All rights reserved.
//

import UIKit

class SummaryViewController : ViewController {
    var tblView : UITableView!
    //var pService : PersonService!

    func refreshScreen1() {
        //
        tblView.reloadData()
        // tblView.isEditing = true
    }

    @objc func toggleEditMode(_ sender : UIButton) {
        print("EDIT button was clicked")
        if tblView.isEditing == false {
            tblView.isEditing = true
            sender.setTitle("Done", for: .normal)
        } else {
            tblView.isEditing = false
            sender.setTitle("Edit", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        // 1. Create UITableView object
        tblView = UITableView()
        view.addSubview(tblView)
        
        // Set Auto Layout constraints
        tblView.translatesAutoresizingMaskIntoConstraints = false
        let constr = tblView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let constr1 = tblView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let constr2 = tblView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        let constr3 = tblView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        constr.isActive = true
        constr1.isActive = true
        constr2.isActive = true
        constr3.isActive = true

        //2. register the cell
        tblView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //3. Set the delegate object
        tblView.dataSource = self
        tblView.delegate = self
        
        // get Data
        pService = PersonService.getInstance(vc: self)
        pService.getAll()
    }
    
}

extension SummaryViewController : UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let frame = tableView.frame
        // Create the table header
        let hdrView = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 100))
        hdrView.backgroundColor = UIColor.yellow
        // Add an Edit button to the header
        let edtBtn = UIButton()
        edtBtn.setTitle("EDIT", for: .normal)
        edtBtn.backgroundColor = UIColor.green
        //hdrView.isUserInteractionEnabled = false
        edtBtn.addTarget(self, action: #selector(toggleEditMode(_:)), for: .touchUpInside)
        hdrView.addSubview(edtBtn)
        edtBtn.translatesAutoresizingMaskIntoConstraints = false
        let elConst = edtBtn.leadingAnchor.constraint(equalTo: hdrView.leadingAnchor, constant: 20)
        let ecConst = edtBtn.centerYAnchor.constraint(equalTo: hdrView.centerYAnchor)
        elConst.isActive = true
        ecConst.isActive = true
        return hdrView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pService.personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = (pService.personList[indexPath.row]).firstName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
        print("User click \(indexPath.row) table entry. ")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let navController = appDelegate.window?.rootViewController as! UINavigationController
        //let detailVC = DetailViewController()
        //let pObj = pService.personList[indexPath.row]
        let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailedVC") as! DetailViewController
        detailVC.currentPersonIndx = indexPath.row
        navController.pushViewController(detailVC, animated: true)
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Delete entry \(indexPath.row)")
            // Invoke a deletePerson method of PersonService
            
        } else {
            print("Editing style : \(editingStyle)")
        }
    }
}
