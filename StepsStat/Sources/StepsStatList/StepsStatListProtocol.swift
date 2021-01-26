//
//  StepsStatListProtocol.swift
//  StepsStat
//
//  Created by ANDREY VORONTSOV on 26.01.2021.
//

import Foundation

protocol StepsStatListRouterProtocol: class {
    func showTerms(_ terms: String)
}

protocol StepsStatListPresenterProtocol: class {
    func viewLoaded()
    func didFetchStepsStatRequest(_ step: Step)
    func handleError(_ error: Error)
}

protocol StepsStatListInteractorProtocol: class {
    func fetchStepsStat()
}

protocol StepsStatListViewProtocol: class {
    func setTitle(_ title: String?)
    func showLoading()
    func hideLoading()
    func reload()
}
