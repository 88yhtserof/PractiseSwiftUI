//
//  ContentView.swift
//  Landmarks
//
//  Created by 임윤휘 on 2023/07/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
        // List에서의 star view와 Detail에서의 star view는 enviroment에서 같은 model 객체에 접근하고 있기 때문에 변경사항에 일관성되게 유지한다.
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // 모든 subview에서 ModelData 객체를 사용할 수 있게 한다.
        ContentView()
            .environmentObject(ModelData())
    }
}
