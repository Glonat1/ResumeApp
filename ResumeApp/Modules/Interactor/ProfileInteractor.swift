
import Foundation

final class ProfileInteractor: ProfileInteractorInterface {
    
    let requestManager: ProfileRequestManagerInterface
    
    init(requestManager: ProfileRequestManagerInterface = ProfileRequestManager(), imageRequestManager: ImageRequestManagerInterface = ImageRequestManager()) {
        self.requestManager = requestManager
    }
    
    /// Method for fetchP profile info with completion handlers
    func fetchProfileInfo(completion: @escaping (Result<Profile, ServiceConstants.NetworkingError>) -> Void) {
        requestManager.fetchProfileInfo(with: URLSession.shared, success: { profile in
            completion(Result.success(profile))
        }) { error in
            completion(Result.failure(error))
        }
    }
    
    /// Method for fetch an image data with completion handlers
    func fetchImage(withURL url: String, completion: @escaping (Result<Data, ServiceConstants.NetworkingError>) -> Void) {
        ImageRequestManager().fetchImageData(with: url, success: { data in
            completion(Result.success(data))
        }) { error in
            completion(Result.failure(error))
        }
    }
}

