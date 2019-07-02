
import UIKit

//MARK: UICollectionViewDataSource Extension
extension ProfileViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionsCount = 4
        pageController?.numberOfPages = sectionsCount
        return sectionsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.item {
        case CellConstants.ResumeDetailSection.about.rawValue:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellConstants.Identifier.about.rawValue, for: indexPath) as? AboutDetailCell,
                let aboutLabel = cell.aboutLabel
                else {
                    return UICollectionViewCell()
            }
            aboutLabel.text = aboutSection?.aboutLabel
            cell.accessibilityIdentifier = AccessibilityIdentifiers.Cells.about.rawValue
            
            return cell
        case CellConstants.ResumeDetailSection.experience.rawValue:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellConstants.Identifier.experience.rawValue, for: indexPath) as? ExperienceDetailCell,
                let experienceSection = experienceSection,
                let iceCodeSummary = cell.iceCodeSummary,
                let uaqSummary = cell.uaqSummary,
                let universitySummary = cell.universitySummary else {
                    fatalError()
            }
            
            iceCodeSummary.text = experienceSection[0].formatedInfo
            uaqSummary.text = experienceSection[1].formatedInfo
            universitySummary.text = experienceSection[2].formatedInfo
            cell.accessibilityIdentifier = AccessibilityIdentifiers.Cells.experience.rawValue
            
            return cell
        case CellConstants.ResumeDetailSection.skills.rawValue:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellConstants.Identifier.skills.rawValue, for: indexPath) as? SkillsDetailCell,
                let skillsSection = skillsSection,
                let javaSummary = cell.javaSummary,
                let gitSummary = cell.gitSummary,
                let androidSummary = cell.androidSummary,
                let swiftSummary = cell.swiftSummary else {
                    fatalError()
            }
            
            javaSummary.text = skillsSection[0].time
            gitSummary.text = skillsSection[1].time
            androidSummary.text = skillsSection[2].time
            swiftSummary.text = skillsSection[3].time
            cell.accessibilityIdentifier = AccessibilityIdentifiers.Cells.skills.rawValue
            
            return cell
        case CellConstants.ResumeDetailSection.information.rawValue:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellConstants.Identifier.information.rawValue, for: indexPath) as? InformationDetailCell,
                let informationSection = informationSection,
                let cellPhoneLabel = cell.cellphoneLabel,
                let directionLabel = cell.directionLabel,
                let emailLabel = cell.emailLabel else {
                    fatalError()
            }
            
            cellPhoneLabel.text = informationSection.cellphoneLabel
            directionLabel.text = informationSection.directionLabel
            emailLabel.text = informationSection.emailLabel
            cell.accessibilityIdentifier = AccessibilityIdentifiers.Cells.information.rawValue
            
            return cell
        default:
            fatalError(NSLocalizedString(LocalizedKeys.noSectionFound.rawValue, comment: ""))
        }
    }
}

