//
//  ContentView.swift
//  SwiftUI-weather
//
//  Created by Harsha Agarwal on 20/03/24.
//

import SwiftUI

struct ContentView: View {
    @State var isNight: Bool
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "CUPERTINO, CA")
                MainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temprature: 76)
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                   temprature: 74)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temprature: 88)
                    WeatherDayView(dayOfWeek: "THUR",
                                   imageName: "wind.snow",
                                   temprature: 55)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temprature: 60)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "snow",
                                   temprature: 25)
                }
                .padding(.bottom, 40)
                Button(action: {
                    isNight.toggle()
                }, label: {
                    LocationButton(title: "Change Location", foregroundColor: .blue, backgroundColor: .white)
                })
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 16, height: 16)))
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView(isNight: false)
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temprature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .foregroundStyle(.white)
                .font(.custom("BebasNeue-Regular", size: 16))
            VStack(spacing: 8) {
                WeatherDaySubView(imageName: imageName)
                Text("\(temprature)°")
                    .foregroundStyle(.white)
                    .bold()
            }
        }
    }
}

struct WeatherDaySubView: View {
    var imageName: String
    var body: some View {
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 40, height: 40)
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    var body: some View {
        let topColor : Color = isNight ? .black : .blue
        let bottomColor: Color = isNight ? .gray : Color(Color("lightBlue"))
        LinearGradient(gradient: Gradient(colors: [topColor,
                                                   bottomColor]),
                       startPoint: .top,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .foregroundStyle(.white)
            .font(.custom("BebasNeue-Regular",
                          size: 32))
            .padding(.top, 16)
    }
}

struct MainWeatherView: View {
    
    var imageName: String
    var temprature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temprature)°").font(.system(size: 70, weight: .medium)).foregroundStyle(.white)
        }
        .padding(.bottom,40)
    }
}


