//
//  ViewController.swift
//  TaskN
//
//  Created by Satyaa Akana on 27/05/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let tableview: UITableView = {
           let tv = UITableView()
           tv.backgroundColor = UIColor.white
           tv.translatesAutoresizingMaskIntoConstraints = false
           return tv
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    func setupTableView() {
        tableview.register(ThirtyDayCell.self, forCellReuseIdentifier: "cellId")
        tableview.delegate = self
        tableview.dataSource = self
        view.addSubview(tableview)
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // 1
            return 10
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableview.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ThirtyDayCell
            cell.backgroundColor = UIColor.white
            return cell
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


class ThirtyDayCell: UITableViewCell {
    let cellView: UIView = {
           let view = UIView()
           view.backgroundColor = UIColor.red
           view.layer.cornerRadius = 10
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
       
       let dayLabel: UILabel = {
           let label = UILabel()
           label.text = "Day 1"
           label.textColor = UIColor.white
           label.font = UIFont.boldSystemFont(ofSize: 16)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
    
    let day2Label: UILabel = {
        let label = UILabel()
        label.text = "Day 2"
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(cellView)
        cellView.addSubview(dayLabel)
        cellView.addSubview(day2Label)
        self.selectionStyle = .none
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cellView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            cellView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        dayLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        dayLabel.widthAnchor.constraint(equalTo: cellView.widthAnchor, multiplier: 0.5, constant: 1).isActive = true
        //dayLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        dayLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        dayLabel.leftAnchor.constraint(equalTo: cellView.leftAnchor, constant: 20).isActive = true
        
        day2Label.heightAnchor.constraint(equalToConstant: 100).isActive = true
        day2Label.widthAnchor.constraint(equalTo: cellView.widthAnchor, multiplier: 0.5, constant: 1).isActive = true
        //dayLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        day2Label.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        day2Label.leadingAnchor.constraint(equalTo: dayLabel.trailingAnchor, constant: 20).isActive = true
        
    }
}
