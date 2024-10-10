//
//  ViewController.swift
//  CollectionInsideTableView
//
//  Created by Apple on 9/24/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    var edata = [EntertainmentApp(sectionType: "BOLLYWOOD MOVIES", imageGallary: ["b1","b2","b3","b4","b5"]),
                 EntertainmentApp(sectionType: "HOLLYWOOD MOVIES", imageGallary: ["h1","h2","h3","h4","h5"]),
                 EntertainmentApp(sectionType: "WEB SERIES", imageGallary: ["web1","web2","web3","web4","web5"])
    ]

    
    

    @IBOutlet var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        
        let nib = UINib(nibName: "demoTableViewCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "demoTableViewCell")
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        edata.count
    }
   
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return edata[section].sectionType
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "demoTableViewCell", for: indexPath) as! demoTableViewCell
        cell.array = edata[indexPath.section]
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .yellow
    }


}

