
struct ModelForJSONRemote: Codable {
    let data: [DataObjectRemote]?
    let padding: PagingRemote?
}

struct DataObjectRemote: Codable {
    let caption: String?
    let id: String?
    let username: String?
    let media_url: String?
}

struct PagingRemote: Codable {
    let cursors: CursorsRemote?
}

struct CursorsRemote: Codable {
    let before: String?
    let after: String?
}
