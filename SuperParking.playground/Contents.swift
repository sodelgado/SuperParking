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
    let maxVehicles: Int = 20       // Determines the maximum number of vehicles in the parking lot
    
    // MARK: func checkInVehicle
    mutating func checkInVehicle(_ vehicle: Vehicle, onFinish: (Bool) -> Void) {
        guard vehicles.count < maxVehicles, vehicles.insert(vehicle).inserted else {
            onFinish(false)
            print("Sorry, the check-in failed")
            return
        }
        onFinish(true)
        print("Welcome to SuperParking!")
    }
    
    // MARK: Answer exercise 7
    // The checkout function must be mutating because being inside a struct it is assumed that it is immutable by default
    // MARK: func checkOutVehicle
    // Find vehicle plate and remove it when check out
    mutating func checkOutVehicle(_ plate: String, onSuccess: (Int) -> (), onError: () -> ()) {
        guard let vehicle = vehicles.first(where: { $0.plate == plate }) else {
            onError()
            return
        }
        vehicles.remove(vehicle)
        onSuccess(30)
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

// MARK: Entry of vehicles for check-In validation
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

// MARK: Insertion of vehicles in the array vehicles
let vehicles = [vehicle1, vehicle2, vehicle3, vehicle4, vehicle5, vehicle6, vehicle7, vehicle8, vehicle9, vehicle10, vehicle11, vehicle12, vehicle13, vehicle14, vehicle15, vehicle16, vehicle17, vehicle18, vehicle19, vehicle20, vehicle21, vehicle22]

// MARK: Vehicles Check-In
for vehicle in vehicles {
  superParking.checkInVehicle(vehicle) { successfulEntry in successfulEntry ? true:false }
}





