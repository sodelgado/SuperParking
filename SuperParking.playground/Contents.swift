import UIKit

//MARK: protocol Parkable

// MARK: Answer exercise 3.1:
// As Vehicle implements Parkable protocol, the properties must be added in both
// MARK: Answer exercise 3.2:
// All data types can be optional
protocol Parkable {
    var plate: String { get }
    var type: VehicleType { get  }
    var checkInTime: Date { get }
    var discountCard: String? { get }
}


// MARK: struct Parking - represents the parking
struct Parking {
    // Property vehicles - it stores parked vehicles
    // MARK: Aswer exercise 1:
    // Why is it defined as a set? -> because it doesn't allow repeating values
    
    var vehicles: Set<Vehicle> = []
}

// MARK: Struct Vehicle - implements Hashable protocol, used to uniquely identify elements.
struct Vehicle: Parkable, Hashable {
    var discountCard: String?
    
    var checkInTime: Date
    
    //    MARK: Answer exercise 2.2:
    //    type is a constant because Vehicle can't changes his VehicleType
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
enum VehicleType {
    case car, moto, miniBus, bus
        
    var feeForType: Int {
//        Switch is used for flow control because it evaluates each case of the enum.
        switch self{
        case .car: return 20
        case .moto: return 15
        case .miniBus: return 25
        case .bus: return 30
        }
    }
}
