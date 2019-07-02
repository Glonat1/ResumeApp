
import XCTest
@testable import ResumeApp

class EntitiesUnitTests: XCTestCase {
    
    func testExperienceEntityImplementsCodable(){
        let testBundle = Bundle(for:  type(of: self))
        guard let path = testBundle.path(forResource: "ProfileMock", ofType: "json") else {
            XCTFail(NSLocalizedString(LocalizedKeys.invalidPath.rawValue, comment: ""))
            return
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped) else {
            XCTFail(NSLocalizedString(LocalizedKeys.invalidTestData.rawValue, comment: ""))
            return
        }
        guard let profile: Profile = try? JSONDecoder().decode(Profile.self, from: data) else {
            XCTFail(LocalizedKeys.invalidModel.rawValue)
            return
        }
        XCTAssertEqual(profile.name, "Isaac Sanchez")
        XCTAssertEqual(profile.pictureURL, "https://i.ibb.co/LCH5y41/0.jpg")
    }
    
    func testSectionEntityImplementsCodable(){
        let testBundle = Bundle(for:  type(of: self))
        guard let path = testBundle.path(forResource: "SectionMock", ofType: "json") else {
            XCTFail(NSLocalizedString(LocalizedKeys.invalidPath.rawValue, comment: ""))
            return
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped) else {
            XCTFail(NSLocalizedString(LocalizedKeys.invalidTestData.rawValue, comment: ""))
            return
        }
        guard let profile: Section = try? JSONDecoder().decode(Section.self, from: data) else {
            XCTFail(NSLocalizedString(LocalizedKeys.invalidModel.rawValue, comment: ""))
            return
        }
        XCTAssertEqual(profile.title, "About me")
        XCTAssertEqual(profile.summary, "About me summary")
    }
}
