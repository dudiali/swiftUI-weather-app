import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            
            BackgroundView(topColor: isNight ? .black : .blue, bottomColor: isNight ? .gray : .white)
            
            VStack {
                CityTextView(cityName: "Jakarta, Indonesia")
                TodayWeatherView(imageName: "cloud.sun.fill", temperature: 30)
                
                HStack (spacing: 20) {
                    WeatherDayView(dayofweek: "TUE", imageName: "sun.max.fill", temperature: 34)
                    WeatherDayView(dayofweek: "WED", imageName: "cloud.rain.fill", temperature: 28)
                    WeatherDayView(dayofweek: "THU", imageName: "cloud.rain.fill", temperature: 27)
                    WeatherDayView(dayofweek: "FRI", imageName: "cloud.sun.fill", temperature: 30)
                    WeatherDayView(dayofweek: "SAT", imageName: "cloud.bolt.rain.fill", temperature: 27)
                    
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    Text("Changed day time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayofweek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayofweek)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(
                .system(
                    size: 32,
                    weight: .medium,
                    design: .default
                ))
            .foregroundColor(.white)
            .padding()
    }
}

struct TodayWeatherView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}
