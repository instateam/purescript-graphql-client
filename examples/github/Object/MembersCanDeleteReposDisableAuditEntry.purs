module Examples.Github.Object.MembersCanDeleteReposDisableAuditEntry where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  ( Scope__MembersCanDeleteReposDisableAuditEntry
  , Scope__AuditEntryActor
  , Scope__ActorLocation
  , Scope__Organization
  , Scope__User
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Uri, PreciseDateTime, Id)
import Examples.Github.Enum.OperationType (OperationType)

action :: SelectionSet Scope__MembersCanDeleteReposDisableAuditEntry String
action = selectionForField "action" [] graphqlDefaultResponseScalarDecoder

actor :: forall r . SelectionSet
                    Scope__AuditEntryActor
                    r -> SelectionSet
                         Scope__MembersCanDeleteReposDisableAuditEntry
                         (Maybe
                          r)
actor = selectionForCompositeField
        "actor"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorIp :: SelectionSet
           Scope__MembersCanDeleteReposDisableAuditEntry
           (Maybe
            String)
actorIp = selectionForField "actorIp" [] graphqlDefaultResponseScalarDecoder

actorLocation :: forall r . SelectionSet
                            Scope__ActorLocation
                            r -> SelectionSet
                                 Scope__MembersCanDeleteReposDisableAuditEntry
                                 (Maybe
                                  r)
actorLocation = selectionForCompositeField
                "actorLocation"
                []
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

actorLogin :: SelectionSet
              Scope__MembersCanDeleteReposDisableAuditEntry
              (Maybe
               String)
actorLogin = selectionForField
             "actorLogin"
             []
             graphqlDefaultResponseScalarDecoder

actorResourcePath :: SelectionSet
                     Scope__MembersCanDeleteReposDisableAuditEntry
                     (Maybe
                      Uri)
actorResourcePath = selectionForField
                    "actorResourcePath"
                    []
                    graphqlDefaultResponseScalarDecoder

actorUrl :: SelectionSet
            Scope__MembersCanDeleteReposDisableAuditEntry
            (Maybe
             Uri)
actorUrl = selectionForField "actorUrl" [] graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet
             Scope__MembersCanDeleteReposDisableAuditEntry
             PreciseDateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

enterpriseResourcePath :: SelectionSet
                          Scope__MembersCanDeleteReposDisableAuditEntry
                          (Maybe
                           Uri)
enterpriseResourcePath = selectionForField
                         "enterpriseResourcePath"
                         []
                         graphqlDefaultResponseScalarDecoder

enterpriseSlug :: SelectionSet
                  Scope__MembersCanDeleteReposDisableAuditEntry
                  (Maybe
                   String)
enterpriseSlug = selectionForField
                 "enterpriseSlug"
                 []
                 graphqlDefaultResponseScalarDecoder

enterpriseUrl :: SelectionSet
                 Scope__MembersCanDeleteReposDisableAuditEntry
                 (Maybe
                  Uri)
enterpriseUrl = selectionForField
                "enterpriseUrl"
                []
                graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__MembersCanDeleteReposDisableAuditEntry Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

operationType :: SelectionSet
                 Scope__MembersCanDeleteReposDisableAuditEntry
                 (Maybe
                  OperationType)
operationType = selectionForField
                "operationType"
                []
                graphqlDefaultResponseScalarDecoder

organization :: forall r . SelectionSet
                           Scope__Organization
                           r -> SelectionSet
                                Scope__MembersCanDeleteReposDisableAuditEntry
                                (Maybe
                                 r)
organization = selectionForCompositeField
               "organization"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

organizationName :: SelectionSet
                    Scope__MembersCanDeleteReposDisableAuditEntry
                    (Maybe
                     String)
organizationName = selectionForField
                   "organizationName"
                   []
                   graphqlDefaultResponseScalarDecoder

organizationResourcePath :: SelectionSet
                            Scope__MembersCanDeleteReposDisableAuditEntry
                            (Maybe
                             Uri)
organizationResourcePath = selectionForField
                           "organizationResourcePath"
                           []
                           graphqlDefaultResponseScalarDecoder

organizationUrl :: SelectionSet
                   Scope__MembersCanDeleteReposDisableAuditEntry
                   (Maybe
                    Uri)
organizationUrl = selectionForField
                  "organizationUrl"
                  []
                  graphqlDefaultResponseScalarDecoder

user :: forall r . SelectionSet
                   Scope__User
                   r -> SelectionSet
                        Scope__MembersCanDeleteReposDisableAuditEntry
                        (Maybe
                         r)
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

userLogin :: SelectionSet
             Scope__MembersCanDeleteReposDisableAuditEntry
             (Maybe
              String)
userLogin = selectionForField "userLogin" [] graphqlDefaultResponseScalarDecoder

userResourcePath :: SelectionSet
                    Scope__MembersCanDeleteReposDisableAuditEntry
                    (Maybe
                     Uri)
userResourcePath = selectionForField
                   "userResourcePath"
                   []
                   graphqlDefaultResponseScalarDecoder

userUrl :: SelectionSet
           Scope__MembersCanDeleteReposDisableAuditEntry
           (Maybe
            Uri)
userUrl = selectionForField "userUrl" [] graphqlDefaultResponseScalarDecoder
