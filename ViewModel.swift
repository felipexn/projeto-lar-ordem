
//
//  ViewModel.swift
//  APISendData
//
//  Created by edilsonalmeida on 27/04/23.
//

import Foundation




class ViewModel : ObservableObject{
    
    @Published var contas : [Conta] = []
    
    func fetch(){
        guard let url = URL(string: "http://192.168.128.45:1880/lerrr")else {return}
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{return}
            
            do {
                let parsed = try JSONDecoder().decode([Conta].self, from: data)
                
                DispatchQueue.main.async {
                    self?.contas = parsed
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
    
    func remove(at offsets: IndexSet){
        
        var item : Conta?
        
        for index in offsets {
            print("Deleted item at index \(index)")
            item = contas[index]
        }
        guard let url = URL(string: "http://192.168.128.45:1880/deleteConta") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        do {
            let data = try JSONEncoder().encode(item)
            
            print(item)
            
            request.httpBody = data
        } catch {
            print("Error encoding to JSON: \(error.localizedDescription)")
        }
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error deleting resource: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Error deleting resource: invalid response")
                return
            }
            
            if httpResponse.statusCode == 200 {
                print("Resource deleted successfully")
            } else {
                print("Error deleting resource: status code \(httpResponse.statusCode)")
            }
        }
        
        task.resume()
        
        contas.remove(atOffsets: offsets)
        
    }
    
    
    func post(_ obj : Conta){
        
        
        guard let url = URL(string: "http://192.168.128.45:1880/newConta") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Headers must specify that the HTTP request body is JSON-encoded
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        
        let encoder = JSONEncoder()
        
        do {
            let jsonData = try encoder.encode(obj)
            request.httpBody = jsonData
            print("jsonData: ", String(data: request.httpBody!, encoding: .utf8) ?? "no body data")
        } catch {
            print("Error encoding to JSON: \(error.localizedDescription)")
        }
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error to send resource: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Error to send resource: invalid response")
                return
            }
            
            if httpResponse.statusCode == 200 {
                print("Resource POST successfully")
            } else {
                print("Error POST resource: status code \(httpResponse.statusCode)")
            }
        }
        
        task.resume()
        
    }
    
    
    func update(_ obj : Conta){
        
        
        guard let url = URL(string: "http://192.168.128.45:1880/updateConta") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        // Headers must specify that the HTTP request body is JSON-encoded
        var headers = request.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        request.allHTTPHeaderFields = headers
        
        let encoder = JSONEncoder()
        
        do {
            let jsonData = try encoder.encode(obj)
            request.httpBody = jsonData
            print("jsonData: ", String(data: request.httpBody!, encoding: .utf8) ?? "no body data")
        } catch {
            print("Error encoding to JSON: \(error.localizedDescription)")
        }
        
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error to send resource: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Error to send resource: invalid response")
                return
            }
            
            if httpResponse.statusCode == 200 {
                print("Resource POST successfully")
            } else {
                print("Error POST resource: status code \(httpResponse.statusCode)")
            }
        }
        
        task.resume()
        
    }
    
    
}


