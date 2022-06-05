//
//  DetailsTableViewController.swift
//  Park WWDC
//
//  Created by Dylan McDonald on 6/4/22.
//

import UIKit

class DetailsTableViewController: UITableViewController {

    var indexToUse: Int = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = scheduleTitles[indexToUse]
        timeLabel.text = scheduleTimes[indexToUse]
        locationLabel.text = scheduleLocations[indexToUse]
        descriptionLabel.text = scheduleDescs[indexToUse]
        iconImage.image = UIImage(systemName: scheduleImages[indexToUse]) ?? UIImage(named: "Keynote")!
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "Gradient"))
        tableView.backgroundView?.contentMode = .scaleToFill
    }
    
  
    @objc func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
        #if targetEnvironment(macCatalyst)
            updateTitlebarSubtitle(with: "Event Details", session: (self.view.window?.windowScene?.session)!)
        #endif
        }
    }
  
    func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.removeFromSuperlayer()
        
        let colorTop =  UIColor(red: 16/255.0, green: 22/255.0, blue: 39/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 3/255.0, green: 8/255.0, blue: 21/255.0, alpha: 1.0).cgColor
                    
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
