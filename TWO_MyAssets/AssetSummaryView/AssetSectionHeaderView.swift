//
//  AssetSectionHeaderView.swift
//  TWO_MyAssets
//
//  Created by 이윤수 on 2022/07/28.
//

import SwiftUI

struct AssetSectionHeaderView: View {
    let title : String
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.black)
                Divider()
                .frame(height: 2)
                .background(Color.primary)
                .foregroundColor(.accentColor)
        }
    }
}

struct AssetSectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AssetSectionHeaderView(title : "은행")
    }
}
