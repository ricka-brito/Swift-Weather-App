//
//  ReverseGeocodingService.swift
//  Weather App
//
//  Created by Henrique Brito on 20/10/24.
//

import Foundation
import CoreLocation

class ReverseGeocodingService {
    
    private let baseURL: String = "https://api.openweathermap.org/geo/1.0/reverse"
    private let apiKey: String = "5b1a8918707bb58e2dc61f056dfe4bb4"
    private let session: URLSession = .shared
    
    
    func fetchData(location: CLLocationCoordinate2D, _ completion: @escaping (GeocodingResponse?) -> Void) {
        let urlString = "\(baseURL)?lat=\(location.latitude)&lon=\(location.longitude)&appid=\(apiKey)&limit=1"
        guard let url = URL(string: urlString) else { return }
                
        let task = session.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(nil)
                return
            }
            
            do {
                let geocodingResponse = try JSONDecoder().decode(GeocodingResponse.self, from: data)
                completion(geocodingResponse)
            } catch {
                print(error)
                completion(nil)
            }
        }
        
        task.resume()
    }
    
}

// MARK: - GeocodingResponseElement
struct GeocodingResponseElement: Codable {
    let name: String
    let lat, lon: Double
    let country: String
}


typealias GeocodingResponse = [GeocodingResponseElement]
