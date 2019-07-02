
import Foundation

// MARK:
/// Abstracts the interaction with the service layer to download the image data
struct ImageRequestManager: ImageRequestManagerInterface {
    /// Calling this method fetches the image data
    ///
    /// - Parameters:
    ///   - session: The URLSession
    ///   - manager: The networking manager
    ///   - success: The success complition handler
    ///   - failure: The failure complition handler
    func fetchImageData (with imageURL: String,
        with session: URLSessionInterface = URLSession.shared,
        success: @escaping (Data) -> Void,
        failure: @escaping (ServiceConstants.NetworkingError) -> Void
        ) {
        
        guard let url = URL(string: imageURL) else { return }
        let urlRequest = URLRequest(url: url)
        // Executes the dispatcher with the given parameters
        NetworkManager.shared.pullData(with: session, request: urlRequest,
                            success: { (responseData: Data) in
                                DispatchQueue.main.async {
                                    success(responseData)
                                } },
                            failure: { error in
                                DispatchQueue.main.async {
                                    failure(error)
                                }
        })
    }
}
