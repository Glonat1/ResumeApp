
import Foundation

/// Cointainer to inject the data to experience cell view
struct ExperienceCellPresenter {
    var company: String
    var start: String
    var end: String
    var designation: String
    var formatedInfo: String {
        return  "\(start) - \(end)  \(designation)"
    }
}
