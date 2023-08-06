//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 임윤휘 on 2023/07/31.
//

import SwiftUI

@main
struct LandmarksApp: App {
    
    // 앱을 실행할 때 enviroment에 모델 객체를 배치하도록 앱 인스턴스를 업데이트한다
    // StateObject를 앱 생명주기동안 단 한 번만 해당 model에 대해 프로퍼티를 초기화하기 위해 사용하라(단일 소스)
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
