//
//  ContentView.swift
//  Chat
//
//  Created by Andrew Ushakov on 9/3/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    @State private var index = 0
    var body: some View {
        ZStack {
            VStack {
                Color.white
                Color("Color2")
            }
            VStack{

                ZStack {
                    Chats().opacity(self.index == 0 ? 1 : 0)
                    
                    Groups().opacity(self.index == 1 ? 1 : 0)
                    
                    Settings().opacity(self.index == 2 ? 1 : 0)
                }
               
                BottomView(index: self.$index)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct TopView: View {
    @State private var search = ""
    var body: some View {
        VStack(spacing: 18) {
            HStack {
                Text("Messages")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(Color.black.opacity(0.7))
                   
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Image("menu")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .opacity(0.4)
                        
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 18) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color("Color1"))
                            .padding(23)
                    }.background(Color("Color1").opacity(0.4))
                    .clipShape(Circle())
                    
                    ForEach(1...6, id: \.self) { i in
                        
                        NavigationLink(destination: Text("Hello")) {
                            Image("p\(i)")
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                               
                        }
                    }
                }
            }
            
            HStack(spacing: 15) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color.black.opacity(0.3))
                
                TextField("Search", text: self.$search)
            }.padding()
                .background(Color.white)
                .cornerRadius(9)
                .padding(.bottom, 10)
                .clipShape(shape() )
            
        }.padding()
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color("Color"))
            .clipShape(shape())
    }
}

struct CenterView: View {
    var body: some View {
        List(data) { i in
            CellView(data: i)
        }.listStyle(.inset)
            .padding(.top, 24)
            .background(Color.white)
            .clipShape(shape())
    }
}

struct BottomView: View {
    @Binding var index: Int
    var body: some View {
        HStack {
            Button(action: {
                self.index = 0
            }) {
                Image(systemName: "message.fill")
                    .resizable()
                    .frame(width: 29, height: 29)
                    .foregroundColor(self.index == 0 ? Color.white : Color.white.opacity(0.5))
                    .padding(.horizontal )
        }
        Spacer(minLength: 10)
            Button(action: {
                self.index = 1
            }) {
                Image(systemName: "person.2.fill")
                    .resizable()
                    .frame(width: 40, height: 29)
                    .foregroundColor(self.index == 1 ? Color.white : Color.white.opacity(0.5))
                    .padding(.horizontal )
        }
        Spacer(minLength: 10)
            
            Button(action: {
                self.index = 2
            }) {
                Image(systemName: "gearshape.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(self.index == 2 ? Color.white : Color.white.opacity(0.5))
                    .padding(.horizontal )
            }
            
        }.padding(.horizontal, 30)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
    }
}
struct CellView: View {
    var data: Message
    
    var body: some View {
        HStack(spacing: 12) {
            Image(data.image)
                .resizable()
                .frame(width: 55, height: 55)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 12) {
                Text(data.name)
                
                Text(data.message).font(.caption)
            }
            
            Spacer(minLength: 0)
            
            VStack {
                Text(data.date)
                
                Spacer()
            }
        }
    }
}

struct Chats: View {
    var body: some View {
        VStack(spacing: 0) {
            TopView().zIndex(1)
            
            CenterView().offset(y: -25)
        }
    }
}

struct Groups: View {
    var body: some View {
        GeometryReader { _  in
            VStack {
                Text("Group")
                    .position(x: 215, y: 400)
            }
        }.padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .background(Color.white)
            .clipShape(shape())
            .padding(.bottom, 25)
    }
}

struct Settings: View {
    var body: some View {
        GeometryReader { _  in
            VStack {
                Text("Settings")
                    .position(x: 215, y: 400)
               
            }
        }.padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .background(Color.white)
            .clipShape(shape())
            .padding(.bottom, 25)
    }
}

struct shape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 32, height: 32))
        
        return Path(path.cgPath)
        
    }
}

struct Message: Identifiable {
    var id: Int
    var name: String
    var message: String
    var date: String
    var image:String
}

var data = [
    Message(id: 0, name: "Emily", message: "Hello!!!", date: "09/03/21", image: "p1"),
    Message(id: 1, name: "John", message: "What's up?", date: "09/23/21", image: "p2"),
    Message(id: 2, name: "Emma", message: "Hello!!!", date: "09/03/21", image: "p3"),
    Message(id: 3, name: "Lina", message: "Hello!!!", date: "09/03/21", image: "p4"),
    Message(id: 4, name: "Steve", message: "Hello!!!", date: "09/03/21", image: "p5"),
    Message(id: 5, name: "Andrei", message: "Hello!!!", date: "09/03/21", image: "p6"),
    Message(id: 6, name: "Amanda", message: "Hello!!!", date: "09/03/21", image: "p1"),
    Message(id: 7, name: "Ana", message: "Hello!!!", date: "09/03/21", image: "p2"),
    Message(id: 8, name: "Linda", message: "Hello!!!", date: "09/03/21", image: "p3"),
    Message(id: 9, name: "Rose", message: "Hello!!!", date: "09/03/21", image: "p4"),
    Message(id: 10, name: "Julie", message: "Hello!!!", date: "09/03/21", image: "p5"),
    Message(id: 11, name: "Lisa", message: "Hello!!!", date: "09/03/21", image: "p6"),
]
