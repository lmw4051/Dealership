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
      }
    }
    """

  public let operationName: String = "DealershipList"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("dealerships", type: .nonNull(.list(.nonNull(.object(Dealership.selections))))),
    ]

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

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String) {
        self.init(unsafeResultMap: ["__typename": "Dealership", "id": id, "name": name])
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
    }
  }
}
