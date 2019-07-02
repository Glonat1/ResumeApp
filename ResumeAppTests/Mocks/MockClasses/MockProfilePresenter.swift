
import Foundation
@testable import ResumeApp

class MockProfilePresenter: ProfilePresenterInterface {
    
    var updateViewCalled = false
    var getImageCalled = false
    
    func updateView() {
        updateViewCalled = true
    }
    
    func getImage(imageURL: String) {
        getImageCalled = true
    }
}
