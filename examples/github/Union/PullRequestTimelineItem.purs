module Examples.Github.Union.PullRequestTimelineItem where

import Prelude
import GraphqlClient
import Data.Maybe
import Examples.Github.InputObject
import Examples.Github.Scopes
import Examples.Github.Scalars
import Examples.Github.Enum.ActionExecutionCapabilitySetting
import Examples.Github.Enum.AuditLogOrderField
import Examples.Github.Enum.CollaboratorAffiliation
import Examples.Github.Enum.CommentAuthorAssociation
import Examples.Github.Enum.CommentCannotUpdateReason
import Examples.Github.Enum.CommitContributionOrderField
import Examples.Github.Enum.DefaultRepositoryPermissionField
import Examples.Github.Enum.DeploymentOrderField
import Examples.Github.Enum.DeploymentState
import Examples.Github.Enum.DeploymentStatusState
import Examples.Github.Enum.DiffSide
import Examples.Github.Enum.EnterpriseAdministratorInvitationOrderField
import Examples.Github.Enum.EnterpriseAdministratorRole
import Examples.Github.Enum.EnterpriseDefaultRepositoryPermissionSettingValue
import Examples.Github.Enum.EnterpriseEnabledDisabledSettingValue
import Examples.Github.Enum.EnterpriseEnabledSettingValue
import Examples.Github.Enum.EnterpriseMemberOrderField
import Examples.Github.Enum.EnterpriseMembersCanCreateRepositoriesSettingValue
import Examples.Github.Enum.EnterpriseMembersCanMakePurchasesSettingValue
import Examples.Github.Enum.EnterpriseServerInstallationOrderField
import Examples.Github.Enum.EnterpriseServerUserAccountEmailOrderField
import Examples.Github.Enum.EnterpriseServerUserAccountOrderField
import Examples.Github.Enum.EnterpriseServerUserAccountsUploadOrderField
import Examples.Github.Enum.EnterpriseServerUserAccountsUploadSyncState
import Examples.Github.Enum.EnterpriseUserAccountMembershipRole
import Examples.Github.Enum.EnterpriseUserDeployment
import Examples.Github.Enum.FundingPlatform
import Examples.Github.Enum.GistOrderField
import Examples.Github.Enum.GistPrivacy
import Examples.Github.Enum.GitSignatureState
import Examples.Github.Enum.IdentityProviderConfigurationState
import Examples.Github.Enum.IpAllowListEnabledSettingValue
import Examples.Github.Enum.IpAllowListEntryOrderField
import Examples.Github.Enum.IssueOrderField
import Examples.Github.Enum.IssueState
import Examples.Github.Enum.IssueTimelineItemsItemType
import Examples.Github.Enum.LabelOrderField
import Examples.Github.Enum.LanguageOrderField
import Examples.Github.Enum.LockReason
import Examples.Github.Enum.MergeableState
import Examples.Github.Enum.MilestoneOrderField
import Examples.Github.Enum.MilestoneState
import Examples.Github.Enum.OauthApplicationCreateAuditEntryState
import Examples.Github.Enum.OperationType
import Examples.Github.Enum.OrderDirection
import Examples.Github.Enum.OrgAddMemberAuditEntryPermission
import Examples.Github.Enum.OrgCreateAuditEntryBillingPlan
import Examples.Github.Enum.OrgRemoveBillingManagerAuditEntryReason
import Examples.Github.Enum.OrgRemoveMemberAuditEntryMembershipType
import Examples.Github.Enum.OrgRemoveMemberAuditEntryReason
import Examples.Github.Enum.OrgRemoveOutsideCollaboratorAuditEntryMembershipType
import Examples.Github.Enum.OrgRemoveOutsideCollaboratorAuditEntryReason
import Examples.Github.Enum.OrgUpdateDefaultRepositoryPermissionAuditEntryPermission
import Examples.Github.Enum.OrgUpdateMemberAuditEntryPermission
import Examples.Github.Enum.OrgUpdateMemberRepositoryCreationPermissionAuditEntryVisibility
import Examples.Github.Enum.OrganizationInvitationRole
import Examples.Github.Enum.OrganizationInvitationType
import Examples.Github.Enum.OrganizationMemberRole
import Examples.Github.Enum.OrganizationMembersCanCreateRepositoriesSettingValue
import Examples.Github.Enum.OrganizationOrderField
import Examples.Github.Enum.PackageFileOrderField
import Examples.Github.Enum.PackageOrderField
import Examples.Github.Enum.PackageType
import Examples.Github.Enum.PackageVersionOrderField
import Examples.Github.Enum.PinnableItemType
import Examples.Github.Enum.ProjectCardArchivedState
import Examples.Github.Enum.ProjectCardState
import Examples.Github.Enum.ProjectColumnPurpose
import Examples.Github.Enum.ProjectOrderField
import Examples.Github.Enum.ProjectState
import Examples.Github.Enum.ProjectTemplate
import Examples.Github.Enum.PullRequestMergeMethod
import Examples.Github.Enum.PullRequestOrderField
import Examples.Github.Enum.PullRequestReviewCommentState
import Examples.Github.Enum.PullRequestReviewDecision
import Examples.Github.Enum.PullRequestReviewEvent
import Examples.Github.Enum.PullRequestReviewState
import Examples.Github.Enum.PullRequestState
import Examples.Github.Enum.PullRequestTimelineItemsItemType
import Examples.Github.Enum.PullRequestUpdateState
import Examples.Github.Enum.ReactionContent
import Examples.Github.Enum.ReactionOrderField
import Examples.Github.Enum.RefOrderField
import Examples.Github.Enum.ReleaseOrderField
import Examples.Github.Enum.RepoAccessAuditEntryVisibility
import Examples.Github.Enum.RepoAddMemberAuditEntryVisibility
import Examples.Github.Enum.RepoArchivedAuditEntryVisibility
import Examples.Github.Enum.RepoChangeMergeSettingAuditEntryMergeType
import Examples.Github.Enum.RepoCreateAuditEntryVisibility
import Examples.Github.Enum.RepoDestroyAuditEntryVisibility
import Examples.Github.Enum.RepoRemoveMemberAuditEntryVisibility
import Examples.Github.Enum.ReportedContentClassifiers
import Examples.Github.Enum.RepositoryAffiliation
import Examples.Github.Enum.RepositoryContributionType
import Examples.Github.Enum.RepositoryInvitationOrderField
import Examples.Github.Enum.RepositoryLockReason
import Examples.Github.Enum.RepositoryOrderField
import Examples.Github.Enum.RepositoryPermission
import Examples.Github.Enum.RepositoryPrivacy
import Examples.Github.Enum.RepositoryVisibility
import Examples.Github.Enum.SamlDigestAlgorithm
import Examples.Github.Enum.SamlSignatureAlgorithm
import Examples.Github.Enum.SavedReplyOrderField
import Examples.Github.Enum.SearchType
import Examples.Github.Enum.SecurityAdvisoryEcosystem
import Examples.Github.Enum.SecurityAdvisoryIdentifierType
import Examples.Github.Enum.SecurityAdvisoryOrderField
import Examples.Github.Enum.SecurityAdvisorySeverity
import Examples.Github.Enum.SecurityVulnerabilityOrderField
import Examples.Github.Enum.SponsorsTierOrderField
import Examples.Github.Enum.SponsorshipOrderField
import Examples.Github.Enum.SponsorshipPrivacy
import Examples.Github.Enum.StarOrderField
import Examples.Github.Enum.StatusState
import Examples.Github.Enum.SubscriptionState
import Examples.Github.Enum.TeamDiscussionCommentOrderField
import Examples.Github.Enum.TeamDiscussionOrderField
import Examples.Github.Enum.TeamMemberOrderField
import Examples.Github.Enum.TeamMemberRole
import Examples.Github.Enum.TeamMembershipType
import Examples.Github.Enum.TeamOrderField
import Examples.Github.Enum.TeamPrivacy
import Examples.Github.Enum.TeamRepositoryOrderField
import Examples.Github.Enum.TeamRole
import Examples.Github.Enum.TopicSuggestionDeclineReason
import Examples.Github.Enum.UserBlockDuration
import Examples.Github.Enum.UserStatusOrderField

type Fragments decodesTo = { onAssignedEvent :: SelectionSet Scope__AssignedEvent decodesTo
                           , onBaseRefForcePushedEvent :: SelectionSet Scope__BaseRefForcePushedEvent decodesTo
                           , onClosedEvent :: SelectionSet Scope__ClosedEvent decodesTo
                           , onCommit :: SelectionSet Scope__Commit decodesTo
                           , onCommitCommentThread :: SelectionSet Scope__CommitCommentThread decodesTo
                           , onCrossReferencedEvent :: SelectionSet Scope__CrossReferencedEvent decodesTo
                           , onDemilestonedEvent :: SelectionSet Scope__DemilestonedEvent decodesTo
                           , onDeployedEvent :: SelectionSet Scope__DeployedEvent decodesTo
                           , onDeploymentEnvironmentChangedEvent :: SelectionSet Scope__DeploymentEnvironmentChangedEvent decodesTo
                           , onHeadRefDeletedEvent :: SelectionSet Scope__HeadRefDeletedEvent decodesTo
                           , onHeadRefForcePushedEvent :: SelectionSet Scope__HeadRefForcePushedEvent decodesTo
                           , onHeadRefRestoredEvent :: SelectionSet Scope__HeadRefRestoredEvent decodesTo
                           , onIssueComment :: SelectionSet Scope__IssueComment decodesTo
                           , onLabeledEvent :: SelectionSet Scope__LabeledEvent decodesTo
                           , onLockedEvent :: SelectionSet Scope__LockedEvent decodesTo
                           , onMergedEvent :: SelectionSet Scope__MergedEvent decodesTo
                           , onMilestonedEvent :: SelectionSet Scope__MilestonedEvent decodesTo
                           , onPullRequestReview :: SelectionSet Scope__PullRequestReview decodesTo
                           , onPullRequestReviewComment :: SelectionSet Scope__PullRequestReviewComment decodesTo
                           , onPullRequestReviewThread :: SelectionSet Scope__PullRequestReviewThread decodesTo
                           , onReferencedEvent :: SelectionSet Scope__ReferencedEvent decodesTo
                           , onRenamedTitleEvent :: SelectionSet Scope__RenamedTitleEvent decodesTo
                           , onReopenedEvent :: SelectionSet Scope__ReopenedEvent decodesTo
                           , onReviewDismissedEvent :: SelectionSet Scope__ReviewDismissedEvent decodesTo
                           , onReviewRequestRemovedEvent :: SelectionSet Scope__ReviewRequestRemovedEvent decodesTo
                           , onReviewRequestedEvent :: SelectionSet Scope__ReviewRequestedEvent decodesTo
                           , onSubscribedEvent :: SelectionSet Scope__SubscribedEvent decodesTo
                           , onUnassignedEvent :: SelectionSet Scope__UnassignedEvent decodesTo
                           , onUnlabeledEvent :: SelectionSet Scope__UnlabeledEvent decodesTo
                           , onUnlockedEvent :: SelectionSet Scope__UnlockedEvent decodesTo
                           , onUnsubscribedEvent :: SelectionSet Scope__UnsubscribedEvent decodesTo
                           , onUserBlockedEvent :: SelectionSet Scope__UserBlockedEvent decodesTo
                           }

fragments :: forall decodesTo . Fragments decodesTo -> SelectionSet Scope__PullRequestTimelineItem decodesTo
fragments selections = exhaustiveFragmentSelection [buildFragment "AssignedEvent" selections.onAssignedEvent, buildFragment "BaseRefForcePushedEvent" selections.onBaseRefForcePushedEvent, buildFragment "ClosedEvent" selections.onClosedEvent, buildFragment "Commit" selections.onCommit, buildFragment "CommitCommentThread" selections.onCommitCommentThread, buildFragment "CrossReferencedEvent" selections.onCrossReferencedEvent, buildFragment "DemilestonedEvent" selections.onDemilestonedEvent, buildFragment "DeployedEvent" selections.onDeployedEvent, buildFragment "DeploymentEnvironmentChangedEvent" selections.onDeploymentEnvironmentChangedEvent, buildFragment "HeadRefDeletedEvent" selections.onHeadRefDeletedEvent, buildFragment "HeadRefForcePushedEvent" selections.onHeadRefForcePushedEvent, buildFragment "HeadRefRestoredEvent" selections.onHeadRefRestoredEvent, buildFragment "IssueComment" selections.onIssueComment, buildFragment "LabeledEvent" selections.onLabeledEvent, buildFragment "LockedEvent" selections.onLockedEvent, buildFragment "MergedEvent" selections.onMergedEvent, buildFragment "MilestonedEvent" selections.onMilestonedEvent, buildFragment "PullRequestReview" selections.onPullRequestReview, buildFragment "PullRequestReviewComment" selections.onPullRequestReviewComment, buildFragment "PullRequestReviewThread" selections.onPullRequestReviewThread, buildFragment "ReferencedEvent" selections.onReferencedEvent, buildFragment "RenamedTitleEvent" selections.onRenamedTitleEvent, buildFragment "ReopenedEvent" selections.onReopenedEvent, buildFragment "ReviewDismissedEvent" selections.onReviewDismissedEvent, buildFragment "ReviewRequestRemovedEvent" selections.onReviewRequestRemovedEvent, buildFragment "ReviewRequestedEvent" selections.onReviewRequestedEvent, buildFragment "SubscribedEvent" selections.onSubscribedEvent, buildFragment "UnassignedEvent" selections.onUnassignedEvent, buildFragment "UnlabeledEvent" selections.onUnlabeledEvent, buildFragment "UnlockedEvent" selections.onUnlockedEvent, buildFragment "UnsubscribedEvent" selections.onUnsubscribedEvent, buildFragment "UserBlockedEvent" selections.onUserBlockedEvent]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onAssignedEvent: pure Nothing, onBaseRefForcePushedEvent: pure Nothing, onClosedEvent: pure Nothing, onCommit: pure Nothing, onCommitCommentThread: pure Nothing, onCrossReferencedEvent: pure Nothing, onDemilestonedEvent: pure Nothing, onDeployedEvent: pure Nothing, onDeploymentEnvironmentChangedEvent: pure Nothing, onHeadRefDeletedEvent: pure Nothing, onHeadRefForcePushedEvent: pure Nothing, onHeadRefRestoredEvent: pure Nothing, onIssueComment: pure Nothing, onLabeledEvent: pure Nothing, onLockedEvent: pure Nothing, onMergedEvent: pure Nothing, onMilestonedEvent: pure Nothing, onPullRequestReview: pure Nothing, onPullRequestReviewComment: pure Nothing, onPullRequestReviewThread: pure Nothing, onReferencedEvent: pure Nothing, onRenamedTitleEvent: pure Nothing, onReopenedEvent: pure Nothing, onReviewDismissedEvent: pure Nothing, onReviewRequestRemovedEvent: pure Nothing, onReviewRequestedEvent: pure Nothing, onSubscribedEvent: pure Nothing, onUnassignedEvent: pure Nothing, onUnlabeledEvent: pure Nothing, onUnlockedEvent: pure Nothing, onUnsubscribedEvent: pure Nothing, onUserBlockedEvent: pure Nothing }
