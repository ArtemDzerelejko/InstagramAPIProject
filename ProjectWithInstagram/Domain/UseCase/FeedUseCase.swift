
import Foundation
import Combine

final class FeedUseCase {
    
    private let apiRepository: FeedRepositoryProtocol = FeedRepository()
    
    func creatingRequestToTheServerToGetInstagramData() -> AnyPublisher<ModelForJSON, Error> {
        apiRepository.creatingRequestToTheServerToGetInstagramData()
    }
    
    func searchInstagramPostByTag(_ tag: String) -> AnyPublisher<ModelForJSON, Error> {
        apiRepository.searchInstagramPostByTag(tag)
    }
    
}
