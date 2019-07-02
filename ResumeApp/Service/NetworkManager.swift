
import Foundation

// MARK: URL session Network Manager
struct NetworkManager {
    
    // MARK: - Singleton instance
    static let shared = NetworkManager()
    
    // MARK: - Initializers
    private init() {}
    /// MARK: - Methods
    /// Execute the request using the request data and the given session
    ///
    /// - Parameters:
    ///   - session: The injected URLSessionInterface
    ///   - request: The URL request
    ///   - success: The complition handler for success
    ///   - failure: The complition handler for the failure
    func pullData(with session: URLSessionInterface, request: URLRequest,
                  success: @escaping (Data) -> Void, failure: @escaping (ServiceConstants.NetworkingError) -> Void) {
        
        session.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                failure(ServiceConstants.NetworkingError.responseError)
                return
            }
            
            if let _data = data, let response = response as? HTTPURLResponse{
                if  200...299 ~= response.statusCode {
                    success(_data)
                } else {
                    failure(ServiceConstants.NetworkingError.responseError)
                }
            } else {
                failure(ServiceConstants.NetworkingError.responseError)
            }
    
            }.resume()
    }
}
