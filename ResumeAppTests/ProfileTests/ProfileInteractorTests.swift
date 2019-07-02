
import XCTest
@testable import ResumeApp

class ProfileInteractorTests: XCTestCase {

    func testProfileRequestWasCalled() {
        // given
        let requestManager = MockProfileRequestManager()
        let sut = ProfileInteractor(requestManager: requestManager)
        
        // when
        sut.fetchProfileInfo { _ in
            XCTAssertTrue(requestManager.fetchInfoCalled)
        }
    }
    
    func testImageRequestWasCalled() {
        // given
        let imageRequestManager = MockImageRequestManager()
        let sut = ProfileInteractor(imageRequestManager: imageRequestManager)
        
        // when
        sut.fetchProfileInfo { _ in
            XCTAssertTrue(imageRequestManager.fetchImageDataCalled)
        }
    }
}
