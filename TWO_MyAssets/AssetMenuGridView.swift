//
//  AssetMenuGridView.swift
//  TWO_MyAssets
//
//  Created by 이윤수 on 2022/07/26.
//

import SwiftUI

struct AssetMenuGridView: View {
    let menuList : [[AssetMenu]] = [
        [.creditCard, .bankAccount, .insurance, .loan],
        [.insurance, .creditCard, .cash, .realEstate]
    ]
    var body: some View {
        VStack(spacing: 20){
            ForEach(menuList, id: \.self){ row in
                HStack(spacing:10){
                    ForEach(row){ menu in
                        Button(""){
                            print("\(menu.title)버튼 클릭됨")
                        }
                        .buttonStyle(AssetMenuBtnStyle(menu: menu))
                    }
                }
            }
        }
    }
}

struct AssetMenuGridView_Previews: PreviewProvider {
    static var previews: some View {
        AssetMenuGridView()
    }
}
