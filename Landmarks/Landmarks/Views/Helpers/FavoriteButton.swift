//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by 임윤휘 on 2023/08/06.
//

import SwiftUI

struct FavoriteButton: View {
    // Binding 객체인 해당 프로퍼티는 부모 뷰에 State 객체 프로퍼티에 ProjectedValue를 통해 변경사항을 전달시킨다
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Togle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }

    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
