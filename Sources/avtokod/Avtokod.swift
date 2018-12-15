import Vapor
import Foundation

public class Avtokod: Service {
    let baseURL = "https://b2bapi.avtocod.ru/b2b/api/v1/"
    
    public let user, password: String
    let webhook: String?
    var token: Token?
    
    // MARK: Initialization
    
    public init(user: String, password: String, webhook: String?) {
        self.user = user
        self.password = password
        self.webhook = webhook
    }
    
    //MARK: - Gateways
    
    public func dev(on container: Container) -> DevGateway {
        return DevGateway(on: container, root: self)
    }
    
    public func domain(on container: Container) -> DomainGateway {
        return DomainGateway(on: container, root: self)
    }
    
    public func pwd(on container: Container) -> PwdGateway {
        return PwdGateway(on: container, root: self)
    }
    
    public func system(on container: Container) -> SystemGateway {
        return SystemGateway(on: container, root: self)
    }
    
    public func user(on container: Container) -> UserGateway {
        return UserGateway(on: container, root: self)
    }
}
