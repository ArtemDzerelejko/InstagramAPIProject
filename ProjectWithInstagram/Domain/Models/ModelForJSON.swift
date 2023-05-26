
import Foundation

struct ModelForJSON {
    let data: [DataObject]?
    let padding: Paging?
    
    init(remote: ModelForJSONRemote?) {
        data = remote?.data?.compactMap({ dataRemote in
            return DataObject(caption: dataRemote.caption,
                              id: dataRemote.id,
                              username: dataRemote.username,
                              media_url: dataRemote.media_url)
            
        })
        if let cursors = remote?.padding?.cursors {
            padding = Paging(cursors: Cursors(before: cursors.before, after: cursors.after))
        } else {
            padding = nil
        }
    }
}

struct DataObject {
    let caption: String?
    let id: String?
    let username: String?
    let media_url: String?
    
    init(caption: String?, id: String?, username: String?, media_url: String?) {
        self.caption = caption
        self.id = id
        self.username = username
        self.media_url = media_url
    }
}

struct Paging {
    let cursors: Cursors?
    
    init(cursors: Cursors?) {
        self.cursors = cursors
    }
}

struct Cursors {
    let before: String?
    let after: String?
    
    init(before: String?, after: String?) {
        self.before = before
        self.after = after
    }
}
