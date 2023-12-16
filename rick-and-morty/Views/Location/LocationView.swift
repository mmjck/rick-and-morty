//
//  Location.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 13/12/23.
//

import Foundation
import UIKit

protocol LocationViewDelegate: AnyObject {
    func removeLocationView(_ location: LocationView, didSelect location: Location)
}



final class LocationView: UIView
{
    public weak var delegate: LocationViewDelegate?
    
    
    private var viewModel: LocationViewViewModel? {
        didSet {
            spinner.stopAnimating()
            tableView.isHidden = false
            tableView.reloadData()
            UIView.animate(withDuration: 0.5){
                self.tableView.alpha = 1
            }
            viewModel?.registerDidFinishPagination {
                [weak self]
                in DispatchQueue.main.async {
                    self?.tableView.tableFooterView = nil
                    // Reload data
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.alpha = 0
        table.isHidden = true
        table.register(LocationTableViewCell.self, forCellReuseIdentifier: LocationTableViewCell.identifier)
        return table
    }()
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        return spinner
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        spinner.startAnimating()
        
        self.configureTable()
        self.addConstraints()
    }
    
  required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LocationView {
    private func setupUI(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        
        addSubview(tableView)
        addSubview(spinner)
        
        
    }
    private func configureTable(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension LocationView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let locationModel = viewModel?.location(at: indexPath.row) else {
            return
        }
        delegate?.removeLocationView(self, didSelect: locationModel)
        
    }
    
    
}



extension LocationView: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.cellViewModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellViewModels = viewModel?.cellViewModels  else {
            fatalError()
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.identifier, for: indexPath) as? LocationTableViewCell
        else {
            fatalError()
        }
        
        
        
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
    
}



