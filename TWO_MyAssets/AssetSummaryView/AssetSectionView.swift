//
//  AssetSectionView.swift
//  TWO_MyAssets
//
//  Created by 이윤수 on 2022/07/28.
//

import SwiftUI

struct AssetSectionView: View {
    @ObservedObject var assetSection : Asset
    var body: some View {
        VStack(spacing: 20){
            AssetSectionHeaderView(title: assetSection.type.title)
            ForEach(assetSection.data){ asset in
                HStack{
                    Text(asset.title)
                        .font(.title)
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(asset.amount)
                        .font(.title2)
                        .foregroundColor(.primary)
                }
                Divider()
            }
        }
        .padding()
    }
}

struct AssetSectionView_Previews: PreviewProvider {
    static var previews: some View {
        let asset = Asset(id: 0, type: .bankAccount, data: [
            AssetData(id: 0, title: "0", amount: "0"),
            AssetData(id: 1, title: "1", amount: "1")
        ])
        AssetSectionView(assetSection: asset)
    }
}
