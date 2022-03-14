import UIKit

// MARK: protocol Parkable
protocol Parkable {
    var plate: String { get }
    var type: VehicleType { get }
    var checkInTime: Date { get }
    var discountCard: String? { get }
    var parkedTime: Int { get }
}

// MARK: struct Parking
struct Parking {
    var vehicles: Set<Vehicle> = [] // Property vehicles - it stores parked vehicles
    // MARK: Answer exercise 5.1
    let maxVehicles: Int = 20       // Determines the maximum number of vehicles in the parking lot
    
    // MARK: func checkInVehicle
    // Validates the maximum number of vehicles in the parking lot and that the license plate is not duplicated
    mutating func checkInVehicle(_ vehicle: Vehicle, onFinish: (Bool) -> Void) {
        // MARK: exercise 5.2
        guard vehicles.count < maxVehicles, vehicles.insert(vehicle).inserted else {
            onFinish(false)
            print("Sorry, the check-in failed")
            return
        }
        onFinish(true)
        print("Welcome to SuperParking!")
    }
}

// MARK: struct Vehicle
struct Vehicle: Parkable, Hashable {
    let plate: String           // Corresponds to the license plate of the vehicle.
    let type: VehicleType       // Corresponds to the type of the vehicle
    var checkInTime: Date       // Corresponds to the date of entry of the vehicle
    var discountCard: String?   // Corresponds to an optional vehicle discount card
    var parkedTime: Int {       // corresponds to the total in minutes of the stay of a vehicle
        Calendar.current.dateComponents([.minute], from: checkInTime, to: Date()).minute ?? 0 }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(plate)
    }
    static func ==(lhs: Vehicle, rhs: Vehicle) -> Bool {
        return lhs.plate == rhs.plate
    }
}

// MARK: enum VehicleType
enum VehicleType {
    case car, moto, miniBus, bus
    
    var feeForType: Int {
        switch self{
        case .car: return 20
        case .moto: return 15
        case .miniBus: return 25
        case .bus: return 30
        }
    }
}

// MARK: Parking set
var superParking = Parking()

//MARK: Entry of vehicles for checkIn validation
let vehicle1 = Vehicle(plate: "AA111AA", type: VehicleType.car, checkInTime: Date(), discountCard: "DISCOUNT_CARD_001")
let vehicle2 = Vehicle(plate: "B222BBB", type: VehicleType.moto, checkInTime: Date(), discountCard: nil)
let vehicle3 = Vehicle(plate: "CC333CC", type: VehicleType.miniBus, checkInTime: Date(), discountCard: nil)
let vehicle4 = Vehicle(plate: "DD444DD", type: VehicleType.bus, checkInTime: Date(), discountCard: "DISCOUNT_CARD_002")
let vehicle5 = Vehicle(plate: "AA111BB", type: VehicleType.car, checkInTime: Date(), discountCard: "DISCOUNT_CARD_003")
let vehicle6 = Vehicle(plate: "B222CCC", type: VehicleType.moto, checkInTime: Date(), discountCard: "DISCOUNT_CARD_004")
let vehicle7 = Vehicle(plate: "CC333DD", type: VehicleType.miniBus, checkInTime: Date(), discountCard: nil)
let vehicle8 = Vehicle(plate: "DD444EE", type: VehicleType.bus, checkInTime: Date(), discountCard: "DISCOUNT_CARD_005")
let vehicle9 = Vehicle(plate: "AA111CC", type: VehicleType.car, checkInTime: Date(), discountCard: nil)
let vehicle10 = Vehicle(plate: "B222DDD", type: VehicleType.moto, checkInTime: Date(), discountCard: nil)
let vehicle11 = Vehicle(plate: "CC333EE", type: VehicleType.miniBus, checkInTime: Date(), discountCard: nil)
let vehicle12 = Vehicle(plate: "DD444GG", type: VehicleType.bus, checkInTime: Date(), discountCard: "DISCOUNT_CARD_006")
let vehicle13 = Vehicle(plate: "AA111DD", type: VehicleType.car, checkInTime: Date(), discountCard: "DISCOUNT_CARD_007")
let vehicle14 = Vehicle(plate: "B222EEE", type: VehicleType.moto, checkInTime: Date(), discountCard: nil)
let vehicle15 = Vehicle(plate: "CC333FF", type: VehicleType.miniBus, checkInTime: Date(), discountCard: nil)
let vehicle16 = Vehicle(plate: "TT888PP", type: VehicleType.car, checkInTime: Date(), discountCard: "DISCOUNT_CARD_08")
let vehicle17 = Vehicle(plate: "YY453UU", type: VehicleType.miniBus, checkInTime: Date(), discountCard: nil)
let vehicle18 = Vehicle(plate: "OO111QQ", type: VehicleType.bus, checkInTime: Date(), discountCard: nil)
let vehicle19 = Vehicle(plate: "RR666EE", type: VehicleType.moto, checkInTime: Date(), discountCard: "DISCOUNT_CARD_009")
let vehicle20 = Vehicle(plate: "RR666EE", type: VehicleType.car, checkInTime: Date(), discountCard: nil)
let vehicle21 = Vehicle(plate: "GGG11MA", type: VehicleType.bus, checkInTime: Date(), discountCard: nil)
let vehicle22 = Vehicle(plate: "QQ77DE", type: VehicleType.miniBus, checkInTime: Date(), discountCard: "DISCOUNT_CARD_010")

// MARK: Vehicles check-In
superParking.checkInVehicle(vehicle1) { successfulEntry in successfulEntry ? true:false }
superParking.checkInVehicle(vehicle2) { successfulEntry in successfulEntry ? true:false }
superParking.checkInVehicle(vehicle3) { successfulEntry in successfulEntry ? true:false }
superParking.checkInVehicle(vehicle4) { successfulEntry in successfulEntry ? true:false }
superParking.checkInVehicle(vehicle5) { successfulEntry in successfulEntry ? true:false }
superParking.checkInVehicle(vehicle6) { successfulEntry in successfulEntry ? true:false }
superParking.checkInVehicle(vehicle7) { successfulEntry in successfulEntry ? true:false }
superParking.checkInVehicle(vehicle8) { successfulEntry in successfulEntry ? true:false }
superParking.checkInVehicle(vehicle9) { successfulEntry in successfulEntry ? true:false }
superParking.checkInVehicle(vehicle10) { successfulEntry in successfulEntry ? true:false }
superParking.checkInVehicle(vehicle11) { successfulEntry in successfulEntry ? true:false }
superParking.checkInVehicle(vehicle12) { successfulEntry in successfulEntry ? true:false }
superParking.checkInVehicle(vehicle13) { successfulEntry in successfulEntry ? true:false }
superParking.checkInVehicle(vehicle14) { successfulEntry in successfulEntry ? true:false }
superParking.checkInVehicle(vehicle15) { successfulEntry in successfulEntry ? true:false }
superParking.checkInVehicle(vehicle16) { successfulEntry in successfulEntry ? true:false }
superParking.checkInVehicle(vehicle17) { successfulEntry in successfulEntry ? true:false }
superParking.checkInVehicle(vehicle18) { successfulEntry in successfulEntry ? true:false }
superParking.checkInVehicle(vehicle19) { successfulEntry in successfulEntry ? true:false }
superParking.checkInVehicle(vehicle20) { successfulEntry in successfulEntry ? true:false }
superParking.checkInVehicle(vehicle21) { successfulEntry in successfulEntry ? true:false }
superParking.checkInVehicle(vehicle22) { successfulEntry in successfulEntry ? true:false }

