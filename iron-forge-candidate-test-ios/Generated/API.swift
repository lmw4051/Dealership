// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class DealershipListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query DealershipList {
      dealerships {
        __typename
        id
        name
        address
        logoUrl
        vehicles {
          __typename
          name
          address
          imageUrl
          priceCentsPerDay
        }
      }
    }
    """

  public let operationName: String = "DealershipList"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("dealerships", type: .nonNull(.list(.nonNull(.object(Dealership.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(dealerships: [Dealership]) {
      self.init(unsafeResultMap: ["__typename": "Query", "dealerships": dealerships.map { (value: Dealership) -> ResultMap in value.resultMap }])
    }

    public var dealerships: [Dealership] {
      get {
        return (resultMap["dealerships"] as! [ResultMap]).map { (value: ResultMap) -> Dealership in Dealership(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Dealership) -> ResultMap in value.resultMap }, forKey: "dealerships")
      }
    }

    public struct Dealership: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Dealership"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("address", type: .nonNull(.scalar(String.self))),
          GraphQLField("logoUrl", type: .nonNull(.scalar(String.self))),
          GraphQLField("vehicles", type: .nonNull(.list(.nonNull(.object(Vehicle.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, address: String, logoUrl: String, vehicles: [Vehicle]) {
        self.init(unsafeResultMap: ["__typename": "Dealership", "id": id, "name": name, "address": address, "logoUrl": logoUrl, "vehicles": vehicles.map { (value: Vehicle) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var address: String {
        get {
          return resultMap["address"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "address")
        }
      }

      public var logoUrl: String {
        get {
          return resultMap["logoUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "logoUrl")
        }
      }

      public var vehicles: [Vehicle] {
        get {
          return (resultMap["vehicles"] as! [ResultMap]).map { (value: ResultMap) -> Vehicle in Vehicle(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Vehicle) -> ResultMap in value.resultMap }, forKey: "vehicles")
        }
      }

      public struct Vehicle: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Vehicle"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("address", type: .nonNull(.scalar(String.self))),
            GraphQLField("imageUrl", type: .nonNull(.scalar(String.self))),
            GraphQLField("priceCentsPerDay", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, address: String, imageUrl: String, priceCentsPerDay: Int) {
          self.init(unsafeResultMap: ["__typename": "Vehicle", "name": name, "address": address, "imageUrl": imageUrl, "priceCentsPerDay": priceCentsPerDay])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var address: String {
          get {
            return resultMap["address"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "address")
          }
        }

        public var imageUrl: String {
          get {
            return resultMap["imageUrl"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "imageUrl")
          }
        }

        public var priceCentsPerDay: Int {
          get {
            return resultMap["priceCentsPerDay"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "priceCentsPerDay")
          }
        }
      }
    }
  }
}
