
import XCTest


class ResumeAppUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }
    
    func testProfileImageViewExists() {
        let profileImage = app.images[AccessibilityIdentifiers.ImageViews.profileImage.rawValue]
        XCTAssertTrue(profileImage.exists)
    }
    
    func testProfileNameLabelExists() {
        XCTAssertTrue(app.staticTexts[AccessibilityIdentifiers.Labels.profileName.rawValue].exists)
    }
    
    func testSectionsCollectionViewExists() {
        XCTAssertTrue(app.collectionViews.firstMatch.exists)
    }
    
    func testSectionsCollectionSwipesAllSections() {
        let sectionsCollectionView = app.collectionViews.firstMatch
        let cell = sectionsCollectionView.cells.firstMatch
        XCTAssertTrue(app.cells[AccessibilityIdentifiers.Cells.about.rawValue].exists)
        cell.swipeLeft()
        XCTAssertTrue(app.cells[AccessibilityIdentifiers.Cells.experience.rawValue].exists)
        cell.swipeLeft()
        XCTAssertTrue(app.cells[AccessibilityIdentifiers.Cells.skills.rawValue].exists)
        cell.swipeLeft()
        XCTAssertTrue(app.cells[AccessibilityIdentifiers.Cells.information.rawValue].exists)
    }
}


// MARK: - AccessibilityIdentifiers
struct AccessibilityIdentifiers {
    
    enum Cells: String {
        case experience = "experience_cell_id"
        case about = "about_cell_id"
        case skills = "skills_cell_id"
        case information = "information_cell_id"
    }
    
    enum Labels: String {
        case profileName = "profile_name_id"
    }
    
    enum ImageViews: String {
        case profileImage = "profile_image_id"
    }
}
