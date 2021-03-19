//
//  OddEvenViewController.swift
//  Error&Section
//
//  Created by Tatia on 19.03.21.
//

import UIKit

class OddEvenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var evenArray = Array<Int>()
    var oddArray = Array<Int>()
    var sectionName = ["ლუწი", "კენტი"]
    
    var sumArray = Array<Array<Int>>()
    
    
    func generateNumbers() {
        repeat {
            let number = Int.random(in: 1...50)
            if number % 2 == 0 {
                evenArray.append(number)
            }
        } while evenArray.count != 15
        
        repeat {
            let number = Int.random(in: 20...80)
            if number % 2 != 0 {
                oddArray.append(number)
            }
        } while oddArray.count != 23
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateNumbers()
        sumArray = [evenArray, oddArray]
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sumArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sumArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "numberCell", for: indexPath) as! numberCell
        let currentElement = sumArray[indexPath.section][indexPath.row]
        cell.numberLbl.text = "\(currentElement)"
        if indexPath.section == 0 {
            cell.backgroundColor = UIColor.blue
        } else {
            cell.backgroundColor = UIColor.red
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("headerView", owner: nil, options: nil)![0] as! headerView
        headerView.sectionLbl.text = sectionName[section]
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 30
        }
        else {
            return 40
        }
    }

}
