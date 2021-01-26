//
//  StepsStatListView.swift
//  StepsStat
//
//  Created by ANDREY VORONTSOV on 26.01.2021.
//

import UIKit
import HealthKit

class StepsStatListView: UIViewController, StepsStatListViewProtocol {
    
    enum Section {
        case main
    }
    
    private var healthStore: HealthStore?
    
    private var steps: [Step] = []
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Step>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        healthStore = HealthStore()
        configureViewController()
        configureCollectionView()
        configureDataSource()
        fetchData()
    }
    
    func setTitle(_ title: String?) {
        //
    }
    
    func showLoading() {
        //
    }
    
    func hideLoading() {
        //
    }
    
    func reload() {
        //
    }
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(StepCell.self, forCellWithReuseIdentifier: StepCell.reuseID)
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Step>(collectionView: collectionView, cellProvider: {
            (collectionView, indexPath, step) -> UICollectionViewCell? in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StepCell.reuseID, for: indexPath) as! StepCell
            cell.set(step: step)
            return cell
        })
    }
    
    private func updateUI(with statistics: HKStatisticsCollection?) {
        if let statistics = statistics {
            let startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
            let endDate = Date()
            statistics.enumerateStatistics(from: startDate, to: endDate) { statistics, _ in
                let count = statistics.sumQuantity()?.doubleValue(for: .count())
                let step = Step(step: Int(count ?? 0), date: statistics.startDate)
                self.steps.append(step)
            }
        }
        self.updateData(on: self.steps)
    }
    
    private func fetchData() {
        if let healthStore = healthStore {
            healthStore.requestAuthorization { success in
                if success {
                    healthStore.calculateSteps { [self] statistics in
                        self.updateUI(with: statistics)
                    }
                }
            }
        }
    }
    
    private func updateData(on steps: [Step]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Step>()
        snapshot.appendSections([.main])
        snapshot.appendItems(steps)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension StepsStatListView: UICollectionViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        let offsetY = scrollView.contentOffset.y
//        let contentHeight = scrollView.contentSize.height
//        let height = scrollView.frame.size.height
//
//        if offsetY > contentHeight - height {
//            guard hasMoreFollowers, !isLoadingMoreFollowers else { return }
//            page += 1
//            fetchFollowers(for: username, page: page)
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}
