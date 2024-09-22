//
//  GreetingsVM.swift
//  MyAppWithMySPM
//
//  Created by Carlos Company on 22/9/24.
//

import Combine
import Foundation

@Observable
final class GreetingsVM {
    
    let useCase: NameUseCase
    
    var greetings = ""
    var name = ""  {
        didSet {
            self.nameSubject.send(name)
        }
    }
    
    private let nameSubject = PassthroughSubject<String, Never>()
    private var cancellables = Set<AnyCancellable>()
    
    init(useCase: NameUseCase = NameUseCase()) {
        self.useCase = useCase
        self.nameSubscription()
    }
    
    deinit {
        self.cancellables.forEach { $0.cancel() }
    }
    
    private func nameSubscription() {
        self.nameSubject
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { name in
                self.checkGreetings(name)
            }
            .store(in: &cancellables)
        self.nameSubject.send(self.name)
    }
    
    private func checkGreetings(_ name: String) {
        self.greetings = self.useCase.getHelloName(name)
    }
}
