//
//  ContentView.swift
//  Menu
//
//  Created by namnguyen on 11/03/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct Home:View {
    @State var with = UIScreen.main.bounds.width  - 90
    @State var x = -UIScreen.main.bounds.width  +  90
    var body: some View
    {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
            Color(.white)
            HomePage(x: $x)
            SplideMenu().shadow(color: Color.black.opacity(x == 0 ? 0.1 : 0 ), radius: 5, x: 5, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/ ).background(Color.black.opacity(x == 0 ? 0.5 : 0).ignoresSafeArea(.all,edges: .vertical)).offset(x:x)
        }.gesture(DragGesture().onChanged({(value) in
            withAnimation{
                if value.translation.width > 0 {
                    x = -with + value.translation.width
                }
                else{
                    x  = value.translation.width
                }
            }
        }).onEnded({(value) in
            withAnimation{
                if -x < with/4{
                    x = 0
                }
                else{
                    x = -with
                }
            }
        }))
    }
}
struct SplideMenu: View {
    var edes = UIApplication.shared.windows.first?.safeAreaInsets
    var body: some View
    {
        HStack(spacing:0)
        {
            VStack(alignment: .leading)
            {
                Image(systemName: "applelogo ").frame(width: 60, height: 60)
                    .clipShape(Circle())
                HStack(alignment: .top, spacing: 12)
                {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Menu").font(.title3).fontWeight(.bold).foregroundColor(.black)
                        Text("@@@ ").foregroundColor(.gray)
                        
                        HStack(spacing:20)
                         {
                            FollowView(count: 8, title: "Following").onTapGesture {
                                 
                            }
                            FollowView(count: 108, title: "Following").onTapGesture {
                                
                            }
                        }.padding(.top,10)
                        Divider().padding(.top,10)
                    }
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                        Image(systemName: "chevron.down")
                    }
                }
                VStack(alignment:  .leading ){
                    ScrollView{
                    ForEach(MenuButtons,id: \.self){
                        menu in
                        Button(action:{} ){
                            MenuBotton(title: menu)
                        }
                    }
                  
                        
                   
                    Divider().padding(.top)
                    Button(action:{} ){
                        MenuBotton(title: "Tiwtter Add")
                    }
                    Divider()
                    Button(action:{} ){
                        MenuBotton(title: "Setting")
                    }.padding(.top)
                    Button(action:{} ){
                        MenuBotton(title: "Help")
                    }.padding(.top,20)
                    Button(action:{} ){
                        MenuBotton(title: "Help")
                    }.padding(.top,20)
                    Button(action:{} ){
                        MenuBotton(title: "Help")
                    }.padding(.top,20)
                    Button(action:{} ){
                        MenuBotton(title: "Help")
                    }.padding(.top,20)
                    Button(action:{} ){
                        MenuBotton(title: "Help")
                    }.padding(.top,20)
                    }
                    
                }
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            }
            .padding(.horizontal,20)
            .padding(.bottom,edes!.bottom  == 0 ?5 : edes?.bottom  ).frame(width: UIScreen.main.bounds.width  - 90).background(Color(.systemGray3)).ignoresSafeArea(.all , edges: .vertical)
        }
        
    }
}
struct FollowView: View {
    var count:Int
    var title : String
    var body: some View
    {
        HStack{
                Text("\(count)").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundColor(.black)
                Text(title).foregroundColor(.gray )
        }
    }
}
var MenuButtons = ["Profile","List","Topics","Bookmarks","Moments","Profile","List","Topics","Bookmarks","Moments","Profile","List","Topics","Bookmarks","Moments"]
struct MenuBotton:View {
    var title:String
    var body: some View
    {
        HStack(spacing:15){
            Image(title).resizable().renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/).frame(width: 24, height: 24).foregroundColor(.gray)
            Text(title).foregroundColor(.black)
        Spacer(minLength: 0 )
        }.padding(.vertical,12 )
    }
}
struct HomePage:View {
    @Binding var x : CGFloat
    var body: some View
    {
        VStack{
            HStack {
                Button(action: {
                    withAnimation{
                        x = 0
                    }
                }){
                    Image(systemName: "list.dash").font(.system(size:  24)).foregroundColor(Color(.black ))
                }
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                Text("Menu").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundColor(.black)
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            }.padding().shadow(color: Color.black.opacity(0.1), radius: 5, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 5 )
            Spacer()
        }
        .contentShape(Rectangle())
    }
}
