//
//  ExerciseView.swift
//  new-owl-adventures
//
//  Created by Simon Italia on 18/11/21.
//

import SwiftUI

struct ExercisesView: View {
    
    private let exercises = Exercises().list
    @State private var selectedPage = 0
    @State var start = false
    @State var to: CGFloat = 0
    @State var count = 0
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var buttonLabel: String = "Let's breathe!"
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedPage) {
                ForEach(exercises.indices) { exercise in
                    ZStack(alignment: .bottomTrailing) {
                        ZStack(alignment: .topLeading) {
                            Color(AppTheme.primaryBackgroundColor).edgesIgnoringSafeArea(.all)
                            VStack(alignment: .leading, spacing: 10) {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("\(exercises[exercise].name.rawValue)")
                                        .font(.system(size: 24))
                                        .fontWeight(.semibold)
                                        .padding(.top, 24)
                                    Text("\(exercises[exercise].description.rawValue)")
                                        .font(.system(size: 18))
                                        .fontWeight(.regular)
                                }
                                .multilineTextAlignment(.leading)
                                .padding(.leading, 20)
                                if exercises[exercise].name == .breathe {
                                    VStack {
                                        HStack {
                                            Spacer()
                                            ZStack {
                                                Circle()
                                                    .trim(from: 0, to: 1)
                                                    .stroke(Color.white.opacity(0.09), style: StrokeStyle(lineWidth: 12, lineCap: .round))
                                                    .frame(width: 300, height: 300)
                                                Circle()
                                                    .trim(from: 0, to: self.to)
                                                    .stroke(Color.yellow, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                                                    .frame(width: 300, height: 300)
                                                    .rotationEffect(.init(degrees: -90))
                                                Text("00:\(String(format:"%02d", count))")
                                                    .font(.system(size: 56, weight: .thin))
                                            }
                                            .padding(.vertical, 56)
                                            Spacer()
                                        }
                                        Button(action: {
                                            if count == 30 {
                                                withAnimation { self.selectedPage += 1 }
                                            } else {
                                                self.start.toggle()
                                                self.buttonLabel = "Let's breathe!"
                                            }}, label: {
                                                Text("\(buttonLabel)")
                                                    .frame(width: 300, height: 56, alignment: .center)
                                            }
                                        )
                                            .background(Color.yellow)
                                            .foregroundColor(Color.black.opacity(0.9))
                                            .cornerRadius(8)
                                    }
                                } else if exercises[exercise].name == .puzzle {
                                    HStack {
                                        Spacer()
                                        Image("puzzle")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 300, height: 440)
                                        Spacer()
                                    }
                                    .padding(.top, 60)
                                } else {
                                    HStack {
                                        Spacer()
                                        Image("bubbles")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 300, height: 440)
                                        Spacer()
                                    }
                                    .padding(.top, 60)
                                }
                            }
                            .foregroundColor(Color(AppTheme.primaryForegroundColor))
                        }
                        FloatingOwl()
                    }
                    .tag(exercise)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
            .background(Color(AppTheme.primaryBackgroundColor))
            .navigationBarTitle("Exercises")
        }
        .onAppear {
            // configure navigation view appearance
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = AppTheme.primaryBackgroundColor
            appearance.titleTextAttributes = [.foregroundColor: AppTheme.primaryForegroundColor]
            appearance.largeTitleTextAttributes = [.foregroundColor: AppTheme.primaryForegroundColor]
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
        .onReceive(self.timer) { (_) in
            if self.start {
                if self.count != 30 {
                    self.buttonLabel = "Pause"
                    self.count += 1
                    if count == 30 {
                        self.buttonLabel = "Next exercise"
                    }
                    withAnimation(.default) {
                        self.to = CGFloat(self.count) / 30
                    }
                } else {
                    self.start.toggle()
                }
            }
        }
        .opacity(0.9)
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView()
    }
}
