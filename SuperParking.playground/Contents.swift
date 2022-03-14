import UIKit

// MARK: protocol Parkable
protocol Parkable {
    var plate: String { get }
    var type: VehicleType { get  }
}

// MARK: struct Parking
struct Parking {
    var vehicles: Set<Vehicle> = [] // Property vehicles - it stores parked vehicles
}

// MARK: struct Vehicle
struct Vehicle: Parkable, Hashable {
    let plate: String       // Corresponds to the license plate of the vehicle.
    // MARK: Answer exercise 2.2:
    // type is a constant because Vehicle can't changes his VehicleType
    let type: VehicleType   // Corresponds to the type of the vehicle
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(plate)
    }
    static func ==(lhs: Vehicle, rhs: Vehicle) -> Bool {
        return lhs.plate == rhs.plate
    }
}

// MARK: Answer exercise 2.1:
// MARK: enum VehicleType
// Determines vehicle type and initial fee
enum VehicleType {
    case car, moto, miniBus, bus
        
    // MARK: Answer exercise 2.3
    var feeForType: Int {
        // Switch is used for flow control because it evaluates each case of the enum.
        switch self{
        case .car: return 20
        case .moto: return 15
        case .miniBus: return 25
        case .bus: return 30
        }
    }
}
