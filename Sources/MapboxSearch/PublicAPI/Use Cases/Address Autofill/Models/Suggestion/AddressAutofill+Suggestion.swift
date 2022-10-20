// Copyright © 2022 Mapbox. All rights reserved.

import Foundation
import CoreLocation

public extension AddressAutofill {
    struct Suggestion {
        /// Suggestion name.
        public let name: String
        
        /// Textual representation of the address.
        public let formattedAddress: String
        
        // Address geographic point.
        public let coordinate: CLLocationCoordinate2D
        
        // Detailed address components like street, house number, etc.
        private let addressComponents: NonEmptyArray<AddressComponent>
        
        init(
            name: String,
            formattedAddress: String,
            coordinate: CLLocationCoordinate2D,
            addressComponents: NonEmptyArray<AddressComponent>
        ) {
            self.name = name
            self.formattedAddress = formattedAddress
            self.coordinate = coordinate
            self.addressComponents = addressComponents
        }
    }
}

public extension AddressAutofill.Suggestion {
    /// Returns resolved Result object, each request billed individually
    var result: AddressAutofill.Result {
        .init(
            suggestion: self,
            addressComponents: addressComponents
        )
    }
}
