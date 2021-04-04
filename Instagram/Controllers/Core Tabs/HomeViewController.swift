//
//  ViewController.swift
//  Instagram
//
//  Created by Omar Zakaria on /253/21.
//
import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {
    
    //MARK:- Variables and Constants
    private let tableView : UITableView = {
        let tableView = UITableView()
        // register the cell I just created
        tableView.register(IGFeedPostTableViewCell.self, forCellReuseIdentifier: IGFeedPostTableViewCell.identifier)
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // assign frames
        tableView.frame = view.bounds
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         handleNotAuthenticated()
       
    }
    
    private func handleNotAuthenticated(){
        // Check the status
        if Auth.auth().currentUser == nil{
            // show log in
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen // that way user cant swipe it away 
            
            present(loginVC, animated: false)
        }
    }
    

}

//MARK:- UITableViewDelegate and Datasource
extension HomeViewController: UITableViewDelegate , UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostTableViewCell.identifier, for: indexPath) as! IGFeedPostTableViewCell
        
        return cell
    }
}
