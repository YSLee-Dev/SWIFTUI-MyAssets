//
//  NavigationBarBtn.swift
//  TWO_MyAssets
//
//  Created by 이윤수 on 2022/07/25.
//

import SwiftUI

struct NavigationBarBtn: ViewModifier {
    var title : String = ""
    func body(content: Content) -> some View {
        return content
            .navigationBarItems(leading: Text(title)
                                    .font(.system(size: 24, weight: .bold))
                                    .padding()
                                , trailing: Button(
                                    action: {
                                        print("자산 추가 버튼 클릭")
                                    },
                                    label: {
                                        Image(systemName: "plus")
                                        Text("자산추가")
                                            .font(.system(size: 12))
                                    }
                                )
                                    .accentColor(.black)
                                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                                    .overlay{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black)
            }
            )
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                let ap = UINavigationBarAppearance()
                ap.configureWithOpaqueBackground()
                ap.backgroundColor = UIColor(white: 1, alpha: 0.5)
                UINavigationBar.appearance().standardAppearance = ap
                UINavigationBar.appearance().compactAppearance = ap
                UINavigationBar.appearance().scrollEdgeAppearance = ap
            }
    }
}

extension View{
    func navigationBarBtnStyle(_ title:String) -> some View{
        return self.modifier(NavigationBarBtn(title: title))
    }
}

struct NavigationBarBtn_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Color.gray.edgesIgnoringSafeArea(.all)
                .navigationBarBtnStyle("내 자산")
        }
    }
}
