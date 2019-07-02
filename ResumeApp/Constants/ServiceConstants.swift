
import Foundation

/// The constants needed for the Service
/// Handle to manage the response of the API
enum Result<Success, Failure> {
    case success(Success)
    case failure(Failure)
}

struct ServiceConstants {
    
    // MARK: - MARK: Properties
    static let profileURL = "https://api.myjson.com/bins/d5opv"
    
    // MARK: - Enums
    /// The available HTTP method
    enum HTTPMethod : String {
        case get = "GET"
    }
    
    /// The possible networking errors
    enum NetworkingError: Error {
        case responseError
        case invalidURL
        case emptyData
        case invalidData
    }
}
