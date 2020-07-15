module Examples.Github.Enum.SubscriptionState where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - SubscriptionState
data SubscriptionState
  = Unsubscribed
  | Subscribed
  | Ignored

fromToMap :: Array (Tuple String SubscriptionState)
fromToMap = [Tuple "UNSUBSCRIBED" Unsubscribed, Tuple "SUBSCRIBED" Subscribed, Tuple "IGNORED" Ignored]

instance subscriptionStateGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder SubscriptionState where
  graphqlDefaultResponseScalarDecoder = enumDecoder "SubscriptionState" fromToMap

instance subscriptionStateToGraphqlArgumentValue :: ToGraphqlArgumentValue SubscriptionState where
  toGraphqlArgumentValue =
    case _ of
      Unsubscribed -> ArgumentValueString "UNSUBSCRIBED"
      Subscribed -> ArgumentValueString "SUBSCRIBED"
      Ignored -> ArgumentValueString "IGNORED"