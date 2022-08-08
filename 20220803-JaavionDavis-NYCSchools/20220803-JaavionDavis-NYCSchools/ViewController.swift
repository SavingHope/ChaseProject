//
//  ViewController.swift
//  20220803-JaavionDavis-NYCSchools
//
//  Created by Jaavion Davis on 8/3/22.
//

import UIKit

class ViewController: UIViewController {
    var schoolVm = SchoolViewModel()
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.schoolVm.bindVM(vm: self)
        self.tblView.delegate = self
        self.tblView.dataSource = self
        self.tblView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        schoolVm.getData()
        
    }

    
}



extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return schoolVm.getCount()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
        cell.schoolNameLbl.text = schoolVm.getSchoolName(index: indexPath.row)
        cell.testScoreLbl.text = schoolVm.getAverageSatScore(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(70)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.tblView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
        cell.frame.size.width = CGFloat(340)
        cell.schoolNameLbl.text = schoolVm.getSchoolName(index: indexPath.row)
        cell.testScoreLbl.text = schoolVm.getAverageSatScore(index: indexPath.row)
        let displayVC : SecondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SeondViewController") as! SecondViewController

        displayVC.name = (schoolVm.getSchoolName(index: indexPath.row))
        displayVC.score = "Math Score: \(schoolVm.getAverageSatScore(index: indexPath.row))"
        self.present(displayVC, animated: false)
    }
}

