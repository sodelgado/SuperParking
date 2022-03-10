import UIKit

//MARK: protocol Parkable

// MARK: Answer exercise 3.1:
// As Vehicle implements Parkable protocol, the properties must be added in both
// MARK: Answer exercise 3.2:
// All data types can be optional
// MARK: Answer exercise 4:
// Computed properties have the ability to be computed each time they are queried
protocol Parkable {
    var plate: String { get }
    var type: VehicleType { get  }
    var checkInTime: Date { get }
    var discountCard: String? { get }
    var parkedTime: Int { get }
}


// MARK: struct Parking - represents the parking
// Property vehicles - it stores parked vehicles
// MARK: Aswer exercise 1:
// Why is it defined as a set? -> because it doesn't allow repeating values
struct Parking {
    var vehicles: Set<Vehicle> = []
    
    mutating func checkInVehicle(_ vehicle: Vehicle, onFinish: (Bool) -> Void) {

    }
}

// MARK: Struct Vehicle - implements Hashable protocol, used to uniquely identify elements.
//    MARK: Answer exercise 2.2:
//    type is a constant because Vehicle can't changes his VehicleType
struct Vehicle: Parkable, Hashable {
    let plate: String // Corresponds to the license plate of the vehicle.
    let type: VehicleType
    var checkInTime: Date
    var discountCard: String?
    
    var parkedTime: Int {
        Calendar.current.dateComponents([.minute], from: checkInTime, to: Date()).minute ?? 0 }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(plate)
    }
    static func ==(lhs: Vehicle, rhs: Vehicle) -> Bool {
        return lhs.plate == rhs.plate
    }
}

// MARK: enum VehicleType - determines vehicle type and initial fee
//        Switch is used for flow control because it evaluates each case of the enum.
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

// MARK: Instances are created and added to the Parking set
var superParking = Parking()
let car = Vehicle(plate: "AA111AA", type: VehicleType.car,
checkInTime: Date(), discountCard: "DISCOUNT_CARD_001")
let moto = Vehicle(plate: "B222BBB", type:
VehicleType.moto, checkInTime: Date(), discountCard: nil)
let miniBus = Vehicle(plate: "CC333CC", type:
VehicleType.miniBus, checkInTime: Date(), discountCard: nil)
let bus = Vehicle(plate: "DD444DD", type: VehicleType.bus,
checkInTime: Date(), discountCard: "DISCOUNT_CARD_002")
superParking.vehicles.insert(car)
superParking.vehicles.insert(moto)
superParking.vehicles.insert(miniBus)
superParking.vehicles.insert(bus)
 
// MARK: verify that the inserts were successful for console
//print(superParking.vehicles.insert(car).inserted)  // true
//print(superParking.vehicles.insert(moto).inserted)  // true
//print(superParking.vehicles.insert(miniBus).inserted)// true
//print(superParking.vehicles.insert(bus).inserted)  // true

//MARK: verify the values are not duplicated
//let car = Vehicle(plate: "AA111AA", type: VehicleType.car,
//checkInTime: Date(), discountCard: "DISCOUNT_CARD_001")
//let car2 = Vehicle(plate: "AA111AA", type: VehicleType.car,
//checkInTime: Date(), discountCard: "DISCOUNT_CARD_003")
//print(superParking.vehicles.insert(car).inserted)  // true
//print(superParking.vehicles.insert(car2).inserted)  // false

// MARK: verify that can be removed
//superParking.vehicles.remove(moto)

