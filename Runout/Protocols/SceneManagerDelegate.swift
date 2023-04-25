//
//  SceneManagerDelegate.swift
//  Runout
//


import Foundation

protocol SceneManagerDelegate {
    func presentLevelScene()
    func presentGameScene(for level: Int)
    func presentMenuScene()
}
