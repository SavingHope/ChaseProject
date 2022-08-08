//
//  Apimanager.swift
//  20220803-JaavionDavis-NYCSchools
//
//  Created by Jaavion Davis on 8/3/22.
//

import Foundation


class ApiManager {
    func getData(url: String, completionHandler: @escaping ([StudentSatModel])-> Void) {
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            do {
            guard let jsonData = data else {return }
                guard let model: [StudentSatModel] = try? JSONDecoder().decode([StudentSatModel].self, from: jsonData) else {
                    fatalError("model not decoded properly")
                    return
                }
                completionHandler(model)
            }
            catch {
                fatalError("\(error)")
            }
        }.resume()
    }
}
