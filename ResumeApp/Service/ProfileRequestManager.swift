
import Foundation

/// Manage the request for the profile Information
struct ProfileRequestManager: ProfileRequestManagerInterface {
    /// - Parameters:
    ///   - session: The URLSession
    ///   - manager: The networking manager
    ///   - success: The success complition handler
    ///   - failure: The failure complition handler
    func fetchProfileInfo (
        with session: URLSessionInterface = URLSession.shared,
        success: @escaping (Profile) -> Void,
        failure: @escaping (ServiceConstants.NetworkingError) -> Void) {
        
        guard let url = URL(string: ServiceConstants.profileURL) else { return }
        let urlRequest = URLRequest(url: url)
        // Executes the dispatcher with the given parameters
        NetworkManager.shared.pullData(with: session, request: urlRequest,
                         success: { (responseData: Data) in
                            do {
                                let jsonDecoder = JSONDecoder()
                                let result = try jsonDecoder.decode(Profile.self, from: responseData)
                                success(result)
                            } catch {
                                failure(ServiceConstants.NetworkingError.invalidData)
                            } },
                         failure: { error in
                            failure(error)
        })
    }
}

