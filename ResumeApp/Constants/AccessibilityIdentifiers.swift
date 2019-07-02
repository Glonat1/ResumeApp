
import Foundation

/// To easy set the accessibility identifiers used in the UI tests
struct AccessibilityIdentifiers {
    
    /// Setions cells accessibility identifiers
    enum Cells: String {
        case experience = "experience_cell_id"
        case about = "about_cell_id"
        case skills = "skills_cell_id"
        case information = "information_cell_id"
    }
    
    /// Labels accessibility identifiers
    enum Labels: String {
        case profileName = "profile_name_id"
    }
    
    /// Image views accessibility identifiers
    enum ImageViews: String {
        case profilePicture = "profile_image_id"
    }
}
