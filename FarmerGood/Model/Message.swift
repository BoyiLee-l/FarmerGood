//
//  Message.swift
//  HipHopTextbook
//
//  Created by user on 2020/5/11.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import Foundation

struct Message : Codable {
    let items : [ItemMessage]?
    let kind : String?
    let nextPageToken : String?
    
}

struct ItemMessage : Codable {
    let etag : String?
    let id : String?
    let kind : String?
    let snippet : Reply?
    
}

struct Reply : Codable {
    let topLevelComment: Comment?

}

struct Comment : Codable {

    let etag : String?
    let id : String?
    let kind : String?
    let snippet : SnippetMessage?

}

struct SnippetMessage : Codable {
    let authorChannelUrl : String?
    let authorDisplayName : String?
    let authorProfileImageUrl : String?
    let canRate : Bool?
    let likeCount : Int?
    let parentId : String?
    let publishedAt : String?
    let textDisplay : String?
    let textOriginal : String?
    let updatedAt : String?
    let videoId : String?
    let viewerRating : String?
    let canReply : Bool?
    let isPublic : Bool?
    //let topLevelComment : Comment?
    let totalReplyCount : Int?


    enum CodingKeys: String, CodingKey {
        case authorChannelUrl = "authorChannelUrl"
        case authorDisplayName = "authorDisplayName"
        case authorProfileImageUrl = "authorProfileImageUrl"
        case canRate = "canRate"
        case likeCount = "likeCount"
        case parentId = "parentId"
        case publishedAt = "publishedAt"
        case textDisplay = "textDisplay"
        case textOriginal = "textOriginal"
        case updatedAt = "updatedAt"
        case videoId = "videoId"
        case viewerRating = "viewerRating"
        case canReply = "canReply"
        case isPublic = "isPublic"
        case totalReplyCount = "totalReplyCount"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        authorChannelUrl = try values.decodeIfPresent(String.self, forKey: .authorChannelUrl)
        authorDisplayName = try values.decodeIfPresent(String.self, forKey: .authorDisplayName)
        authorProfileImageUrl = try values.decodeIfPresent(String.self, forKey: .authorProfileImageUrl)
        canRate = try values.decodeIfPresent(Bool.self, forKey: .canRate)
        likeCount = try values.decodeIfPresent(Int.self, forKey: .likeCount)
        parentId = try values.decodeIfPresent(String.self, forKey: .parentId)
        publishedAt = try values.decodeIfPresent(String.self, forKey: .publishedAt)
        textDisplay = try values.decodeIfPresent(String.self, forKey: .textDisplay)
        textOriginal = try values.decodeIfPresent(String.self, forKey: .textOriginal)
        updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
        videoId = try values.decodeIfPresent(String.self, forKey: .videoId)
        viewerRating = try values.decodeIfPresent(String.self, forKey: .viewerRating)
        canReply = try values.decodeIfPresent(Bool.self, forKey: .canReply)
        isPublic = try values.decodeIfPresent(Bool.self, forKey: .isPublic)
        //topLevelComment = try Comment(from: decoder)
        totalReplyCount = try values.decodeIfPresent(Int.self, forKey: .totalReplyCount)
    }


}


