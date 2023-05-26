
import Foundation
import Combine

protocol FeedRepositoryProtocol {
    func creatingRequestToTheServerToGetInstagramData() -> AnyPublisher<ModelForJSON, Error>
    
    func searchInstagramPostByTag(_ tag: String) -> AnyPublisher<ModelForJSON, Error>
}
