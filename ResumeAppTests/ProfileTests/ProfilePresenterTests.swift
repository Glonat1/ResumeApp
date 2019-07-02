
import XCTest
@testable import ResumeApp

class ProfilePresenterTests: XCTestCase {
    
    var view: MockProfileView?
    var sut: ProfilePresenter?
    var interactor: MockProfileInteractor?

    override func setUp() {
        view = MockProfileView()
        interactor = MockProfileInteractor()
        guard let view = view else {
            XCTFail("View is nil")
            return
        }
        guard let interactor = interactor else {
            XCTFail("Interactor is nil")
            return
        }
        sut = ProfilePresenter(view: view, interactor: interactor)
    }
    
    override func tearDown() {
        super.tearDown()
        view = nil
        interactor = nil
        sut = nil
    }

    func testFetchImageCalled(){
        sut?.getImage(imageURL: "image.com")
        XCTAssertTrue(interactor?.fetchImageCalled ?? false)
    
    }
    
    func testFetchProfileInfoCalled(){
        sut?.updateView()
        XCTAssertTrue(interactor?.fetchProfileInfoCalled ?? false)
    }
}
