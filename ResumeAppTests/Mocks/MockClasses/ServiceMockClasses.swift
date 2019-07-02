
import Foundation
@testable import ResumeApp

// MARK: - Mock classes
class DataTaskDummy: URLSessionDataTask {
    override func resume() {
    }
}

class MockURLSessionSuccess: URLSessionInterface {
    var testData: Data?
    func dataTask(with urlRequest: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        defer {
            if let dummyURL = URL(string: "www.dummy_url.com") {
                completionHandler(testData, HTTPURLResponse(url: dummyURL, statusCode: 200, httpVersion: nil, headerFields: nil), nil)
            } else {
                fatalError("The url could not be created")
            }
        }
        
        return DataTaskDummy()
    }
}


class MockURLSessionFailure: URLSessionInterface {
    var testData: Data?
    func dataTask(with urlRequest: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        defer {
            if let dummyURL = URL(string: "www.dummy_url.com") {
                completionHandler(testData, HTTPURLResponse(url: dummyURL, statusCode: 404, httpVersion: nil, headerFields: nil), nil)
            } else {
                fatalError("The dummy url could not be created")
            }
        }
        
        return DataTaskDummy()
    }
}
