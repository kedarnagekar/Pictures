//
//  API_Manager.swift
//  Pictures
//
//  Created by Kedar Nagekar on 01/07/24.
//

import Foundation


struct API_Manager {
    public typealias ImageCompletionData = (Bool, [Picture_API_Model]?) -> Void
    
    func getImagesDataFromInternet(completion: @escaping ImageCompletionData) {
        guard let images_API_URL = URL(string: "https://picsum.photos/v2/list?page=\(API_Constants.shared.pageIndex)&limit=20") else { return }
        var urlReq = URLRequest(url: images_API_URL)
        urlReq.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: urlReq) { data, response, error in
            print("response = \(response)")
            print("error = \(error)")
            print("data = \(data)")
            guard error == nil else {
                completion(false, nil)
                return
            }
            guard data != nil else {
                completion(false, nil)
                return
            }
            do {
                let receivedData = try JSONDecoder().decode([Picture_API_Model].self, from: data!)
                print("receivedData_count = \(receivedData.count)")
                for imageURLIndex in 0..<receivedData.count {
                    let imageURL = receivedData[imageURLIndex].download_url
                    print("\(imageURLIndex + 1) download_url = \(imageURL)")
                }
                completion(true, receivedData)
            } catch {
                print("Failed to retrieve data")
            }
        }.resume()
    }
}
