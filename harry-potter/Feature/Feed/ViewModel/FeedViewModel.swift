//
//  FeedViewModel.swift
//  harry-potter
//
//  Created by Edilberto Ramos on 05/05/25.
//

import Foundation

class FeedViewModel: ObservableObject {
    
    enum ViewState {
        case fetching
        case loading
        case finished
    }
    
    @Published var allResults: [HPCharacter] = []
    @Published var studentResults: [HPCharacter] = []
    @Published var staffResults: [HPCharacter] = []
    @Published var errorMessage: String?
    @Published private(set) var viewState: ViewState?
    
    @Published var selectedFilter: ItemType = .all {
        didSet {
            print(selectedFilter)
            Task {
                switch selectedFilter {
                case .all:
                    await getAll()
                case .students:
                    await getStudents()
                case .staff:
                    await getIStaff()
                }
            }
        }
    }
    
    var isLoading: Bool {
        viewState == .loading
    }
    
    var filteredCharacters: [HPCharacter] {
        switch selectedFilter {
        case .all:
            return allResults
        case .students:
            return studentResults.filter { $0.hogwartsStudent }
        case .staff:
            return staffResults.filter { $0.hogwartsStaff }
        }
    }
    
    private let service: FeedServiceProtocol
    
    init(service: FeedServiceProtocol = FeedService()) {
        self.service = service
    }
    
    @MainActor
    func getAll() async {
        do {
            viewState = .loading
            let response = try await self.service.characters()
            viewState = .finished
            switch response.result {
            case .success(let results):
                self.allResults.append(contentsOf: results)
            case .failure(_):
                self.errorMessage = "There was a service failure!"
            }
        } catch {
            self.errorMessage = "There was a service failure!"
        }
    }
    
    @MainActor
    func getStudents() async {
        do {
            viewState = .loading
            let response = try await self.service.students()
            viewState = .finished
            switch response.result {
            case .success(let results):
                self.studentResults.append(contentsOf: results)
            case .failure(_):
                self.errorMessage = "There was a service failure!"
            }
        } catch {
            self.errorMessage = "There was a service failure!"
        }
    }
    
    @MainActor
    func getIStaff() async {
        do {
            viewState = .loading
            let response = try await self.service.staff()
            viewState = .finished
            switch response.result {
            case .success(let results):
                self.staffResults.append(contentsOf: results)
            case .failure(_):
                self.errorMessage = "There was a service failure!"
            }
        } catch {
            self.errorMessage = "There was a service failure!"
        }
    }
    
}
