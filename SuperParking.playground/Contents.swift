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
    
    // MARK: func checkInVehicle
    mutating func checkInVehicle(_ vehicle: Vehicle, onFinish: (Bool) -> Void) {
    }
}

// MARK: struct Vehicle
struct Vehicle: Parkable, Hashable {
    let plate: String           // Corresponds to the license plate of the vehicle.
    let type: VehicleType       // Corresponds to the type of the vehicle
    var checkInTime: Date       // Corresponds to the date of entry of the vehicle
    var discountCard: String?   // Corresponds to an optional vehicle discount card
    // MARK: Answer exercise 4:
    // Computed properties have the ability to be computed each time they are queried
    var parkedTime: Int {       // corresponds to the total in minutes of the stay of a vehicle
        Calendar.current.dateComponents([.minute], from: checkInTime, to: Date()).minute ?? 0}
    
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

// MARK: instances of the different vehicles to insert into the set
let car = Vehicle(plate: "AA111AA", type: VehicleType.car, checkInTime: Date(), discountCard: "DISCOUNT_CARD_001")
let moto = Vehicle(plate: "B222BBB", type: VehicleType.moto, checkInTime: Date(), discountCard: nil)
let miniBus = Vehicle(plate: "CC333CC", type: VehicleType.miniBus, checkInTime: Date(), discountCard: nil)
let bus = Vehicle(plate: "DD444DD", type: VehicleType.bus, checkInTime: Date(), discountCard: "DISCOUNT_CARD_002")

superParking.vehicles.insert(car)
superParking.vehicles.insert(moto)
superParking.vehicles.insert(miniBus)
superParking.vehicles.insert(bus)
 
// MARK: verify that the inserts were successful for console
// Comment out the inserts before running this
//print(superParking.vehicles.insert(car).inserted)  // true
//print(superParking.vehicles.insert(moto).inserted)  // true
//print(superParking.vehicles.insert(miniBus).inserted)// true
//print(superParking.vehicles.insert(bus).inserted)  // true

// MARK: verify the values are not duplicated
// Comment out all inserts before running this
//let car = Vehicle(plate: "AA111AA", type: VehicleType.car, checkInTime: Date(), discountCard: "DISCOUNT_CARD_001")
//let car2 = Vehicle(plate: "AA111AA", type: VehicleType.car, checkInTime: Date(), discountCard: "DISCOUNT_CARD_003")
//print(superParking.vehicles.insert(car).inserted)  // true
//print(superParking.vehicles.insert(car2).inserted)  // false

// MARK: verify that can be removed
//superParking.vehicles.remove(moto)
