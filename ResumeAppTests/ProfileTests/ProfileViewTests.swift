
import XCTest
@testable import ResumeApp

class ProfileViewTests: XCTestCase {

    var sut: ProfileViewController?

    override func setUp() {
        // given
        sut = ProfileViewController.instantiate(from: "Profile")
    }
    
    func testProfileImageViewExists() {
        // when
        sut?.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut?.profileImage)
    }
    
    func testProfileNameLabelExists() {
        // when
        sut?.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut?.profileName)
    }
    
    func testSectionCollectionViewExists() {
        // when
        sut?.loadViewIfNeeded()
        // then
        XCTAssertNotNil(sut?.sectionCollectionView)
    }
    
    func testAboutCellIsNotNil() {
        // given
        let dummyAboutCellPresenter = AboutCellPresenter(aboutLabel: "I am a cool person")
        let testItem = 0
        let testIndexPath = IndexPath(item: testItem, section: 0)
        // when
        sut?.loadViewIfNeeded()
        sut?.aboutSection = dummyAboutCellPresenter
        guard let sectionCollectionView = sut?.sectionCollectionView else {
            XCTFail(NSLocalizedString(LocalizedKeys.sectionNil.rawValue, comment: ""))
            return
        }
        sectionCollectionView.register(UINib(nibName: "AboutDetailCell", bundle: nil), forCellWithReuseIdentifier: "AboutDetailCell")
        // then
        XCTAssertNotNil(sut?.collectionView(sectionCollectionView, cellForItemAt: testIndexPath) as? AboutDetailCell)
    }
    
    func testExperienceCellIsNotNil() {
        // given
        let dummyExperienceCellPresenter = ExperienceCellPresenter(company: "", start: "", end: "", designation: "")
        let testItem = 1
        let testIndexPath = IndexPath(item: testItem, section: 0)
        // when
        sut?.loadViewIfNeeded()
        sut?.experienceSection = [ExperienceCellPresenter](repeating: dummyExperienceCellPresenter, count: 3)
        guard let sectionCollectionView = sut?.sectionCollectionView else {
            XCTFail(NSLocalizedString(LocalizedKeys.sectionNil.rawValue, comment: ""))
            return
        }
        sectionCollectionView.register(UINib(nibName: "ExperienceDetailCell", bundle: nil), forCellWithReuseIdentifier: "ExperienceDetailCell")
        // then
        XCTAssertNotNil(sut?.collectionView(sectionCollectionView, cellForItemAt: testIndexPath) as? ExperienceDetailCell)
    }

    func testSkillsCellIsNotNil() {
        // given
        let dummySkillCellPresenter = SkillsCellPresenter(skill: "", time: "")
        let testItem = 2
        let testIndexPath = IndexPath(item: testItem, section: 0)
        // when
        sut?.loadViewIfNeeded()
        sut?.skillsSection = [SkillsCellPresenter](repeating: dummySkillCellPresenter, count: 4)
        guard let sectionCollectionView = sut?.sectionCollectionView else {
            XCTFail(NSLocalizedString(LocalizedKeys.sectionNil.rawValue, comment: ""))
            return
        }
        sectionCollectionView.register(UINib(nibName: "SkillsDetailCell", bundle: nil), forCellWithReuseIdentifier: "SkillsDetailCell")
        // then
        XCTAssertNotNil(sut?.collectionView(sectionCollectionView, cellForItemAt: testIndexPath) as? SkillsDetailCell)
    }
    
    func testInformationCellIsNotNil() {
        // given
        let dummyInformationCellPresenter = InformationCellPresenter(directionLabel: "", cellphoneLabel: "", emailLabel: "")
        let testItem = 3
        let testIndexPath = IndexPath(item: testItem, section: 0)
        // when
        sut?.loadViewIfNeeded()
        sut?.informationSection = dummyInformationCellPresenter
        guard let sectionCollectionView = sut?.sectionCollectionView else {
            XCTFail(NSLocalizedString(LocalizedKeys.sectionNil.rawValue, comment: ""))
            return
        }
        sectionCollectionView.register(UINib(nibName: "InformationDetailCell", bundle: nil), forCellWithReuseIdentifier: "InformationDetailCell")
        // then
        XCTAssertNotNil(sut?.collectionView(sectionCollectionView, cellForItemAt: testIndexPath) as? InformationDetailCell)
    }
   
    func testAboutCellAboutLabelIsNotNil() {
        // given
        let dummyAboutCellPresenter = AboutCellPresenter(aboutLabel: "I am a cool person")
        let testItem = 0
        let testIndexPath = IndexPath(item: testItem, section: 0)
        // when
        sut?.loadViewIfNeeded()
        sut?.aboutSection = dummyAboutCellPresenter
        guard let sectionCollectionView = sut?.sectionCollectionView else {
            XCTFail(NSLocalizedString(LocalizedKeys.sectionNil.rawValue, comment: ""))
            return
        }
        sectionCollectionView.register(UINib(nibName: "AboutDetailCell", bundle: nil), forCellWithReuseIdentifier: "AboutDetailCell")
        // then
        guard let cell = sut?.collectionView(sectionCollectionView, cellForItemAt: testIndexPath) as? AboutDetailCell else {
            XCTFail(NSLocalizedString(LocalizedKeys.cellNil.rawValue, comment: ""))
            return
        }
        XCTAssertNotNil(cell.aboutLabel)
    }
    
    func testExperienceLabelsNotNil() {
        // given
        let dummyExperienceCellPresenter = ExperienceCellPresenter(company: "", start: "", end: "", designation: "")
        let testItem = 1
        let testIndexPath = IndexPath(item: testItem, section: 0)
        // when
        sut?.loadViewIfNeeded()
        sut?.experienceSection = [ExperienceCellPresenter](repeating: dummyExperienceCellPresenter, count: 3)
        guard let sectionCollectionView = sut?.sectionCollectionView else {
            XCTFail(NSLocalizedString(LocalizedKeys.sectionNil.rawValue, comment: ""))
            return
        }
        sectionCollectionView.register(UINib(nibName: "ExperienceDetailCell", bundle: nil), forCellWithReuseIdentifier: "ExperienceDetailCell")
        // then
        guard let cell = sut?.collectionView(sectionCollectionView, cellForItemAt: testIndexPath) as? ExperienceDetailCell else {
            XCTFail(NSLocalizedString(LocalizedKeys.cellNil.rawValue, comment: ""))
            return
        }
        XCTAssertNotNil(cell.iceCodeSummary)
        XCTAssertNotNil(cell.uaqSummary)
        XCTAssertNotNil(cell.universitySummary)
    }
    
    func testExperienceLabelsShowsCorrectInformation() {
        // given
        let companyName = "Company name"
        let start = "2000"
        let end = "2001"
        let designation = "Programmer"
        let dummyExperienceCellPresenter = ExperienceCellPresenter(company: companyName, start: start, end: end, designation: designation)
        let testItem = 1
        let testIndexPath = IndexPath(item: testItem, section: 0)
        // when
        sut?.loadViewIfNeeded()
        sut?.experienceSection = [ExperienceCellPresenter](repeating: dummyExperienceCellPresenter, count: 3)
        guard let sectionCollectionView = sut?.sectionCollectionView else {
            XCTFail(NSLocalizedString(LocalizedKeys.sectionNil.rawValue, comment: ""))
            return
        }
        sectionCollectionView.register(UINib(nibName: "ExperienceDetailCell", bundle: nil), forCellWithReuseIdentifier: "ExperienceDetailCell")
        // then
        guard let cell = sut?.collectionView(sectionCollectionView, cellForItemAt: testIndexPath) as? ExperienceDetailCell else {
            XCTFail(NSLocalizedString(LocalizedKeys.cellNil.rawValue, comment: ""))
            return
        }
        XCTAssertEqual(cell.iceCodeSummary?.text, "\(start) - \(end)  \(designation)")
        XCTAssertEqual(cell.uaqSummary?.text, "\(start) - \(end)  \(designation)")
        XCTAssertEqual(cell.universitySummary?.text, "\(start) - \(end)  \(designation)")
    }
   
    func testSkillsLabelsNotNil() {
        // given
        let dummySkillsCellPresenter = SkillsCellPresenter(skill: "", time: "")
        let testItem = 2
        let testIndexPath = IndexPath(item: testItem, section: 0)
        // when
        sut?.loadViewIfNeeded()
        sut?.skillsSection = [SkillsCellPresenter](repeating: dummySkillsCellPresenter, count: 4)
        guard let sectionCollectionView = sut?.sectionCollectionView else {
            XCTFail(NSLocalizedString(LocalizedKeys.sectionNil.rawValue, comment: ""))
            return
        }
        sectionCollectionView.register(UINib(nibName: "SkillsDetailCell", bundle: nil), forCellWithReuseIdentifier: "SkillsDetailCell")
        // then
        guard let cell = sut?.collectionView(sectionCollectionView, cellForItemAt: testIndexPath) as? SkillsDetailCell else {
            XCTFail(NSLocalizedString(LocalizedKeys.cellNil.rawValue, comment: ""))
            return
        }
        XCTAssertNotNil(cell.javaSummary)
        XCTAssertNotNil(cell.androidSummary)
        XCTAssertNotNil(cell.swiftSummary)
        XCTAssertNotNil(cell.gitSummary)
    }
    
    func testSkillsLabelsShowsCorrectInformation() {
        // given
        let skillTime = "2 years"
        let dummySkillsCellPresenter = SkillsCellPresenter(skill: "", time: skillTime)
        let testItem = 2
        let testIndexPath = IndexPath(item: testItem, section: 0)
        // when
        sut?.loadViewIfNeeded()
        sut?.skillsSection = [SkillsCellPresenter](repeating: dummySkillsCellPresenter, count: 4)
        guard let sectionCollectionView = sut?.sectionCollectionView else {
            XCTFail(NSLocalizedString(LocalizedKeys.sectionNil.rawValue, comment: ""))
            return
        }
        sectionCollectionView.register(UINib(nibName: "SkillsDetailCell", bundle: nil), forCellWithReuseIdentifier: "SkillsDetailCell")
        // then
        guard let cell = sut?.collectionView(sectionCollectionView, cellForItemAt: testIndexPath) as? SkillsDetailCell else {
            XCTFail(NSLocalizedString(LocalizedKeys.cellNil.rawValue, comment: ""))
            return
        }
        XCTAssertEqual(cell.javaSummary?.text, skillTime)
        XCTAssertEqual(cell.androidSummary?.text, skillTime)
        XCTAssertEqual(cell.swiftSummary?.text, skillTime)
        XCTAssertEqual(cell.gitSummary?.text, skillTime)
    }
    
    func testInformationLabelsNotNil() {
        // given
        let dummyInformationCellPresenter = InformationCellPresenter(directionLabel: "", cellphoneLabel: "", emailLabel: "")
        let testItem = 3
        let testIndexPath = IndexPath(item: testItem, section: 0)
        // when
        sut?.loadViewIfNeeded()
        sut?.informationSection = dummyInformationCellPresenter
        guard let sectionCollectionView = sut?.sectionCollectionView else {
            XCTFail(NSLocalizedString(LocalizedKeys.sectionNil.rawValue, comment: ""))
            return
        }
        sectionCollectionView.register(UINib(nibName: "InformationDetailCell", bundle: nil), forCellWithReuseIdentifier: "InformationDetailCell")
        // then
        guard let cell = sut?.collectionView(sectionCollectionView, cellForItemAt: testIndexPath) as? InformationDetailCell else {
            XCTFail(NSLocalizedString(LocalizedKeys.cellNil.rawValue, comment: ""))
            return
        }
        XCTAssertNotNil(cell.emailLabel)
        XCTAssertNotNil(cell.cellphoneLabel)
        XCTAssertNotNil(cell.directionLabel)
    }
    
    func testInformationLabelsShowsCorrectInformation() {
        // given
        let directionText = "street 25"
        let cellphoneText = "55 5555 5556"
        let emailText = "myname@mail.com"
        let dummyInformationCellPresenter = InformationCellPresenter(directionLabel: directionText, cellphoneLabel: cellphoneText, emailLabel: emailText)
        let testItem = 3
        let testIndexPath = IndexPath(item: testItem, section: 0)
        // when
        sut?.loadViewIfNeeded()
        sut?.informationSection = dummyInformationCellPresenter
        guard let sectionCollectionView = sut?.sectionCollectionView else {
            XCTFail(NSLocalizedString(LocalizedKeys.sectionNil.rawValue, comment: ""))
            return
        }
        sectionCollectionView.register(UINib(nibName: "InformationDetailCell", bundle: nil), forCellWithReuseIdentifier: "InformationDetailCell")
        // then
        guard let cell = sut?.collectionView(sectionCollectionView, cellForItemAt: testIndexPath) as? InformationDetailCell else {
            XCTFail(NSLocalizedString(LocalizedKeys.cellNil.rawValue, comment: ""))
            return
        }
        XCTAssertEqual(cell.directionLabel?.text, directionText)
        XCTAssertEqual(cell.emailLabel?.text, emailText)
        XCTAssertEqual(cell.cellphoneLabel?.text, cellphoneText)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}
