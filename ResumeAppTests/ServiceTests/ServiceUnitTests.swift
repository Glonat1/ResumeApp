
import XCTest
@testable import ResumeApp

class ServiceUnitTests: XCTestCase {
    
    func testProfileInfoIsFetchedWithSuccess() {
        // given
        let session = MockURLSessionSuccess()
        let testBundle = Bundle(for: type(of: self))
        guard let path = testBundle.path(forResource: "ProfileMock", ofType: "json") else {
            XCTFail(LocalizedKeys.invalidPath.rawValue)
            return
        }
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        let expectation = XCTestExpectation(description: NSLocalizedString(LocalizedKeys.successDownloadProfile.rawValue, comment: ""))
        session.testData = data
        
        // when
        ProfileRequestManager().fetchProfileInfo(with: session, success: { profile in
            expectation.fulfill()
        }, failure: { error in
            XCTFail()
        })
        
        // then
        wait(for: [expectation], timeout: 1)
    }
    
    func testProfileInfoFetchedWithInvalidDataError() {
        // given
        let session = MockURLSessionSuccess()
        let testBundle = Bundle(for: type(of: self))
        guard let path = testBundle.path(forResource: "BadProfileMock", ofType: "json") else {
            XCTFail(LocalizedKeys.invalidPath.rawValue)
            return
        }
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        let expectation = XCTestExpectation(description: NSLocalizedString(LocalizedKeys.successDownloadProfile.rawValue, comment: ""))
        session.testData = data
        
        // when
        ProfileRequestManager().fetchProfileInfo(with: session, success: { _ in
            XCTFail()
        }, failure: { error in
            if error == ServiceConstants.NetworkingError.invalidData {
                expectation.fulfill()
            }
            else {
                XCTFail()
            }
        })
        
        // then
        wait(for: [expectation], timeout: 1)
    }
    
    func testImageDownloadWithSuccess() {
        // given
        let session = MockURLSessionSuccess()
        let expectation = XCTestExpectation(description: NSLocalizedString(LocalizedKeys.successDownloadProfile.rawValue, comment: ""))
        let data = UIImage(named: "profile-default")?.jpegData(compressionQuality: 100)
        session.testData = data
        // when
        ImageRequestManager().fetchImageData(with: "www.dummy_url.com", with: session, success: { _ in
            expectation.fulfill()
        }) { _ in
            XCTFail()
        }
        
        // then
        wait(for: [expectation], timeout: 1)
    }
    
    
    func testNetworkManagerWithFailure() {
        // given
        let session = MockURLSessionFailure()
        let testBundle = Bundle(for: type(of: self))
        guard let path = testBundle.path(forResource: "BadProfileMock", ofType: "json") else {
            XCTFail(LocalizedKeys.invalidPath.rawValue)
            return
        }
        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        let expectation = XCTestExpectation(description: NSLocalizedString(LocalizedKeys.successDownloadProfile.rawValue, comment: ""))
        session.testData = data
        guard let testURL = URL(string: "www.dummy_url.com") else {
            XCTFail("Invalid dummy url")
            return
        }
    
        // when
        NetworkManager.shared.pullData(with: session, request: URLRequest(url: testURL), success: { _ in
            XCTFail()
        }) { error in
            if error == ServiceConstants.NetworkingError.responseError {
                expectation.fulfill()
            } else {
                XCTFail("There was another error")
            }
        }
        
        // then
        wait(for: [expectation], timeout: 1)
    }
}


