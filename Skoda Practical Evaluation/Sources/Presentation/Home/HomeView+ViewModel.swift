//
//  HomeView+ViewModel.swift
//  Skoda Practical Evaluation
//
//  Created by Daniel Gabzdyl on 22.10.2024.
//

import Foundation


extension HomeView {
    
    class ViewModel: ObservableObject {
        
        // MARK: - UseCases
        
        private let getMyPrepaidServicesUseCase = inject(GetMyPrepaidServicesUseCase.self)
        private let getAllPrepaidServicesUseCase = inject(GetAllPrepaidServicesUseCase.self)
        
        
        // MARK: - Properties
        
        @Published var prepaidServices: [PrepaidService]?
        @Published var myPrepaidServices: [UserPrepaidService]?
        @Published var hideExpirationReminderBanner = false
        
        
        // MARK: - Computed properties
        
        var hasServiceExpiringInLessThanAMonth: Bool {
            guard let myPrepaidServices else {
                return false
            }
            
            guard let oneMonthFromNow = Calendar.current.date(byAdding: .month, value: 1, to: Date()) else {
                return false
            }
            
            return myPrepaidServices.contains { $0.expirationDate < oneMonthFromNow && !$0.expired && $0.expirationDate > Date() }
        }
        
        var allPrepareidServicesCount: Int {
            prepaidServices?.count ?? 0
        }
        
        var myPrepaidServicesCount: Int {
            myPrepaidServices?.filter({ !$0.expired }).count ?? 0
        }
        
        var serviceExpiringInLessThanAMonthCount: Int {
            guard let myPrepaidServices else {
                return 0
            }
            
            guard let oneMonthFromNow = Calendar.current.date(byAdding: .month, value: 1, to: Date()) else {
                return 0
            }
            
            return myPrepaidServices.filter { $0.expirationDate < oneMonthFromNow && !$0.expired && $0.expirationDate > Date() }.count
        }
        
        
        // MARK: - Methods
        
        func fetchMyPrepaidServices() async {
            let prepaidServices = await getMyPrepaidServicesUseCase()
            
            switch prepaidServices {
            case .success(let prepaidServices):
                await MainActor.run {
                    self.myPrepaidServices = prepaidServices
                }
            default:
                break
            }
        }
        
        func fetchAllPrepaidServices() async {
            let prepaidServices = await getAllPrepaidServicesUseCase()
            
            switch prepaidServices {
            case .success(let prepaidServices):
                await MainActor.run {
                    self.prepaidServices = prepaidServices
                }
            default:
                break
            }
        }
    }
}
