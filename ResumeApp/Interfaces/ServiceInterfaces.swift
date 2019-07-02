
import Foundation

// MARK: URLSessionProtocol
/// Protocol to allow to mock a URLSession in the unit tests
protocol URLSessionInterface {
    func dataTask(with urlRequest: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

// MARK: - Extension to make URLSesssion testable
extension URLSession: URLSessionInterface { }

// MARK: - Extension to make ProfileRequestManager testable
protocol ProfileRequestManagerInterface {
    func fetchProfileInfo (
        with session: URLSessionInterface,
        success: @escaping (Profile) -> Void,
        failure: @escaping (ServiceConstants.NetworkingError) -> Void)
}

// MARK: - Extension to make ImageRequestManagerInterface testable
protocol ImageRequestManagerInterface {
    func fetchImageData (with imageURL: String,
    with session: URLSessionInterface,
    success: @escaping (Data) -> Void,
    failure: @escaping (ServiceConstants.NetworkingError) -> Void
    )
}

