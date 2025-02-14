import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// Define structs for weather API response
struct ForecastResponse: Codable {
    let properties: Properties
}

struct Properties: Codable {
    let periods: [Period]
}

struct Period: Codable {
    let name: String
    let temperature: Int
    let temperatureUnit: String
    let shortForecast: String
}

// Define struct for reverse geocoding API response (using OpenStreetMap Nominatim API)
struct ReverseGeocodeResponse: Codable {
    let address: Address?
}

struct Address: Codable {
    let city: String?
    let state: String?
}

// Singleton for API requests
final class WeatherService {
    static let shared = WeatherService()
    private init() {}
    
    // Fetch weather forecast from NWS API
    func fetchWeather(latitude: Double, longitude: Double) async throws -> ForecastResponse {
        let urlString = "https://api.weather.gov/points/\(latitude),\(longitude)"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        
        guard let properties = json?["properties"] as? [String: Any],
              let forecastURLString = properties["forecast"] as? String,
              let forecastURL = URL(string: forecastURLString) else {
            throw URLError(.badServerResponse)
        }
        
        let (forecastData, _) = try await URLSession.shared.data(from: forecastURL)
        let decoder = JSONDecoder()
        return try decoder.decode(ForecastResponse.self, from: forecastData)
    }
    
    // Reverse geocode coordinates using OpenStreetMap Nominatim API
    func reverseGeocode(latitude: Double, longitude: Double) async throws -> String {
        let urlString = "https://nominatim.openstreetmap.org/reverse?lat=\(latitude)&lon=\(longitude)&format=json"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let response = try decoder.decode(ReverseGeocodeResponse.self, from: data)
        
        if let city = response.address?.city, let state = response.address?.state {
            return "\(city), \(state)"
        } else if let state = response.address?.state {
            return state
        } else {
            return "Unknown Location"
        }
    }
}

// Function to generate random latitude and longitude **only within the U.S.**
func randomUSCoordinates() -> (Double, Double) {
    let latitude = Double.random(in: 24.396308...49.384358)  // U.S. latitude range
    let longitude = Double.random(in: (-125.000000 ..< -66.934570))
 // U.S. longitude range
    return (latitude, longitude)
}

// Run both API calls concurrently using TaskGroup
Task {
    let (latitude, longitude) = randomUSCoordinates()
    var locationName: String?
    var weather: ForecastResponse?
    
    await withTaskGroup(of: Void.self) { taskGroup in
        taskGroup.addTask {
            do {
                locationName = try await WeatherService.shared.reverseGeocode(latitude: latitude, longitude: longitude)
            } catch {
                print("Error fetching location: \(error)")
            }
        }
        
        taskGroup.addTask {
            do {
                weather = try await WeatherService.shared.fetchWeather(latitude: latitude, longitude: longitude)
            } catch {
                print("Error fetching weather: \(error)")
            }
        }
    }
    
    // Ensure both tasks completed before printing
    if let location = locationName, let forecast = weather, let today = forecast.properties.periods.first {
        print("📍 Location: \(location) (\(latitude), \(longitude))")
        print("🌦 Weather Forecast: \(today.name) - \(today.temperature)°\(today.temperatureUnit), \(today.shortForecast)")
    } else {
        print("❌ Failed to fetch data.")
    }
}
