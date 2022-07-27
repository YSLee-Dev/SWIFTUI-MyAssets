//
//  BannerCard.swift
//  TWO_MyAssets
//
//  Created by 이윤수 on 2022/07/27.
//

import SwiftUI

struct BannerCard: View {
    var banner : AssetBanner
    
    var body: some View {
        ZStack{
            Color(banner.bgColor)
            VStack(spacing: 10){
                Text(banner.title)
                    .font(.title)
                Text(banner.description)
                    .font(.subheadline)
            }
        }
    }
}

struct BannerCard_Previews: PreviewProvider {
    static var previews: some View {
        BannerCard(banner: AssetBanner(title: "123", description: "test", bgColor: UIColor.red))
    }
}
