import Foundation
import Combine

private enum Keys: String, CaseIterable {
    case captionKey = "caption"
    case idKey = "id"
    case modinTypeKey = "modin_type"
    case usernameKey = "username"
    case mediaUrlKey = "media_url"
}

private enum Constants {
    static let accessToken: String = "IGQVJWZAmMyRjZANcWNuaVhHeTQyejZAxNkVtWnZAoTndaNmNHSnJaaEtLOVJ0WmVqcHU4a2FGcklVbjdfSU15dGxidnBpUkV6TUdRVUo4ZAHBHX25OWVdYM2N5bGhNMkdFVlBLSzhqRFpn"
    static let fieldsURLQueryItem: String = "fields"
    static let accessTokenURLQueryItem: String = "access_token"
}

class APIService {
    private var urlString = ""
    
    let urlSession = URLSession(configuration: .default)
    
    func creatingURLToRetrieveData() -> URL? {
        
        let urlString = "https://graph.instagram.com/me/media"
        
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        components?.queryItems = [
            URLQueryItem(name: Constants.fieldsURLQueryItem,
                         value: Keys.allCases.map({ $0.rawValue }).joined(separator: ",")),
            URLQueryItem(name: Constants.accessTokenURLQueryItem, value: Constants.accessToken)
        ]
        
        return components?.url
    }
    
    func creatingURLToRetrieveDataAccordingToTheTag (with tag: String) -> URL? {
        
        let urlString = "https://graph.instagram.com/me/media"
        
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        components?.queryItems?.append(URLQueryItem(name: "tag", value: tag))
        
        return components?.url
    }
}
