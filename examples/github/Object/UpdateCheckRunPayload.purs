module Examples.Github.Object.UpdateCheckRunPayload where

import GraphQLClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes (Scope__CheckRun, Scope__UpdateCheckRunPayload)
import Data.Maybe (Maybe)

checkRun :: forall r . SelectionSet
                       Scope__CheckRun
                       r -> SelectionSet
                            Scope__UpdateCheckRunPayload
                            (Maybe
                             r)
checkRun = selectionForCompositeField
           "checkRun"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

clientMutationId :: SelectionSet Scope__UpdateCheckRunPayload (Maybe String)
clientMutationId = selectionForField
                   "clientMutationId"
                   []
                   graphqlDefaultResponseScalarDecoder
