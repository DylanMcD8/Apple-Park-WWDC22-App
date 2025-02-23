//
//  ScheduleTableViewController.swift
//  Park WWDC
//
//  Created by Dylan McDonald on 6/4/22.
//

import UIKit

class ScheduleTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.window?.overrideUserInterfaceStyle = .dark
        self.navigationController?.overrideUserInterfaceStyle = .dark
        self.tabBarController?.overrideUserInterfaceStyle = .dark
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "Gradient"))
        tableView.backgroundView?.contentMode = .scaleToFill
                
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return scheduleTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Main Cell", for: indexPath) as! ColorfulTableViewCell

        cell.textLabel?.text = scheduleTimes[indexPath.section]
        cell.detailTextLabel?.text = scheduleTitles[indexPath.section]
        cell.imageView?.image = UIImage(systemName: scheduleImages[indexPath.section]) ?? UIImage(named: "Keynote")!

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsView = self.storyboard?.instantiateViewController(withIdentifier: "Details") as! DetailsTableViewController
        detailsView.indexToUse = indexPath.section
        self.show(detailsView, sender: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
        #if targetEnvironment(macCatalyst)
            updateTitleBar(withDelegate: ScheduleToolbarDelegate(), withTitle: "Schedule", withSubtitle: "", iconMode: .iconOnly, sender: self, session: (self.view.window?.windowScene?.session)!)
        #endif
        }
    }

    
}


let scheduleTitles = [
    "Check-In",
    "Apple Developer Center Open House",
    "Breakfast",
    "Keynote",
    "Lunch",
    "Platforms State of the Union",
    "Meet the Teams",
    tourName,
    "Apple Design Awards"
]

let scheduleImages = [
    "figure.wave",
    "binoculars",
    "fork.knife",
    "play.tv",
    "fork.knife",
    "play.tv",
    "person.3",
    "map",
    "cube"
]

let scheduleTimes = [
    "7:00 AM – 9:00 AM",
    "7:00 AM – 9:00 AM",
    "8:00 AM – 10:00 AM",
    "10:00 AM – 12:00 PM",
    "12:00 PM - 1:00 PM",
    "1:00 PM – 2:30 PM",
    "2:30 PM – 4:30 PM",
    tourTime,
    "4:30 PM – 5:00 PM"
]

let scheduleLocations = [
    "Apple Park Visitor Center",
    "Apple Developer Center",
    "Apple Park Caffè Macs",
    "Apple Park, Outside Caffè Macs",
    "Apple Park Caffè Macs",
    "Apple Park, Outside Caffè Macs",
    "Apple Park Caffè Macs",
   tourEntryLocation,
    "Apple Park, Outside Caffè Macs",
]

let scheduleDescs = [
    """
We encourage you to walk, bike, use a rideshare service, or take public transportation. You may drive, but parking will be limited. If arriving by rideshare, staff will help direct you from the drop-off location to the check-in area.
You’ll need to show your confirmation email for the event or the Wallet pass that will be emailed to you in order to enter the campus. Make sure to bring your valid government-issued photo ID for check in. If you’re between the ages of 13 and 17, you may present a valid passport or photo identification issued by an educational institution.
In order to help ensure the health of everyone at Apple Park, you’ll need to provide proof of your negative COVID-19 test conducted on June 5 or 6, before receiving your conference badge. Any CDC or FDA approved COVID-19 tests, including antigen tests, will be accepted.
For your convenience, we’re working with the Center for Toxicology and Environmental Health, LLC to allow you to submit proof of your negative test result before coming onsite. If you agreed to use this service during RSVP, use this link to submit your results starting June 5 at 6 a.m. PT, before receiving your event credential.
Alternatively, you may present your test results onsite for review. Please allow for extra time to complete this before checking in.
""",
    
    
    """
The Apple Developer Center is a world-class facility designed for our community to meet, collaborate with, and learn from our engineers, designers, and experts. Join us for a brief tour of the first floor, where you can explore dedicated developer lab areas, pods, briefing centers, and more. And don’t miss a peek at Big Sur — our state-of-the-art studio space — which will soon play host to in-person, live, and pre-recorded sessions created exclusively for our worldwide developer audience.
We can’t wait for you to experience it.
""",
    
    """
Breakfast will be available in Caffè Macs.

Visit the Website tab for the menu.
""",
    
    
    "The Apple Worldwide Developers Conference kicks off with exciting reveals, inspiration, and new opportunities.",
    

        """
Lunch will be available in Caffè Macs.

Visit the Website tab for the menu.
""",
    
    
    "Join the worldwide developer community for an in-depth look at the future of Apple platforms.",
    
    
   "Get to know some of the engineers, designers, and experts behind Apple’s software and services as you enjoy snacks and drinks at Caffè Macs.",
    
    tourDesc,
    
    "Join us in congratulating this year’s finalists and winners. The Apple Design Awards celebrate apps and games that excel in the categories of Inclusivity, Delight and Fun, Interaction, Social Impact, Visuals and Graphics, and Innovation."
    
]


class ColorfulTableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(named: "Secondary")
        let selectedBackView = UIView()
        selectedBackView.frame = self.frame
        selectedBackView.backgroundColor = UIColor(named: "Three")
        selectedBackView.clipsToBounds = true
        self.selectedBackgroundView = selectedBackView
    }
}
