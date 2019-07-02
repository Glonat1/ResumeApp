
import Foundation

// MARK: - Profile
struct Profile: Codable {
    let name: String
    let pictureURL: String
    let sections: [Section]
}

// MARK: - Section
struct Section: Codable {
    let title: String
    let summary: String?
    let experience: [Experience]?
    let skills: [Skill]?
    let information: Information?
}

// MARK: - Experience
struct Experience: Codable {
    let company, start, end, designation: String
}

// MARK: - Information
struct Information: Codable {
    let direction, cellphone, email: String
}

// MARK: - Skill
struct Skill: Codable {
    let skill, time: String
}
