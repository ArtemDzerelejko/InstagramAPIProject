
import Foundation
import Combine

final class StartViewModel: ObservableObject {
    
    @Published var posts: [DataObject] = []
    @Published var apiResult: ModelForJSON?
    @Published var isLoading = false
    @Published var isError = false
    
    private var cancellables = Set<AnyCancellable>()
    private let feedUseCase = FeedUseCase()
    
    func uploadingDataForInstagramFeed() {
        isLoading = true
        feedUseCase.creatingRequestToTheServerToGetInstagramData()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished: break
                case.failure:
                    self?.isError = true
                    self?.isLoading = false
                }
            } receiveValue: { [weak self] result in
                self?.apiResult = result
                self?.isLoading = false
                guard let fetchedPosts = result.data else { return }
                self?.posts = fetchedPosts
            }.store(in: &cancellables)
    }
    
    func likeButtonTapped(for post: DataObject) {}
    
    func commentButtonTapped(for post: DataObject) {}
    
    func directButtonTapped(for post: DataObject) {}
    
    func bookmarkButtonTapped(for post: DataObject) {}
    
    deinit {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
    }
    
}
