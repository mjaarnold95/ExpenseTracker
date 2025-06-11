//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Michael Arnold on 5/15/25.
//

import SwiftUI
import SwiftData

@main
struct ExpenseTrackerApp: App {
	@StateObject var transactionListVM = TransactionListViewModel()
	
	var body: some Scene {
		WindowGroup {
			ContentView()
				.environmentObject(transactionListVM)
		}
	}
}
