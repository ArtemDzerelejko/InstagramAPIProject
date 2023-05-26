
import Foundation
import Combine

class DirectViewModel: ObservableObject {
    
    @Published var searchValue = ""
    @Published var searchResults: [String] = []

    func searchUsersInDirect() {}
}
