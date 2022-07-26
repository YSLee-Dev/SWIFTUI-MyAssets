//
//  AssetView.swift
//  TWO_MyAssets
//
//  Created by 이윤수 on 2022/07/26.
//

import SwiftUI

struct AssetView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing: 30){
                    Spacer()
                    AssetMenuGridView()
                }
            }
            .background(Color.gray.opacity(0.2))
            .navigationBarBtnStyle("내 자산")
        }
    }
}

struct AssetView_Previews: PreviewProvider {
    static var previews: some View {
        AssetView()
    }
}
