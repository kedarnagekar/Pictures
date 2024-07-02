//
//  Models.swift
//  Pictures
//
//  Created by Kedar Nagekar on 01/07/24.
//

import Foundation


struct PictureModel:Identifiable, Hashable {
    var imageName:String
    var id = UUID()
}

/*
 {
      "id": "9",
      "author": "Alejandro Escamilla",
      "width": 5000,
      "height": 3269,
      "url": "https://unsplash.com/photos/ABDTiLqDhJA",
      "download_url": "https://picsum.photos/id/9/5000/3269"
  }
 */


struct Picture_API_Model: Codable, Identifiable, Hashable {
    var id:String
    var author:String
    var width:Int
    var height:Int
    var url:String
    var download_url:String
}
