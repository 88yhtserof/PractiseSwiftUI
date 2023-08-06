//
//  LandmarkList.swift
//  Landmarks
//
//  Created by 임윤휘 on 2023/08/02.
//

import SwiftUI

struct LandmarkList: View {
    
    // EnviromentObject는 ObservableObject가 변경될 때마다 view를 무효화시킨다
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        // static과 dynamic view를 한 list에서 결합하거나 두 개 이상의 dynamic한 다른 그룹을 결합하기 위해서 List에 데이터를 전달하는 것 대신에 ForEach 타입을 사용하라
        
        NavigationView {
            List {
                // $ 접두어를 사용해 상태 변수에 대한 binding를 접근하라
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("LandMarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        // EnviromentObject로써 프로퍼티를 선언할 때 부모에 envieomentObject를 호출해줘야 해당 프로퍼티가 자동으로 업데이트된다.
        LandmarkList()
            .environmentObject(ModelData())
    }
}
