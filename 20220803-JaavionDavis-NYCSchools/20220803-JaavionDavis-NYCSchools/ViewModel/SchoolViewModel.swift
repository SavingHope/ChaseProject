//
//  SchoolViewModel.swift
//  20220803-JaavionDavis-NYCSchools
//
//  Created by Jaavion Davis on 8/3/22.
//

import Foundation
class SchoolViewModel {
    var vm: ViewController?
    var schoolInfoArray: [StudentSatModel]?
    let apiManager = ApiManager()
    func getData() {
        apiManager.getData(url: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json") { data in
            self.schoolInfoArray = data
            self.reloadTableData()
        }
        
    }
    func getCount() -> Int {
        return schoolInfoArray?.count ?? 0
    }
    func bindVM(vm: ViewController) {
        self.vm = vm
    }
    func reloadTableData() {
        print("hello")
        DispatchQueue.main.async {
            self.vm?.tblView.reloadData()
        }
    }
    func getSchoolName(index: Int)-> String  {
        return  self.schoolInfoArray?[index].school_name ?? "no data"
    }
    
    func getAverageSatScore(index:Int)-> String {
        return self.schoolInfoArray?[index].sat_math_avg_score ?? "no data"
    }
    
    
}
