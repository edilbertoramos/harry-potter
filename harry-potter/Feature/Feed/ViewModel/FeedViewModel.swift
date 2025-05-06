//
//  FeedViewModel.swift
//  harry-potter
//
//  Created by Edilberto Ramos on 05/05/25.
//

import SwiftUI

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
    
    @Published var selectedFilter: CharacterType = .all {
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
            withAnimation { viewState = .loading }
            let response = try await self.service.characters()
            withAnimation { viewState = .finished }
            switch response.result {
            case .success(let results):
                self.allResults = results
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
            withAnimation { viewState = .loading }
            let response = try await self.service.students()
            withAnimation { viewState = .finished }
            switch response.result {
            case .success(let results):
                self.studentResults = results
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
            withAnimation { viewState = .loading }
            let response = try await self.service.staff()
            withAnimation { viewState = .finished }
            switch response.result {
            case .success(let results):
                self.staffResults = results
            case .failure(_):
                self.errorMessage = "There was a service failure!"
            }
        } catch {
            self.errorMessage = "There was a service failure!"
        }
    }
    
}
