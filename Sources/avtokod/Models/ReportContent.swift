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
    public var identifiers: Identifiers
    public struct RegistrationActions: Codable {
        public var items: [RegistrationAction]
    }
    public var registration_actions: RegistrationActions
    public struct CarPrice: Codable {
        public var items: [CarPriceItem]
    }
    public var car_price: CarPrice
    public struct Fines: Codable {
        public var items: [Fine]
    }
    public var fines: Fines?
    public struct Customs: Codable {
        public struct History: Codable {
            public var items: [CustomsHistoryItem]
        }
        public var history: History
    }
    public var customs: Customs?
    public struct Pledges: Codable {}
    public var pledges: Pledges
    public struct Insurance: Codable {
        public struct Osago: Codable {}
        public var osago: Osago
    }
    public var insurance: Insurance?
    public struct Accidents: Codable {
        public struct History: Codable {}
        public var history: History
    }
    public var accidents: Accidents?
    public struct Restrictions: Codable {
        public struct RegistrationActions: Codable {}
        public var registration_actions: RegistrationActions
    }
    public var restrictions: Restrictions?
    public struct Stealings: Codable {}
    public var stealings: Stealings?
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
    public var ownership: Ownership?
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
    public var mileages: Mileages?
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
    public var diagnostic_cards: DiagnosticCards?
    public struct Utilizations: Codable {}
    public var utilizations: Utilizations?
    public struct TechData: Codable {
        public struct Brand: Codable {
            public struct Name: Codable {
                public var original, normalized: String
            }
            public var name: Name
            public var id: String
        }
        public var brand: Brand
        public struct RCType: Codable {
            public var name: String
        }
        public var type: RCType
        public struct Body: Codable {
            public struct Color: Codable {
                public var name, type: String
            }
            public var color: Color
            public var number: String
        }
        public var body: Body
        public var year: Int
        public struct Engine: Codable {
            public struct Fuel: Codable {
                public var type: String
            }
            public var fuel: Fuel
            public var volume: Int64
            public struct Power: Codable {
                public var hp, kw: Double
            }
            public var power: Power
            public var number: String
            public struct Model: Codable {
                public var name: String
            }
            public var model: Model
        }
        public var engine: Engine
        public struct Weight: Codable {
            public var netto, max: Double
        }
        public var weight: Weight
        public struct Drive: Codable {
            public var type: String
        }
        public var drive: Drive
        public struct Wheel: Codable { //руль
            public enum Position: String, Codable {
                case left = "LEFT"
                case right = "RIGHT"
            }
            public var position: Position
        }
        public var wheel: Wheel
        public struct Model: Codable {
            public var id: String
            public struct Name: Codable {
                public var normalized, original: String
            }
            public var name: Name
        }
        public var model: Model
    }
    public var tech_data: TechData?
    public struct AdditionalInfo: Codable {
        public struct Vehicle: Codable {
            public struct Category: Codable {
                public var code: String
            }
            public var category: Category
            public struct Date: Codable {
                public var receive: String
            }
            public struct Passport: Codable {
                public var date: Date
                public var number: String
            }
            public var passport: Passport
            public struct Sts: Codable {
                public var date: Date
            }
            public var sts: Sts
        }
        public var vehicle: Vehicle
    }
    public var additional_info: AdditionalInfo?
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
    public var calculate: Calculate?
}
