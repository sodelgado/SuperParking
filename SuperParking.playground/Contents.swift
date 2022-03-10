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
    var parkedTime: Calendar { get }
}


// MARK: struct Parking - represents the parking
// Property vehicles - it stores parked vehicles
// MARK: Aswer exercise 1:
// Why is it defined as a set? -> because it doesn't allow repeating values
struct Parking {
    var vehicles: Set<Vehicle> = []
}

// MARK: Struct Vehicle - implements Hashable protocol, used to uniquely identify elements.
//    MARK: Answer exercise 2.2:
//    type is a constant because Vehicle can't changes his VehicleType
struct Vehicle: Parkable, Hashable {
    var parkedTime: Calendar
    var discountCard: String?
    var checkInTime: Date
    let type: VehicleType
    let plate: String // Corresponds to the license plate of the vehicle.
    
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
