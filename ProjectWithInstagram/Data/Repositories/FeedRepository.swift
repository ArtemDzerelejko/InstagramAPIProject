import Foundation
import Combine

final class FeedRepository: FeedRepositoryProtocol {
    
    let apiService = APIService()
    
    func creatingRequestToTheServerToGetInstagramData() -> AnyPublisher<ModelForJSON, Error> {
        guard let url = apiService.creatingURLToRetrieveData() else {
            return Fail(error: NSError(domain: Strings.errorBuildingURL, code: 0)).eraseToAnyPublisher()
        }
        return performReguest(for: url)
    }
    
    func searchInstagramPostByTag(_ tag: String) -> AnyPublisher<ModelForJSON, Error> {
        guard let url = apiService.creatingURLToRetrieveDataAccordingToTheTag(with: tag) else {
            return Fail(error: NSError(domain: Strings.errorBuildingURL, code: 0)).eraseToAnyPublisher()
        }
        return performReguest(for: url)
    }
    
    private func performReguest(for url: URL) -> AnyPublisher<ModelForJSON, Error> {
        return apiService.urlSession.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NSError(domain: Strings.invalidResponseData, code: 0)
                }
                
                guard (200..<300).contains(httpResponse.statusCode) else {
                    throw NSError(domain: Strings.invalidResponseStatusCode, code: 0)
                }
                
                return data
            }
            .decode(type: ModelForJSONRemote.self, decoder: JSONDecoder())
            .map(ModelForJSON.init)
            .eraseToAnyPublisher()
    }
}
