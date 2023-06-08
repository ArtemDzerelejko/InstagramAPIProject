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
    
    private func createURLComponents(withPath path: String) -> URLComponents? {
        let urlString = "https://graph.instagram.com" + path
        
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = [
            URLQueryItem(name: Constants.fieldsURLQueryItem,
                         value: Keys.allCases.map({ $0.rawValue }).joined(separator: ",")),
            URLQueryItem(name: Constants.accessTokenURLQueryItem, value: Constants.accessToken)
        ]
        
        return components
    }
    
    func creatingURLToRetrieveData() -> URL? {
        return createURLComponents(withPath: "/me/media")?.url
    }
    
    func creatingURLToRetrieveDataAccordingToTheTag(with tag: String) -> URL? {
        var components = createURLComponents(withPath: "me/media")
        components?.queryItems?.append(URLQueryItem(name: "tag", value: tag))
        
        return components?.url
    }
}
