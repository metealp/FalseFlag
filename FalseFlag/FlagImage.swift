//
//  FlagImage.swift
//  FalseFlag
//
//  Created by Mete Alp Kizilcay on 17.10.2020.
//

import SwiftUI

struct FlagImage: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

//struct FlagImage_Previews: PreviewProvider {
//    static var previews: some View {
//        FlagImage()
//    }
//}
