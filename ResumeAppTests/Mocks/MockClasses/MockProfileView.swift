
import Foundation
@testable import ResumeApp

// MARK: MockProfileView
class MockProfileView: ProfileViewInterface {
    
    // MARK: - Mocked Properties
    var experienceSection: [ExperienceCellPresenter]?
    var skillsSection: [SkillsCellPresenter]?
    var informationSection: InformationCellPresenter?
    var aboutSection: AboutCellPresenter?
    var showProfileInfoCalled = false
    var showNetworkingErrorCalled = false
    var imageFromDataCalled = false
    
    // MARK: - Mocked Methods
    func showProfileInfo(with profileInfo: Profile){
        showProfileInfoCalled = true
    }
    func showNetworkingError(){
        showNetworkingErrorCalled = true
    }
    func imageFromData(data: Data){
        imageFromDataCalled = true
    }
}
