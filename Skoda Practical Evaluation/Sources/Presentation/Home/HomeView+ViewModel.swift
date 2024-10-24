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
        
        
        // MARK: - Properties
        
        @Published var prepaidServices: [UserPrepaidService]?
        @Published var hideExpirationReminderBanner = false
        
        
        // MARK: - Computed properties
        
        var hasServiceExpiringInLessThanAMonth: Bool {
            guard let prepaidServices else {
                return false
            }
            
            guard let oneMonthFromNow = Calendar.current.date(byAdding: .month, value: 1, to: Date()) else {
                return false
            }
            
            return prepaidServices.contains { $0.expirationDate < oneMonthFromNow }
        }
        
        var prepaidServicesCount: Int {
            prepaidServices?.count ?? 0
        }
        
        var serviceExpiringInLessThanAMonthCount: Int {
            guard let prepaidServices else {
                return 0
            }
            
            guard let oneMonthFromNow = Calendar.current.date(byAdding: .month, value: 1, to: Date()) else {
                return 0
            }
            
            return prepaidServices.filter { $0.expirationDate < oneMonthFromNow }.count
        }
        
        
        // MARK: - Methods
        
        func fetchMyPrepaidServices() async {
            let prepaidServices = await getMyPrepaidServicesUseCase()
            
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
