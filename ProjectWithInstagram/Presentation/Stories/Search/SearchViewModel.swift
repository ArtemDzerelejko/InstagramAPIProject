
import SwiftUI
import Combine

class SearchViewModel: ObservableObject {
    
    @Published var posts: [DataObject] = []
    @Published var searchValue = ""
    @Published var searchResults: [String] = []
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
            }
            .store(in: &cancellables)
    }
    
    func searchInstagramPostsByTag() {
        guard !searchValue.isEmpty else {
            searchResults = []
            return
        }
        isLoading = true
        isError = false
        feedUseCase.searchInstagramPostByTag(searchValue)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished: break
                case .failure:
                    self?.isLoading = false
                    self?.isError = true
                }
            } receiveValue: { [weak self] result in
                self?.apiResult = result
                self?.searchResults = result.data?.compactMap { $0.caption } ?? []
            }
            .store(in: &cancellables)
    }
    
    deinit {
        cancellables.forEach{ $0.cancel() }
        cancellables.removeAll()
    }
}
