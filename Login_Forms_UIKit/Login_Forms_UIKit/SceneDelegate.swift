//
//  SceneDelegate.swift
//  Login_Forms_UIKit
//
//  Created by Ana Clara Filgueiras Granato on 01/10/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Garantir que a cena passada seja uma instância de UIWindowScene
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Criar a janela manualmente
        window = UIWindow(windowScene: windowScene)
        
        // Definir o LoginViewController como a tela inicial
        let loginViewController = LoginViewController()
        let navigationController = UINavigationController(rootViewController: loginViewController)
        
        // Definir o controlador raiz da janela
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Chamado quando a cena está sendo liberada pelo sistema.
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Chamado quando a cena se torna ativa.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Chamado quando a cena vai mudar para um estado inativo.
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Chamado enquanto a cena transita do fundo para o primeiro plano.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Chamado enquanto a cena transita do primeiro plano para o fundo.
    }
}

