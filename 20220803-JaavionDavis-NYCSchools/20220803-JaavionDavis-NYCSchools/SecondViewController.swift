//
//  SecondViewController.swift
//  20220803-JaavionDavis-NYCSchools
//
//  Created by Jaavion Davis on 8/3/22.
//

import UIKit

class SecondViewController: UIViewController {
    var name: String?
    var score: String?
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLbl.numberOfLines = 0
        nameLbl.text = name
        scoreLbl.text = score
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
