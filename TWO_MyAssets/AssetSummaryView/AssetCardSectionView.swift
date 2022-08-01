//
//  AssetCardSectionView.swift
//  TWO_MyAssets
//
//  Created by 이윤수 on 2022/08/01.
//

import SwiftUI

struct AssetCardSectionView: View {
    @State private var seletedTab = 1
    @ObservedObject var asset : Asset
    
    var assetData : [AssetData]{
        return asset.data
    }
    
    var body: some View {
        VStack{
            AssetSectionHeaderView(title: asset.type.title)
            TapMenuView(tabs: ["지난 달 결제", "이번 달 결제", "다음 달 결제"], seletedTap: $seletedTab, updated: .constant(.nextMonth(amout: "100원")))
            TabView(selection: $seletedTab, content: {
                ForEach(0...2, id: \.self){ i in
                    VStack{
                        ForEach(assetData){ data in
                            HStack{
                                Text(data.title)
                                    .font(.title)
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text(data.creditCardAmounts![i].amount)
                                    .font(.title)
                                    .foregroundColor(.primary)
                            }
                            Divider()
                        }
                    }
                    .tag(i)
                }
            })
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .padding()
    }
}

struct AssetCardSectionView_Previews: PreviewProvider {
    static var previews: some View {
        let asset = AssetSummaryData().assets[5]
        AssetCardSectionView(asset: asset)
    }
}
