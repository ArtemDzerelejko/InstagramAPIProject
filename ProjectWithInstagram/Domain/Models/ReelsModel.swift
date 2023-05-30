
import SwiftUI

struct ReelsModel: Identifiable {
    var id = UUID().uuidString
    var url: String
    var title: String
    var isExpanded: Bool = false
}

var ReelsModelJSON  = [
    ReelsModel(url: "Reel-1", title: "Reel-1"),
    ReelsModel(url: "Reel-2", title: "Reel-2"),
    ReelsModel(url: "Reel-3", title: "Reel-3"),
    ReelsModel(url: "Reel-5", title: "Reel-5"),
    ReelsModel(url: "Reel-8", title: "Reel-8"),
    ReelsModel(url: "Reel-9", title: "Reel-9"),
    ReelsModel(url: "Reel-10", title: "Reel-10"),
]
