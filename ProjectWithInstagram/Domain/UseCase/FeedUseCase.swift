
import Foundation
import Combine

final class FeedUseCase {
    
    private let feedRepository: FeedRepositoryProtocol = FeedRepository()
    
    func creatingRequestToTheServerToGetInstagramData() -> AnyPublisher<ModelForJSON, Error> {
        feedRepository.creatingRequestToTheServerToGetInstagramData()
    }
    
    func searchInstagramPostByTag(_ tag: String) -> AnyPublisher<ModelForJSON, Error> {
        feedRepository.searchInstagramPostByTag(tag)
    }
    
}
