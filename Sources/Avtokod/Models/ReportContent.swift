//
//  ReportContent.swift
//  Avtokod
//
//  Created by Mihael Isaev on 15/12/2018.
//

import Foundation

public struct ReportContent: Codable {
    public struct Identifiers: Codable {
        public var vehicle: Vehicle
    }
    public struct RegistrationActions: Codable {
        public var items: [RegistrationAction]?
    }
    public struct CarPrice: Codable {
        public var items: [CarPriceItem]
    }
    public struct Fines: Codable {
        public var items: [Fine]
    }
    public struct Customs: Codable {
        public struct History: Codable {
            public var items: [CustomsHistoryItem]
        }
        public var history: History
    }
    public struct Pledges: Codable {}
    public struct Insurance: Codable {
        public struct Osago: Codable {}
        public var osago: Osago
    }
    public struct Accidents: Codable {
        public struct History: Codable {
            public struct HistoryItem: Codable {}
            public var items: [HistoryItem]?
        }
        public var history: History
    }
    public struct Restrictions: Codable {
        public struct RegistrationActions: Codable {
            public struct RegistrationActionItem: Codable {}
            public var items: [RegistrationActionItem]?
        }
        public var registration_actions: RegistrationActions
    }
    public struct Stealings: Codable {
        public struct StealingItem: Codable {}
        public var items: [StealingItem]?
    }
    public struct Ownership: Codable {
        public struct History: Codable {
            public struct Ownership: Codable {
                public struct Date: Codable {
                    var start: String
                    var end: String?
                }
                public var date: Date
                public var owner: Owner
            }
            public var items: [Ownership]
        }
        public var history: History
    }
    public struct Mileages: Codable {
        public struct MileageItem: Codable {
            public struct Date: Codable {
                public var event: String
            }
            public var date: Date
            public var mileage: Int64
        }
        public var items: MileageItem
    }
    public struct DiagnosticCards: Codable {
        public struct Item: Codable {
            public struct Date: Codable {
                public var from, to: String
            }
            public var date: Date
            public struct Doc: Codable {
                public var number, type: String
            }
            public var doc: Doc
            public var reg_num: String
        }
        public var items: [Item]
    }
    public struct Utilizations: Codable {}
    public struct TechData: Codable {
        public struct Brand: Codable {
            public struct Name: Codable {
                public var original, normalized: String
            }
            public var name: Name
            public var id: String
        }
        public struct RCType: Codable {
            public var name: String
        }
        public struct Body: Codable {
            public struct Color: Codable {
                public var name, type: String
            }
            public var color: Color
            public var number: String
        }
        public struct Engine: Codable {
            public struct Fuel: Codable {
                public var type: String
            }
            public struct Power: Codable {
                public var hp, kw: Double
            }
            public struct Model: Codable {
                public var name: String
            }
            public var fuel: Fuel
            public var volume: Double
            public var power: Power
            public var number: String?
            public var model: Model?
        }
        public struct Weight: Codable {
            public var netto, max: Double
        }
        public struct Drive: Codable {
            public var type: String
        }
        public struct Wheel: Codable { //руль
            public var position: String
        }
        public struct Model: Codable {
            public var id: String
            public struct Name: Codable {
                public var normalized, original: String
            }
            public var name: Name
        }
        
        public var brand: Brand
        public var type: RCType
        public var body: Body
        public var year: Int
        public var engine: Engine
        public var weight: Weight
        public var drive: Drive
        public var wheel: Wheel
        public var model: Model
    }
    public struct AdditionalInfo: Codable {
        public struct Vehicle: Codable {
            public struct Category: Codable {
                public var code: String
            }
            public struct Date: Codable {
                public var receive: String
            }
            public struct Passport: Codable {
                public var date: Date
                public var number: String
            }
            public struct Sts: Codable {
                public var date: Date
            }
            public var category: Category?
            public var passport: Passport?
            public var sts: Sts?
        }
        public var vehicle: Vehicle
    }
    public struct Calculate: Codable {
        public struct Osago: Codable {
            public struct Price: Codable {
                public struct City: Codable {
                    public struct Yearly: Codable {
                        public var amount: Double
                    }
                    public var yearly: Yearly?
                }
                public var moscow: City?
            }
            public var price: Price?
        }
        public var osago: Osago?
    }
    
    public var identifiers: Identifiers
    public var registration_actions: RegistrationActions
    public var car_price: CarPrice?
    public var fines: Fines?
    public var customs: Customs?
    public var pledges: Pledges?
    public var insurance: Insurance?
    public var accidents: Accidents?
    public var restrictions: Restrictions?
    public var stealings: Stealings?
    public var ownership: Ownership?
    public var mileages: Mileages?
    public var diagnostic_cards: DiagnosticCards?
    public var utilizations: Utilizations?
    public var tech_data: TechData?
    public var additional_info: AdditionalInfo?
    public var calculate: Calculate?
}
