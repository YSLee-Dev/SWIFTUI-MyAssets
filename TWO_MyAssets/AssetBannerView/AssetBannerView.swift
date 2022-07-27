//
//  AssetBannerView.swift
//  TWO_MyAssets
//
//  Created by 이윤수 on 2022/07/27.
//

import SwiftUI

struct AssetBannerView: View {
    let bannerList : [AssetBanner] = [
        AssetBanner(title: "공지사항", description: "추가된 공지를 확인하세요.", bgColor: .red),
        AssetBanner(title: "이벤트", description: "추가된 이벤트를 확인하세요.", bgColor: .blue),
        AssetBanner(title: "오류공지", description: "현재 오류가 발생한 항목을 확인하세요.", bgColor: .yellow),
        AssetBanner(title: "프로모션", description: "현재 진행 중인 프로모션을 살펴보세요", bgColor: .purple)
    ]
    
    @State private var currentPage = 0
    
    var body: some View {
        let cards = bannerList.map{
            BannerCard(banner: $0)
        }
        ZStack(alignment: .bottomTrailing){
            PageVC(pages: cards, currentPage: $currentPage)
            PageControl(numberOfPages: bannerList.count, currentPage: $currentPage)
                .frame(width: CGFloat(cards.count * 18))
                .padding(.trailing)
        }
    }
}

struct AssetBannerView_Previews: PreviewProvider {
    static var previews: some View {
        AssetBannerView()
            .aspectRatio(5/2, contentMode: .fit)
    }
}
