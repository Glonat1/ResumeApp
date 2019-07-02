
/// Constants to handle the custom section cells
struct CellConstants {
    
    /// The name of the xib file
    enum NibName: String {
        case experience = "ExperienceDetailCell"
        case about = "AboutDetailCell"
        case skills = "SkillsDetailCell"
        case achievements = "AchievementsDetailCell"
        case information = "InformationDetailCell"
    }
    
    /// The reuse identifier
    enum Identifier: String {
        case experience = "ExperienceDetailCell"
        case about = "AboutDetailCell"
        case skills = "SkillsDetailCell"
        case information = "InformationDetailCell"
    }
    
    /// The index of the expeted sections
    enum ResumeDetailSection: Int {
        case about = 0
        case experience = 1
        case skills = 2
        case information = 3
    }
}

