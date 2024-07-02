//
//  PicturesView.swift
//  Pictures
//
//  Created by Kedar Nagekar on 01/07/24.
//

import SwiftUI

struct PicturesView: View {
    @ObservedObject var viewModel:PicturesViewModel = PicturesViewModel()
    var body: some View {
       // ScrollView {
        List (viewModel.internetImageDetails) { picture in
            //Image(picture.imageName).resizable().frame(maxWidth: .infinity, maxHeight: 200)
            let image_URL = URL(string: picture.download_url)
            //AsyncImage(url: image_URL).frame(maxWidth: .infinity, maxHeight: 200)
            /*AsyncImage(url: image_URL) { result in
                result.image?.resizable().scaledToFit()
            }.frame(maxWidth: .infinity, maxHeight: 200) */
           // ZStack {
            /*VStack {
                TabView {
                    ZStack {
                        AsyncImage(url: image_URL) { resultImage in
                            resultImage.resizable().aspectRatio(contentMode: .fill)
                        } placeholder: {
                            ProgressView().progressViewStyle(.circular)
                        }.frame(alignment: .center)//.frame(width: .infinity, height: 400)
                    }
                }.frame(width: UIScreen.main.bounds.width, height: 400)
            }*/
            
           // }
        }.padding(EdgeInsets(top: 0, leading: -20, bottom: 0, trailing: -20))
       // }
        /*ForEach(viewModel.internetImageDetails) { picture in
            let image_URL = URL(string: picture.download_url)
            AsyncImage(url: image_URL) { result in
                result.image?.resizable().scaledToFit()
            }.frame(maxWidth: .infinity, maxHeight: 200)
        } */
    }
}

#Preview {
    PicturesView()
}
