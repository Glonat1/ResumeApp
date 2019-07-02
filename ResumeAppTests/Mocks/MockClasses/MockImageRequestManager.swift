
import Foundation
@testable import ResumeApp

class MockImageRequestManager: ImageRequestManagerInterface {
    
    var fetchImageDataCalled = false
    
    func fetchImageData(with imageURL: String, with session: URLSessionInterface, success: @escaping (Data) -> Void, failure: @escaping (ServiceConstants.NetworkingError) -> Void) {
        fetchImageDataCalled = true
    }
}
