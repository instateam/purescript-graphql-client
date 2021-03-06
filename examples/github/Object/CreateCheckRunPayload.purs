module Examples.Github.Object.CreateCheckRunPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes (Scope__CheckRun, Scope__CreateCheckRunPayload)
import Data.Maybe (Maybe)

checkRun :: forall r . SelectionSet
                       Scope__CheckRun
                       r -> SelectionSet
                            Scope__CreateCheckRunPayload
                            (Maybe
                             r)
checkRun = selectionForCompositeField
           "checkRun"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

clientMutationId :: SelectionSet Scope__CreateCheckRunPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder
