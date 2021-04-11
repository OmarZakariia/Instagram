//
//  Models.swift
//  Instagram
//
//  Created by Omar Zakaria on /114/21.
//

import Foundation

enum Gender {
    case male,female, other
}

struct User {
    let username : String
    let bio : String
    let name : (first: String, last: String)
    let birthDate : Int
    let gender: Gender
    let counts: UserCount
    let joinDate : Date
}

struct UserCount {
    let followers: Int
    let following : Int
    let posts: Int
    
}

public enum UserPostType {
    case photo
    case video
}

/// Represents a user post
public struct UserPost {
    let postType : UserPostType
    let identifier : String
    let thumbnailImage: URL
    let postURL: URL // either video URL or full resolution phot
    let caption: String?
    let likeCount: [PostLikes]
    let comments : [PostComment]
    let createdData: Date
    let taggedUsers: [String]
}

struct PostComment {
    let identifier : String
    let username: String
    let text: String
    let createdDate: Date
    let likes: [CommentLikes]
    
}
struct CommentLikes {
    let username: String
    let commentIdentifier : String
}

struct PostLikes {
    let username: String
    let postIdentifier : String
}
