//
//  PicturesViewModel.swift
//  Pictures
//
//  Created by Kedar Nagekar on 01/07/24.
//

import Foundation

class PicturesViewModel: ObservableObject {
    
    @Published var pictureDetails:[PictureModel] = []
    @Published var internetImageDetails:[Picture_API_Model] = []
    
    init() {
        print("PicturesViewModel_initialised")
        self.call_API()
//        DispatchQueue.global(qos: .background).asyncAfter(deadline: DispatchTime.now() + 3.0) {
//            DispatchQueue.main.async {
//                self.getStoredPictures()
//            }
//        }
    }
    
    func getStoredPictures() {
        let newPictureNames = ["Chichén_Itza", "Christ", "Colosseum", "Hampi", "Machu_Picchu", "Petra", "Pyramid", "TajMahal", "Wall_of_China"]
        for pictureName in newPictureNames {
            let pictureModel = PictureModel(imageName: pictureName)
            self.pictureDetails.append(pictureModel)
        }
        print("gotStoredPictures")
    }
    
    func call_API() {
        print("PageIndex = \(API_Constants.shared.pageIndex)")
        DispatchQueue.global(qos: .background).async {
            API_Manager().getImagesDataFromInternet { isSuccess, apiData in
                if isSuccess {
                    DispatchQueue.main.async {
                        self.internetImageDetails.append(contentsOf: apiData ?? [])
                    }
                }
            }
        }
    }
}
