//
//  LocationViewViewModel.swift
//  rick-and-morty
//
//  Created by Jackson Matheus on 16/12/23.
//

import Foundation


protocol LocationViewViewModelDelegate: AnyObject {
    func didFetchInitialLocations()
}


final class LocationViewViewModel {
    weak var delegate: LocationViewViewModelDelegate?
    
    public private(set) var cellViewModels: [LocationTableViewCellViewModel] = []
    
    public var isLoadingMoreLocations: Bool = false
    private var didFinishPagination: (() -> Void)?
    
    
    private var apiInfo: Info?
    private var locations: [Location] = [] {
        didSet {
            for locatio in locations {
                let cellViewModel = LocationTableViewCellViewModel(location: locatio)
                
                if !cellViewModels.contains(cellViewModel) {
                    cellViewModels.append(cellViewModel)
                }
            }
        }
    }
    
    
    public var shouldShowLoadMoreIndicator: Bool  {
        return apiInfo?.next != nil
    }
    
    public func location(at index: Int) -> Location? {
        guard index < locations.count, index >= 0 else {
            return nil
        }
        return self.locations[index]
    }
    
    init(){}
    
    public func registerDidFinishPagination(_ block: @escaping () -> Void){
        self.didFinishPagination = block
        
    }
    
    
    // TODO: this function will be finished after load all data from api
    //
    //
    public func fetchAdditionalLocations(){}
}



extension LocationViewViewModel: LocationViewViewModelDelegate {
    func didFetchInitialLocations() {
        Service.shared.execute(.listLocationsRequest, expecting: GetAllLocationsResponse.self) {
            [weak self] result in
            switch result {
            case .success(let response):
                self?.apiInfo = response.info
                self?.locations = response.results
                
                DispatchQueue.main.async {
                    self?.delegate?.didFetchInitialLocations()
                }
            case .failure(let error):
                print(error)
                
            }
        }
    }
    
    
}
