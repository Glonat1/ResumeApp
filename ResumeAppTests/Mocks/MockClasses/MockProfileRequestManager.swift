
import Foundation
@testable import ResumeApp

// MARK: MockProfileRequestManager
class MockProfileRequestManager: ProfileRequestManagerInterface {
    // MARK: - Properties
    var fetchInfoCalled = false
    // MARK: - Methods
    func fetchProfileInfo (
        with session: URLSessionInterface = URLSession.shared,
        success: @escaping (Profile) -> Void,
        failure: @escaping (ServiceConstants.NetworkingError) -> Void){
        fetchInfoCalled = true
    }
}
