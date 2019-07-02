
import UIKit

/// Helps to instantiante easly a controller from a given storyboard
protocol Storyboarded {
    static func instantiate(from storyboardName: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(from storyboardName: String) -> Self {
        let identifier = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        guard let controller = storyboard.instantiateViewController(withIdentifier: identifier) as? Self else{
            fatalError("Controller wasn't found")
        }
        return controller
    }
}
