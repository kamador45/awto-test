//
//  ViewModel.swift
//  TextAwto
//
//  Created by Kevin Amador Rios on 11/11/22.
//

import Foundation

class ViewModel {
    
    //Refresh data
    var refreshData = {() -> () in }
    
    //Init array
    var dataArray:JokesModel? {
        didSet {
            refreshData()
        }
    }
    
    //Request to APIS
    func fetchDataFromApis() -> Void {
        
        //Using URLSession
        let session = URLSession.shared
        let queue = DispatchQueue(label: "serial")
        guard let url = URL(string: "https://v2.jokeapi.dev/joke/Any") else {return}
        
        //Using GCD
        DispatchQueue.concurrentPerform(iterations: 1) { exec in
            queue.async {
                session.dataTask(with: url) { data, response, error in
                    
                    guard let data = data else { return }
                    if let err = error {
                        print(err.localizedDescription)
                    } else {
                        //Serialization process
                        do {
                            //Deserialization process
                            let json = try JSONDecoder().decode(JokesModel.self, from: data)
                            self.dataArray = json
                            print(json)
                        } catch let err {
                            print(err)
                        }
                    }
                    
                }.resume()
            }
        }
    }
}
