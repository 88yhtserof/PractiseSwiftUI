//
//   ModelData.swift
//  Landmarks
//
//  Created by 임윤휘 on 2023/07/31.
//

import Foundation
import Combine

// SwiftUI는 ObservableObject를 구독하여 데이터가 변경될 때 새로고침이 필요한 모든 뷰를 업데이트한다
final class ModelData: ObservableObject {
    // ObservableObject는 데이터에 대한 변경사항을 알려(publish) 구독자가 변경사항을 받을 수 있게 한다
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}

func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    guard let url = Bundle.main.url(forResource: fileName, withExtension: nil)
    else {
        fatalError("Couldn't find \(fileName) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: url)
    } catch {
        fatalError("Couldn't load \(fileName) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
    }
}
