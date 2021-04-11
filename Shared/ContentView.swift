//
//  ContentView.swift
//  Shared
//
//  Created by 孙一峰 on 2021/1/29.
//

import SwiftUI

class Affair{
    var name: String = ""
    var description: String = ""
    var reminderTime: Date = Date()
    
    init(name: String, description: String, reminderTime: Date) {
        self.name = name
        self.description = description
        self.reminderTime = reminderTime
    }
}
var affair1 = Affair(name: "喂猫", description: "添一勺猫粮，加200毫升水。", reminderTime: Date())
var affair2 = Affair(name: "iOS 课堂展示", description: "希望不要出 bug！", reminderTime: Date())
var affair3 = Affair(name: "点个外卖", description: "食堂里的人太多了。", reminderTime: Date())

var affairs: [Affair] = [affair1, affair2, affair3]

struct ContentView: View {
    @State var warm = true
    @State var showpic = false
    @State var cardnum = affairs.count
    
    var body: some View {
        
        
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(0..<cardnum, id: \.self) {currentIndex in
                    GradientCard(affair: affairs[currentIndex])
                }
                Button(action:{
                    withAnimation{
                        print("添加事务按钮被触发")
                        var newAffair = Affair(name: "未命名事务", description: "暂无描述", reminderTime: Date())
                        affairs.append(newAffair)
                        cardnum = affairs.count
                    }
                }) {
                    Text("添加事务")
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .foregroundColor(.purple)
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}

struct GradientCard: View {
//    @Binding var warm: Bool
//    @Binding var showpic: Bool
    
    @State var warm = true
    @State var showpic = false
    @State var affair: Affair
    
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 4.0) {
                Text(affair.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .opacity(0.8)
                    .foregroundColor(.white)
                Text(affair.description)
                    .font(.body)
                    .opacity(0.4)
            }.frame(width: 300, height: 100)
            if showpic{
                VStack{
                    Form {
                        Section(header: Text("事务名称")) {
                            TextField("Username", text: $affair.name)
                        }
                        Section(header: Text("事务描述")) {
                            TextField("Username", text: $affair.description)
                        }
                        Section() {
                            DatePicker(selection: $affair.reminderTime, label: { Text("时间") })
                        }
                        Section() {
                            Button(action: {
                                withAnimation{
                                    showpic.toggle()
                                    print("toggling 事务设置")
                                    print(affair.reminderTime)
                                }
                            }) {
                                Text("保存设置")
                            }
                        }
                    }
                    .navigationBarTitle("Settings")
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    .cornerRadius(/*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/)
                    .projectionEffect(/*@START_MENU_TOKEN@*/ProjectionTransform(.identity)/*@END_MENU_TOKEN@*/)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
            }
            Button(action:{
                withAnimation{
                    warm.toggle()
                    //todo: zhucitongzhi
                    print("toggling skin")
                }
            }) {
                Text(warm ? "开启通知" : "取消通知")
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .foregroundColor(.purple)
            }
            Text("事务设置")
                .font(.system(size: 12, weight: .light))
                .underline()
                .opacity(0.4)
                .onTapGesture {
                    withAnimation{
                        showpic.toggle()
                        print("toggling skin")
                    }
                }
        }
        .padding()
        .background(warm ? LinearGradient(gradient: Gradient(
                                            colors: [.red, .purple]),
                                          startPoint: .topLeading,
                                          endPoint: .bottomTrailing) :
                        LinearGradient(gradient: Gradient(
                                        colors: [.purple, .blue]),
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing))
        .cornerRadius(30)
    }
}

