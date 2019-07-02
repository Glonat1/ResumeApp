
import UIKit

final class ProfileWireframe: BaseWireframe {
    
    // MARK: - Module setup
    init() {
        let moduleViewController = ProfileViewController.instantiate(from: StoryboardName.profile.rawValue)
        super.init(viewController: moduleViewController)
        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter(view: moduleViewController, interactor: interactor)
        moduleViewController.presenter = presenter
    }
}
