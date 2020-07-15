module Examples.Github.Enum.TopicSuggestionDeclineReason where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - TopicSuggestionDeclineReason
data TopicSuggestionDeclineReason
  = NotRelevant
  | TooSpecific
  | PersonalPreference
  | TooGeneral

fromToMap :: Array (Tuple String TopicSuggestionDeclineReason)
fromToMap = [Tuple "NOT_RELEVANT" NotRelevant, Tuple "TOO_SPECIFIC" TooSpecific, Tuple "PERSONAL_PREFERENCE" PersonalPreference, Tuple "TOO_GENERAL" TooGeneral]

instance topicSuggestionDeclineReasonGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder TopicSuggestionDeclineReason where
  graphqlDefaultResponseScalarDecoder = enumDecoder "TopicSuggestionDeclineReason" fromToMap

instance topicSuggestionDeclineReasonToGraphqlArgumentValue :: ToGraphqlArgumentValue TopicSuggestionDeclineReason where
  toGraphqlArgumentValue =
    case _ of
      NotRelevant -> ArgumentValueString "NOT_RELEVANT"
      TooSpecific -> ArgumentValueString "TOO_SPECIFIC"
      PersonalPreference -> ArgumentValueString "PERSONAL_PREFERENCE"
      TooGeneral -> ArgumentValueString "TOO_GENERAL"
