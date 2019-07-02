
import Foundation
@testable import ResumeApp

class MockProfileInteractor: ProfileInteractorInterface {
    
    var fetchProfileInfoCalled = false
    var fetchImageCalled = false
    
    func fetchProfileInfo(completion: @escaping (Result<Profile, ServiceConstants.NetworkingError>) -> Void) {
        fetchProfileInfoCalled = true
    }
    
    func fetchImage(withURL url: String, completion: @escaping (Result<Data, ServiceConstants.NetworkingError>) -> Void) {
        fetchImageCalled = true
    }
}
