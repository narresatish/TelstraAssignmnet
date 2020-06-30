//
//  ViewController.swift
//  TelstraAssignmnet
//
//  Created by SATISH KUMAR on 29/06/20.
//  Copyright © 2020 self. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
    
    // Class Varibles
    var viewModel = ViewModel()
    internal let refreshCtrl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.rowHeight = 110;
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.refreshControl = refreshCtrl
        refreshControl?.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        registerCell()
       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         pageSetup()
    }
    
    // Initial page settings
    func pageSetup()  {
        tableView.separatorInset = .zero
        self.startActivityIndicator()
        // API calling from viewmodel class
        self.viewModel.fetchData()
        self.closureSetUp()
        self.stopActivityIndicator()
    }
    
    @objc private func refreshData(_ sender: Any) {
        // Fetch Weather Data
        self.viewModel.fetchData()
    }
    
    // Closure initialize
    func closureSetUp()  {
        viewModel.reloadList = { [weak self] ()  in
            ///UI chnages in main tread
            DispatchQueue.main.async {
                if let title = self?.viewModel.modelData?.title{
                    self?.title = title
                }
                self?.tableView.reloadData()
                self?.stopActivityIndicator()
                if (self?.refreshCtrl.isRefreshing == true){
                               self?.refreshCtrl.endRefreshing()
                           }
            }
           
        }
        viewModel.errorMessage = { [weak self] (message)  in
            DispatchQueue.main.async {
                self?.stopActivityIndicator()
                self?.showAlertWithMessage(message: message)
                if (self?.refreshCtrl.isRefreshing == true){
                    self?.refreshCtrl.endRefreshing()
                }
            }
        }
        
    }
    
    func registerCell(){
        tableView.register(TableCell.self, forCellReuseIdentifier: "DefaultCell")
    }
    
    
}


extension HomeController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.modelData?.rows.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell") as! TableCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        if let modelRows = self.viewModel.modelData?.rows[indexPath.row] {
            cell.setData(data: modelRows)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
}
