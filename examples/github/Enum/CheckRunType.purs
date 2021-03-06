module Examples.Github.Enum.CheckRunType where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - CheckRunType
data CheckRunType = All | Latest

derive instance eqCheckRunType :: Eq CheckRunType

derive instance ordCheckRunType :: Ord CheckRunType

fromToMap :: Array (Tuple String CheckRunType)
fromToMap = [ Tuple "ALL" All, Tuple "LATEST" Latest ]

instance checkRunTypeGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                            CheckRunType where
  graphqlDefaultResponseScalarDecoder = enumDecoder "CheckRunType" fromToMap

instance checkRunTypeToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                               CheckRunType where
  toGraphQLArgumentValue =
    case _ of
      All -> ArgumentValueEnum "ALL"
      Latest -> ArgumentValueEnum "LATEST"
