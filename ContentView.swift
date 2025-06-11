	//
	//  ContentView.swift
	//  ExpenseTracker
	//
	//  Created by Michael Arnold on 5/15/25.
	//

import SwiftUI
import SwiftData
import SwiftUICharts

struct ContentView: View {
	var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
	
	var body: some View {
		NavigationView {
			ScrollView {
				VStack(alignment: .leading, spacing: 24) {
						// MARK: Title
					Text("Overview")
						.font(.title2)
						.bold()
					
						// MARK: Chart
					CardView {
						VStack {
							ChartLabel("$900", type: .title)
							
							LineChart()
						}
						.background(Color.systemBackground)
					}
					.data(demoData)
					.chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.appIcon.opacity(0.4), Color.appIcon)))
					.frame(height: 300)
					
						// MARK: Transaction List
					RecentTransactionList()
				}
				.padding()
				.frame(maxWidth: .infinity)
			}
			.background(Color.appBackground)
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
					// MARK: Notification Icon
				ToolbarItem {
					Image(systemName: "bell.badge")
						.symbolRenderingMode(.palette)
						.foregroundStyle(Color.appIcon, .primary)
				}
			}
		}
		.navigationViewStyle(.stack)
		.accentColor(.primary)
	}
}

struct ContentView_Previews: PreviewProvider {
	static let transactionListVM: TransactionListViewModel = {
		let transactionListVM = TransactionListViewModel()
		transactionListVM.transactions = transactionListPreviewData
		return transactionListVM
	}()
	
	static var previews: some View {
		Group {
			ContentView()
			ContentView()
				.preferredColorScheme(.dark)
		}
		.environmentObject(transactionListVM)
		
	}
}
