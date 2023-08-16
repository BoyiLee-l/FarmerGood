//
import Foundation

struct YoutubeApi: Codable {
    let items : [Item]
    let nextPageToken : String
    let pageInfo : PageInfo
    let prevPageToken : String
    
}
struct PageInfo : Codable {
    let resultsPerPage : Int
    let totalResults : Int
}

struct Item : Codable {
    let contentDetails : ContentDetail

    let snippet : Snippet
}
struct Snippet : Codable {
    let channelId : String
    let title : String
    let description : String
    let position : Int
    let resourceId : ResourceId
    let thumbnails : Thumbnail
    
}
struct ContentDetail : Codable {
    let videoId : String
}
struct ResourceId : Codable {
    let videoId : String
}
struct Thumbnail : Codable {
    let high : Default?
    let maxres : Default?
    let medium : Default?
    let standard : Default?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        high = try values.decodeIfPresent(Default.self, forKey: .high)
        maxres = try values.decodeIfPresent(Default.self, forKey: .maxres)
        medium = try values.decodeIfPresent(Default.self, forKey: .maxres)
        standard = try values.decodeIfPresent(Default.self, forKey: .standard)
    }
}
struct Default : Codable {
    let height : Int
    let url : String
    let width : Int
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        height = try values.decodeIfPresent(Int.self, forKey: .height) ?? 0
        url = try values.decodeIfPresent(String.self, forKey: .url) ?? ""
        width = try values.decodeIfPresent(Int.self, forKey: .width) ?? 0
    }
}

