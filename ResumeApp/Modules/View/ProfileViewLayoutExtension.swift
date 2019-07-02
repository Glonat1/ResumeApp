
import UIKit

// MARK: - Profile View Layout
extension ProfileViewController {
    
    func createSubViewsWithConstraints() {
        // Top container
        let topContainer = UIView()
        topContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topContainer)
        topContainer.addSubview(profileImage)
        topContainer.addSubview(profileName)
        topContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        
        // Profile Image
        profileImage.heightAnchor.constraint(equalTo: topContainer.widthAnchor, multiplier: 0.75).isActive = true
        profileImage.widthAnchor.constraint(equalTo: topContainer.widthAnchor, multiplier: 0.75).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: topContainer.centerXAnchor).isActive = true
        profileImage.centerYAnchor.constraint(equalTo: topContainer.centerYAnchor).isActive = true
        
        // ProfileLabel
        profileName.widthAnchor.constraint(equalTo: topContainer.widthAnchor, multiplier: 0.8).isActive = true
        profileName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        profileName.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16).isActive = true
        profileName.centerXAnchor.constraint(equalTo: topContainer.centerXAnchor).isActive = true
    }
    
    func setupViewCorners() {
        profileImage.layer.cornerRadius = (profileImage.frame.size.width ) / 2
    }
}
