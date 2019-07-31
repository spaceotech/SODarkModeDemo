//
//  ViewController.swift
//  darkModeDemo
//
//  Created by SOTSYS027 on 16/07/19.
//  Copyright © 2019 SOTSYS027. All rights reserved.
//

import UIKit

struct Employee {
    var employeeName : String?
    var employeeID : Int?
    
    init(empName : String, empID : Int) {
        self.employeeName = empName
        self.employeeID = empID
    }
}

class ViewController: UIViewController {

    var arrEmployee = [Employee]()
    
    @IBOutlet weak var lblDarkMode: UILabel!
    @IBOutlet weak var tblEmployeeDetails : UITableView!
    @IBOutlet weak var swDarkMode : UISwitch!
    @IBOutlet weak var lblTableHeader : UILabel!
    @IBOutlet weak var btnDarkImage : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // appending employee details to employee array to bind with table view
        arrEmployee.append(Employee(empName: "John", empID: 101))
        arrEmployee.append(Employee(empName: "Mable", empID: 102))
        arrEmployee.append(Employee(empName: "Korney", empID: 103))
        arrEmployee.append(Employee(empName: "Lilas", empID: 104))
        arrEmployee.append(Employee(empName: "Rycca", empID: 105))
        arrEmployee.append(Employee(empName: "Gasper", empID: 106))
        
        
        // setting employee table data source
        tblEmployeeDetails.dataSource = self
        
        // setting up default behaviour of ui controls
        swDarkMode.isOn = false
        btnDarkImage.backgroundColor = UIColor(named: "btnColor")
        btnDarkImage.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    // switch action to override color them for light and dark mode, you can define color set for each theme
    @IBAction func swDarkMode(_ sender: UISwitch) {
        if sender.isOn {
            lblDarkMode.textColor = UIColor(named: "colorDemo")
            lblTableHeader.textColor = UIColor(named: "colorDemo")
        }
        else {
            lblDarkMode.textColor = .red
            lblTableHeader.textColor = .red
        }
    }
}

// amitm.spaceo@gmail.com

extension ViewController : UITableViewDataSource {
    
    //the method returning size of the list
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrEmployee.count
    }
    
    
    //the method returning each cell of the list
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! employeeTableViewCell
        let employee = arrEmployee[indexPath.row]
        cell.lblEmployeeName.text = "Emp Name : \(employee.employeeName ?? "NA")"
        cell.lblEmployeeCode.text = "Emp Code : \(employee.employeeID ?? 000)"
        return cell
    }
}

// Custom table view class for employee details

class employeeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblEmployeeName : UILabel!
    @IBOutlet weak var lblEmployeeCode : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

/*
 add tableview to view controller
 create employee struct
 bind employee data to tableview
 
 bind switch event to override system dark mode to custom color theme
 
 uilable doesn't adopt dark mode automatically
 define color set for light and dark theme by assigning different color code
 
 */
