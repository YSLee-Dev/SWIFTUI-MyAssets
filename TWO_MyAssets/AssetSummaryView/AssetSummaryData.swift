//
//  AssetSummaryData.swift
//  TWO_MyAssets
//
//  Created by 이윤수 on 2022/07/28.
//

import SwiftUI

class AssetSummaryData: ObservableObject {
    @Published var assets : [Asset] = load("assets.json")//내보내는 데이터
}

func load<T: Decodable>(_ filename:String) -> T{
    let data : Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {fatalError("파일을 찾을 수 없음")}
    
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("데이터를 가지고 올 수 없음")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("디코딩 중 오류가 발생")
    }
}
