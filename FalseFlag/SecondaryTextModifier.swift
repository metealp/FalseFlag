//
//  SecondaryTextModifier.swift
//  FalseFlag
//
//  Created by Mete Alp Kizilcay on 17.10.2020.
//

import SwiftUI

//struct SecondaryTextModifier: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .foregroundColor(.white)
//            .font(.title3)
//            .bolder()
////            .fontWeight(.bold)
//    }
//}

extension Text {
    func bolder() -> Text {
        self
            .fontWeight(.black)
            .foregroundColor(.white)
            .font(.title3)
    }
}

//extension View {
//    func title3() -> some View {
//        self.modifier(SecondaryTextModifier())
//    }
//}
