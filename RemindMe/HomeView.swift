//
//  HomeView.swift
//  RemindMe
//
//  Created by Mohammed Alsaleh on 16/09/1443 AH.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var ViewModel = VM()
    @State var date = Date()
    @State var text = ""
    var body: some View {
        NavigationView {
            ZStack {
                Color("BG")
                    .ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("ماذا تريد أن أذكرك به؟")
                            .fontWeight(.semibold)
                            .font(.title2)
                            .padding(.horizontal)
                        TF
                        Text("التاريخ والوقت:")
                            .fontWeight(.semibold)
                            .font(.title2)
                            .padding([.horizontal,.top])
                        DatePicker("", selection: $date, displayedComponents: [.hourAndMinute,.date])
                            .datePickerStyle(.graphical)
                            .accentColor(.purple)
                    }
                    HStack {
                        Button {
                            self.ViewModel.SendNotifcations(title: "تذكير", subtitle: "تجربة", sound: .default, date: nil)
                        } label: {
                            Text("تذكير تجريبي")
                                .bold()
                                .font(.title)
                                .foregroundColor(.purple)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).foregroundColor(.purple.opacity(0.4)))
                        }
                        Button {
                            self.ViewModel.SendNotifcations(title: "تذكير", subtitle: text, sound: .default, date: date)
                        } label: {
                            Text("إنشاء تذكير")
                                .bold()
                                .font(.title)
                                .foregroundColor(.white)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 15).foregroundColor(.purple))
                        }
                    }
                }
            }.navigationTitle("تطبيق المذكر")
        }
    }
    
    // TextField
    var TF : some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .stroke(.black)
                .frame(height:50)
            TextField("أقابل صديقي محمد..",text:$text)
                .padding()
        }.padding(.horizontal)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
