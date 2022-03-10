import UIKit

protocol Parkable {
    var plate: String { get }
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
    let plate: String // Corresponds to the license plate of the vehicle.
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(plate)
    }
    static func ==(lhs: Vehicle, rhs: Vehicle) -> Bool {
            return lhs.plate == rhs.plate
        }
    }
