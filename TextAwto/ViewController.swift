//
//  ViewController.swift
//  TextAwto
//
//  Created by Kevin Amador Rios on 11/11/22.
//

import UIKit

class ViewController: UIViewController {

    //Settings views
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    
    //Access to ViewModel
    var viewModel = ViewModel()
    var flags:[FlagsContents] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        
        //Creating pull button
        configureView()
        bindData()
        CreateNavbarButton()
    }

    func configureView() {
        activity.startAnimating()
        viewModel.fetchDataFromApis()
    }
    
    fileprivate func CreateNavbarButton() {
        navigationController?.navigationBar.tintColor = .lightGray
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Pull", style: .plain, target: self, action: #selector(updateJokes))
    }
    
    func bindData() {
        viewModel.refreshData = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.activity.stopAnimating()
                self?.activity.isHidden = true
            }
        }
    }
    
    
    //Trigger
    @IBAction func updateJokes(_ sender: Any) {
        activity.startAnimating()
        viewModel.fetchDataFromApis()
        flags.append(viewModel.dataArray!.flags)
    }

}

@available(iOS 14.0, *)
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //Check if type is single and joke is not empty
        if viewModel.dataArray?.type == "single" || viewModel.dataArray?.joke != nil {
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.textColor = .black
            cell.textLabel?.text = viewModel.dataArray?.joke
            
            cell.detailTextLabel?.textColor = .black
            cell.detailTextLabel?.numberOfLines = 0
            cell.detailTextLabel?.text = "Flags"
        }
        
        
        return cell
    }
}
