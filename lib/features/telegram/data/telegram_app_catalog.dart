part of 'telegram_tools.dart';

// GENERATED from the Composio toolkit reference (docs.composio.dev/toolkits).
// Toolkit versions: github 20261014_00, gmail 20261018_00, googlecalendar 20261010_00, googledocs 20261008_00, googledrive 20261022_00, googlesheets 20261018_00, linear 20260924_00, notion 20261018_00, outlook 20261022_00, slack 20261020_00, todoist 20260731_00.
// Regenerate rather than edit by hand; the hand-written app tools live in
// telegram_app_tools.dart.

/// Composio tool slug and toolkit for each generated app tool.
const appToolSlugs = <String, (String toolkit, String slug)>{
  'gmail_fetch_emails': ('gmail', 'GMAIL_FETCH_EMAILS'),
  'gmail_fetch_message_by_message_id': ('gmail', 'GMAIL_FETCH_MESSAGE_BY_MESSAGE_ID'),
  'gmail_fetch_message_by_thread_id': ('gmail', 'GMAIL_FETCH_MESSAGE_BY_THREAD_ID'),
  'gmail_list_threads': ('gmail', 'GMAIL_LIST_THREADS'),
  'gmail_list_labels': ('gmail', 'GMAIL_LIST_LABELS'),
  'gmail_list_drafts': ('gmail', 'GMAIL_LIST_DRAFTS'),
  'gmail_get_profile': ('gmail', 'GMAIL_GET_PROFILE'),
  'gmail_search_people': ('gmail', 'GMAIL_SEARCH_PEOPLE'),
  'gmail_send_email': ('gmail', 'GMAIL_SEND_EMAIL'),
  'gmail_reply_to_thread': ('gmail', 'GMAIL_REPLY_TO_THREAD'),
  'gmail_forward_message': ('gmail', 'GMAIL_FORWARD_MESSAGE'),
  'gmail_create_email_draft': ('gmail', 'GMAIL_CREATE_EMAIL_DRAFT'),
  'gmail_send_draft': ('gmail', 'GMAIL_SEND_DRAFT'),
  'gmail_add_label_to_email': ('gmail', 'GMAIL_ADD_LABEL_TO_EMAIL'),
  'gmail_batch_modify_messages': ('gmail', 'GMAIL_BATCH_MODIFY_MESSAGES'),
  'gmail_create_label': ('gmail', 'GMAIL_CREATE_LABEL'),
  'gmail_untrash_message': ('gmail', 'GMAIL_UNTRASH_MESSAGE'),
  'gmail_move_to_trash': ('gmail', 'GMAIL_MOVE_TO_TRASH'),
  'gmail_delete_draft': ('gmail', 'GMAIL_DELETE_DRAFT'),
  'gmail_delete_message': ('gmail', 'GMAIL_DELETE_MESSAGE'),
  'gmail_batch_delete_messages': ('gmail', 'GMAIL_BATCH_DELETE_MESSAGES'),
  'outlook_list_messages': ('outlook', 'OUTLOOK_LIST_MESSAGES'),
  'outlook_search_messages': ('outlook', 'OUTLOOK_SEARCH_MESSAGES'),
  'outlook_get_message': ('outlook', 'OUTLOOK_GET_MESSAGE'),
  'outlook_list_events': ('outlook', 'OUTLOOK_LIST_EVENTS'),
  'outlook_send_email': ('outlook', 'OUTLOOK_SEND_EMAIL'),
  'outlook_reply_email': ('outlook', 'OUTLOOK_REPLY_EMAIL'),
  'outlook_create_draft': ('outlook', 'OUTLOOK_CREATE_DRAFT'),
  'outlook_move_message': ('outlook', 'OUTLOOK_MOVE_MESSAGE'),
  'outlook_calendar_create_event': ('outlook', 'OUTLOOK_CALENDAR_CREATE_EVENT'),
  'outlook_delete_message': ('outlook', 'OUTLOOK_DELETE_MESSAGE'),
  'googlecalendar_events_list': ('googlecalendar', 'GOOGLECALENDAR_EVENTS_LIST'),
  'googlecalendar_find_event': ('googlecalendar', 'GOOGLECALENDAR_FIND_EVENT'),
  'googlecalendar_find_free_slots': ('googlecalendar', 'GOOGLECALENDAR_FIND_FREE_SLOTS'),
  'googlecalendar_list_calendars': ('googlecalendar', 'GOOGLECALENDAR_LIST_CALENDARS'),
  'googlecalendar_create_event': ('googlecalendar', 'GOOGLECALENDAR_CREATE_EVENT'),
  'googlecalendar_quick_add': ('googlecalendar', 'GOOGLECALENDAR_QUICK_ADD'),
  'googlecalendar_patch_event': ('googlecalendar', 'GOOGLECALENDAR_PATCH_EVENT'),
  'googlecalendar_delete_event': ('googlecalendar', 'GOOGLECALENDAR_DELETE_EVENT'),
  'googledrive_find_file': ('googledrive', 'GOOGLEDRIVE_FIND_FILE'),
  'googledrive_get_file_metadata': ('googledrive', 'GOOGLEDRIVE_GET_FILE_METADATA'),
  'googledrive_parse_file': ('googledrive', 'GOOGLEDRIVE_PARSE_FILE'),
  'googledocs_search_documents': ('googledocs', 'GOOGLEDOCS_SEARCH_DOCUMENTS'),
  'googledocs_get_document_plaintext': ('googledocs', 'GOOGLEDOCS_GET_DOCUMENT_PLAINTEXT'),
  'googlesheets_search_spreadsheets': ('googlesheets', 'GOOGLESHEETS_SEARCH_SPREADSHEETS'),
  'googlesheets_get_sheet_names': ('googlesheets', 'GOOGLESHEETS_GET_SHEET_NAMES'),
  'googlesheets_values_get': ('googlesheets', 'GOOGLESHEETS_VALUES_GET'),
  'googledrive_create_file_from_text': ('googledrive', 'GOOGLEDRIVE_CREATE_FILE_FROM_TEXT'),
  'googledrive_create_folder': ('googledrive', 'GOOGLEDRIVE_CREATE_FOLDER'),
  'googledrive_add_file_sharing_preference': ('googledrive', 'GOOGLEDRIVE_ADD_FILE_SHARING_PREFERENCE'),
  'googledocs_create_document_markdown': ('googledocs', 'GOOGLEDOCS_CREATE_DOCUMENT_MARKDOWN'),
  'googledocs_update_document_markdown': ('googledocs', 'GOOGLEDOCS_UPDATE_DOCUMENT_MARKDOWN'),
  'googlesheets_spreadsheets_values_append': ('googlesheets', 'GOOGLESHEETS_SPREADSHEETS_VALUES_APPEND'),
  'googlesheets_values_update': ('googlesheets', 'GOOGLESHEETS_VALUES_UPDATE'),
  'googledrive_trash_file': ('googledrive', 'GOOGLEDRIVE_TRASH_FILE'),
  'slack_list_all_channels': ('slack', 'SLACK_LIST_ALL_CHANNELS'),
  'slack_find_channels': ('slack', 'SLACK_FIND_CHANNELS'),
  'slack_fetch_conversation_history': ('slack', 'SLACK_FETCH_CONVERSATION_HISTORY'),
  'slack_fetch_message_thread_from_a_conversation': ('slack', 'SLACK_FETCH_MESSAGE_THREAD_FROM_A_CONVERSATION'),
  'slack_search_messages': ('slack', 'SLACK_SEARCH_MESSAGES'),
  'slack_list_unread_channel_messages': ('slack', 'SLACK_LIST_UNREAD_CHANNEL_MESSAGES'),
  'slack_find_users': ('slack', 'SLACK_FIND_USERS'),
  'slack_list_reminders': ('slack', 'SLACK_LIST_REMINDERS'),
  'slack_send_message': ('slack', 'SLACK_SEND_MESSAGE'),
  'slack_schedule_message': ('slack', 'SLACK_SCHEDULE_MESSAGE'),
  'slack_updates_a_slack_message': ('slack', 'SLACK_UPDATES_A_SLACK_MESSAGE'),
  'slack_add_reaction_to_an_item': ('slack', 'SLACK_ADD_REACTION_TO_AN_ITEM'),
  'slack_set_status': ('slack', 'SLACK_SET_STATUS'),
  'slack_create_a_reminder': ('slack', 'SLACK_CREATE_A_REMINDER'),
  'slack_deletes_a_message_from_a_chat': ('slack', 'SLACK_DELETES_A_MESSAGE_FROM_A_CHAT'),
  'slack_leave_a_conversation': ('slack', 'SLACK_LEAVE_A_CONVERSATION'),
  'slack_archive_conversation': ('slack', 'SLACK_ARCHIVE_CONVERSATION'),
  'notion_search_notion_page': ('notion', 'NOTION_SEARCH_NOTION_PAGE'),
  'notion_get_page_markdown': ('notion', 'NOTION_GET_PAGE_MARKDOWN'),
  'notion_fetch_data': ('notion', 'NOTION_FETCH_DATA'),
  'notion_query_database': ('notion', 'NOTION_QUERY_DATABASE'),
  'notion_fetch_database': ('notion', 'NOTION_FETCH_DATABASE'),
  'notion_fetch_comments': ('notion', 'NOTION_FETCH_COMMENTS'),
  'notion_create_notion_page': ('notion', 'NOTION_CREATE_NOTION_PAGE'),
  'notion_add_multiple_page_content': ('notion', 'NOTION_ADD_MULTIPLE_PAGE_CONTENT'),
  'notion_insert_row_database': ('notion', 'NOTION_INSERT_ROW_DATABASE'),
  'notion_update_row_database': ('notion', 'NOTION_UPDATE_ROW_DATABASE'),
  'notion_create_comment': ('notion', 'NOTION_CREATE_COMMENT'),
  'notion_archive_notion_page': ('notion', 'NOTION_ARCHIVE_NOTION_PAGE'),
  'notion_replace_page_content': ('notion', 'NOTION_REPLACE_PAGE_CONTENT'),
  'notion_delete_block': ('notion', 'NOTION_DELETE_BLOCK'),
  'github_list_notifications': ('github', 'GITHUB_LIST_NOTIFICATIONS'),
  'github_search_issues_and_pull_requests': ('github', 'GITHUB_SEARCH_ISSUES_AND_PULL_REQUESTS'),
  'github_get_an_issue': ('github', 'GITHUB_GET_AN_ISSUE'),
  'github_get_a_pull_request': ('github', 'GITHUB_GET_A_PULL_REQUEST'),
  'github_create_an_issue': ('github', 'GITHUB_CREATE_AN_ISSUE'),
  'github_create_an_issue_comment': ('github', 'GITHUB_CREATE_AN_ISSUE_COMMENT'),
  'github_mark_notifications_as_read': ('github', 'GITHUB_MARK_NOTIFICATIONS_AS_READ'),
  'github_close_issue': ('github', 'GITHUB_CLOSE_ISSUE'),
  'github_merge_a_pull_request': ('github', 'GITHUB_MERGE_A_PULL_REQUEST'),
  'linear_list_linear_issues': ('linear', 'LINEAR_LIST_LINEAR_ISSUES'),
  'linear_search_issues': ('linear', 'LINEAR_SEARCH_ISSUES'),
  'linear_get_linear_issue': ('linear', 'LINEAR_GET_LINEAR_ISSUE'),
  'linear_list_linear_teams': ('linear', 'LINEAR_LIST_LINEAR_TEAMS'),
  'linear_list_linear_projects': ('linear', 'LINEAR_LIST_LINEAR_PROJECTS'),
  'linear_create_linear_issue': ('linear', 'LINEAR_CREATE_LINEAR_ISSUE'),
  'linear_update_issue': ('linear', 'LINEAR_UPDATE_ISSUE'),
  'linear_create_linear_comment': ('linear', 'LINEAR_CREATE_LINEAR_COMMENT'),
  'linear_delete_linear_issue': ('linear', 'LINEAR_DELETE_LINEAR_ISSUE'),
  'todoist_get_all_tasks': ('todoist', 'TODOIST_GET_ALL_TASKS'),
  'todoist_filter_tasks': ('todoist', 'TODOIST_FILTER_TASKS'),
  'todoist_get_all_projects': ('todoist', 'TODOIST_GET_ALL_PROJECTS'),
  'todoist_create_task': ('todoist', 'TODOIST_CREATE_TASK'),
  'todoist_update_task': ('todoist', 'TODOIST_UPDATE_TASK'),
  'todoist_close_task': ('todoist', 'TODOIST_CLOSE_TASK'),
  'todoist_delete_task': ('todoist', 'TODOIST_DELETE_TASK'),
};

final _appCatalogTools = <TelegramTool>[
  TelegramTool(
    name: 'gmail_fetch_emails',
    label: 'Checking your email',
    category: ToolCategory.gmail,
    cost: ToolCost.apps,
    description: 'Fetches a list of email messages from a Gmail account, supporting filtering, pagination, and optional full content retrieval. Results are NOT sorted by recency; sort by internalDate client-side. The messages field may be absent or empty (valid no-results state); always null-check before accessing messageId or threadId. Null-check subject and header fields before string operations. For large result sets, prefer ids_only=true or metadata-only listing, then hydrate via gmail_fetch_message_by_message_id.',
    parameters: {
      'type': 'object',
      'properties': {
        'query': {
          'type': 'string',
          'description': 'Gmail advanced search query (e.g., \'from:user subject:meeting\'). Supported operators: \'from:\', \'to:\', \'subject:\', \'label:\', \'has:\', \'is:\', \'in:\', \'category:\', \'after:YYYY/MM/DD\', \'before:YYYY/MM/DD\', AND/OR/NOT.',
        },
        'ids_only': {
          'type': 'boolean',
          'description': 'If true, only returns message IDs from the list API without fetching individual message details. Fastest option for getting just message IDs and thread IDs.',
        },
        'label_ids': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'Filter by label IDs; only messages with all specified labels are returned (AND logic). Optional - omit or use empty list to fetch all messages without label filtering.',
        },
        'page_token': {
          'type': 'string',
          'description': 'Token for retrieving a specific page, obtained from a previous response\'s `nextPageToken`. Must be a valid opaque token string from a previous API response. Do not pass arbitrary values. Omit for the first page. Loop calls using nextPageToken until it is absent to avoid silently missing messages.',
        },
        'max_results': {
          'type': 'integer',
          'description': 'Maximum number of messages to retrieve per page. Default of 1 retrieves only a single message; set higher for practical use. Hard cap is 500 per page.',
        },
        'include_payload': {
          'type': 'boolean',
          'description': 'Set to true to include full message payload (headers, body, attachments); false for metadata only. payload may still be null even when true; use gmail_fetch_message_by_message_id for guaranteed complete content.',
        },
        'include_spam_trash': {
          'type': 'boolean',
          'description': 'Set to true to include messages from \'SPAM\' and \'TRASH\'.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'gmail_fetch_message_by_message_id',
    label: 'Opening an email',
    category: ToolCategory.gmail,
    cost: ToolCost.apps,
    description: 'Fetches a specific email message by its ID, provided the `message_id` exists and is accessible to the authenticated `user_id`. Spam/trash messages are excluded unless upstream list/search calls used `include_spam_trash=true`. Use `internalDate` (milliseconds since epoch) rather than header `Date` for recency checks.',
    parameters: {
      'type': 'object',
      'properties': {
        'format': {
          'type': 'string',
          'description': 'Format for message content. \'minimal\': lightest (ID, thread ID, labels only). \'metadata\': headers and message metadata without body content - ideal for summarization, analysis, or when you only need subject/sender/timestamp (recommended for most use cases).',
        },
        'message_id': {
          'type': 'string',
          'description': 'The Gmail API message ID (hexadecimal string, typically 15-16 characters like \'19b11732c1b578fd\'). Must be obtained from Gmail API responses (e.g., List Messages, Search Messages). Do NOT use email subjects, dates, sender names, or custom identifiers.',
        },
      },
      'required': ['message_id'],
    },
  ),
  TelegramTool(
    name: 'gmail_fetch_message_by_thread_id',
    label: 'Reading an email thread',
    category: ToolCategory.gmail,
    cost: ToolCost.apps,
    description: 'Retrieves messages from a Gmail thread using its `thread_id`, where the thread must be accessible by the specified `user_id`. Returns a `messages` array; `thread_id` is not echoed in the response. Message order is not guaranteed — sort by `internalDate` to find oldest/newest. Check `labelIds` per message to filter drafts. Concurrent bulk calls may trigger 403 `userRateLimitExceeded` or 429; cap concurrency ~10 and use exponential backoff.',
    parameters: {
      'type': 'object',
      'properties': {
        'thread_id': {
          'type': 'string',
          'description': 'Hexadecimal thread ID from Gmail API (e.g., \'19bf77729bcb3a44\'). Obtain from gmail_list_threads or gmail_fetch_emails. Prefixes like \'msg-f:\' or \'thread-f:\' are auto-stripped. Legacy Gmail web UI IDs (e.g., \'FMfcgzQfBZdVqKZcSVBhqwWLKWCtDdWQ\') are NOT supported - use the API thread ID instead.',
        },
        'page_token': {
          'type': 'string',
          'description': 'Opaque page token for fetching a specific page of messages if results are paginated. Iterate calls by passing the returned `nextPageToken` until it is absent; stopping early will miss messages in long threads.',
        },
      },
      'required': ['thread_id'],
    },
  ),
  TelegramTool(
    name: 'gmail_list_threads',
    label: 'Listing email threads',
    category: ToolCategory.gmail,
    cost: ToolCost.apps,
    description: 'Retrieves a list of email threads from a Gmail account, identified by `user_id` (email address or \'me\'), supporting filtering and pagination. Spam and trash are excluded by default unless explicitly targeted via `label:spam` or `label:trash` in the query.',
    parameters: {
      'type': 'object',
      'properties': {
        'query': {
          'type': 'string',
          'description': 'Filter for threads, using Gmail search query syntax (e.g., \'from:user@example.com is:unread\'). Supported operators include `from:`, `to:`, `subject:`, `label:`, `is:unread`, `has:attachment`, `after:`, `before:`. Dates must use `YYYY/MM/DD` format; date operators are UTC-based.',
        },
        'page_token': {
          'type': 'string',
          'description': 'Token from a previous response to retrieve a specific page of results; omit for the first page.',
        },
        'max_results': {
          'type': 'integer',
          'description': 'Maximum number of threads to return. Hard cap is ~500 per call. For full mailbox coverage, loop using `nextPageToken` via `page_token` until absent.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'gmail_list_labels',
    label: 'Listing Gmail labels',
    category: ToolCategory.gmail,
    cost: ToolCost.apps,
    description: 'Retrieves all system and user-created labels for a Gmail account in a single unpaginated response. Primary use: obtain internal label IDs (e.g., \'Label_123\') required by other Gmail tools — display names cannot be used as label identifiers and cause silent failures or errors. System labels (INBOX, UNREAD, SPAM, TRASH, etc.) are case-sensitive and must be used exactly as returned; INBOX, SPAM, and TRASH are read-only and cannot be added/removed via label modification tools.',
    parameters: {
      'type': 'object',
      'properties': {
        'include_details': {
          'type': 'boolean',
          'description': 'If true, fetches detailed info for each label including message/thread counts (messagesTotal, messagesUnread, threadsTotal, threadsUnread). This requires additional API calls and may be slower for accounts with many labels.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'gmail_list_drafts',
    label: 'Listing drafts',
    category: ToolCategory.gmail,
    cost: ToolCost.apps,
    description: 'Retrieves a paginated list of email drafts from a user\'s Gmail account. Use verbose=true to get full draft details including subject, body, sender, and timestamp. Draft ordering is non-guaranteed; iterate using page_token until it is absent to retrieve all drafts. Newly created drafts may not appear immediately. Rapid calls may trigger 403 userRateLimitExceeded or 429 errors; apply exponential backoff (1s, 2s, 4s) before retrying.',
    parameters: {
      'type': 'object',
      'properties': {
        'page_token': {
          'type': 'string',
          'description': 'Token from a previous response to retrieve a specific page of drafts. Ordering is non-guaranteed; continue paginating until page_token is absent in the response to retrieve all drafts.',
        },
        'max_results': {
          'type': 'integer',
          'description': 'Maximum number of drafts to return per page.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'gmail_get_profile',
    label: 'Checking your Gmail account',
    category: ToolCategory.gmail,
    cost: ToolCost.apps,
    description: 'Retrieves Gmail profile information (email address, aggregate messagesTotal/threadsTotal, historyId) for a user. messagesTotal counts individual emails; threadsTotal counts conversations; neither is per-label — use gmail_fetch_emails with label filters for label-specific counts. The returned historyId seeds incremental sync via GMAIL_LIST_HISTORY; if historyIdTooOld is returned, rescan with gmail_fetch_emails before resuming. Response may be wrapped under a top-level data field; unwrap before reading fields.',
    parameters: {
      'type': 'object',
      'properties': {},
    },
  ),
  TelegramTool(
    name: 'gmail_search_people',
    label: 'Looking up contacts',
    category: ToolCategory.gmail,
    cost: ToolCost.apps,
    description: 'Searches contacts by matching the query against names, nicknames, emails, phone numbers, and organizations, optionally including \'Other Contacts\'. Only searches the authenticated user\'s contact directory — people existing solely in message headers won\'t appear; use gmail_fetch_emails for those. Results may be zero or multiple; never auto-select from ambiguous results. Results paginate via next_page_token; follow until empty and deduplicate by email.',
    parameters: {
      'type': 'object',
      'properties': {
        'query': {
          'type': 'string',
          'description': 'Matches contact names, nicknames, email addresses, phone numbers, and organization fields.',
        },
        'page_size': {
          'type': 'integer',
          'description': 'Maximum results to return; values >30 are capped to 30 by the API.',
        },
        'person_fields': {
          'type': 'string',
          'description': 'Comma-separated fields to return (e.g., \'names,emailAddresses\'). When \'other_contacts\' is true, only \'emailAddresses\', \'metadata\', \'names\', \'phoneNumbers\' are allowed. For full field access including \'organizations\', set \'other_contacts\' to false.',
        },
        'other_contacts': {
          'type': 'boolean',
          'description': 'When True, searches both saved contacts and \'Other Contacts\' (people you\'ve interacted with but not explicitly saved). Note: This restricts person_fields to only \'emailAddresses\', \'metadata\', \'names\', \'phoneNumbers\'.',
        },
      },
      'required': ['query'],
    },
  ),
  TelegramTool(
    name: 'gmail_send_email',
    label: 'Sending an email',
    category: ToolCategory.gmail,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Sends an email via Gmail API using the authenticated user\'s Google profile display name. Sends immediately and is irreversible — confirm recipients, subject, body, and attachments before calling. At least one of \'to\' (or \'recipient_email\'), \'cc\', or \'bcc\' must be provided. At least one of subject or body must be provided. Requires `is_html=True` if the body contains HTML. All common file types including PNG, JPG, PDF, MP4, etc. are supported as attachments. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'cc': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'Carbon Copy (CC) recipients\' email addresses. At least one of \'to\'/\'recipient_email\', \'cc\', or \'bcc\' must be provided.',
        },
        'bcc': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'Blind Carbon Copy (BCC) recipients\' email addresses. At least one of \'to\'/\'recipient_email\', \'cc\', or \'bcc\' must be provided.',
        },
        'body': {
          'type': 'string',
          'description': 'Email content (plain text or HTML). Either subject or body must be provided for the email to be sent. If HTML, `is_html` must be `True`.',
        },
        'is_html': {
          'type': 'boolean',
          'description': 'Set to `True` if the email body contains HTML tags.',
        },
        'subject': {
          'type': 'string',
          'description': 'Subject line of the email. Either subject or body must be provided for the email to be sent.',
        },
        'from_email': {
          'type': 'string',
          'description': 'Sender email address for the \'From\' header. Provide the connected account\'s primary email address or a verified alias configured in Gmail\'s \'Send mail as\' settings. When omitted, the action attempts to resolve the primary email address from the authenticated Gmail profile.',
        },
        'recipient_email': {
          'type': 'string',
          'description': 'Primary recipient\'s email address. You can also use \'to\' as an alias for this parameter. At least one of \'to\'/\'recipient_email\', \'cc\', or \'bcc\' must be provided. Use extra_recipients if you want to send to multiple recipients.',
        },
        'extra_recipients': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'Additional \'To\' recipients\' email addresses (not Cc or Bcc). Should only be used if recipient_email is also provided.',
        },
        'include_signature': {
          'type': 'boolean',
          'description': 'Append the sender\'s Gmail signature (the \'Send mail as\' signature configured in Gmail settings) to the message body, ahead of any quoted or forwarded content.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'gmail_reply_to_thread',
    label: 'Replying to an email',
    category: ToolCategory.gmail,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Sends a reply within a specific Gmail thread using the original thread\'s subject; do not provide a custom subject as it will start a new conversation instead of replying in-thread. Requires a valid `thread_id` and at least one of `recipient_email`, `cc`, or `bcc`. Supports optional file attachments. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'cc': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'Carbon Copy (CC) recipients\' email addresses in format \'user@domain.com\'. Each address must include both username and domain separated by \'@\'. At least one of cc, bcc, or recipient_email must be provided.',
        },
        'bcc': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'Blind Carbon Copy (BCC) recipients\' email addresses in format \'user@domain.com\'. Each address must include both username and domain separated by \'@\'. At least one of cc, bcc, or recipient_email must be provided.',
        },
        'is_html': {
          'type': 'boolean',
          'description': 'Indicates if `message_body` is HTML; if True, body must be valid HTML, if False, body should not contain HTML tags. Mismatch causes recipients to see raw HTML tags as plain text.',
        },
        'thread_id': {
          'type': 'string',
          'description': 'Identifier of the Gmail thread for the reply. Must be a valid hexadecimal string, typically 15-16 characters long (e.g., \'169eefc8138e68ca\'). Prefixes like \'msg-f:\' or \'thread-f:\' are automatically stripped.',
        },
        'message_body': {
          'type': 'string',
          'description': 'Content of the reply message, either plain text or HTML.',
        },
        'recipient_email': {
          'type': 'string',
          'description': 'Primary recipient\'s email address in format \'user@domain.com\'. Must include both username and domain separated by \'@\'. Required if cc and bcc is not provided, else can be optional. Use extra_recipients if you want to send to multiple recipients.',
        },
        'extra_recipients': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'Additional \'To\' recipients\' email addresses in format \'user@domain.com\' (not Cc or Bcc). Each address must include both username and domain separated by \'@\'. Should only be used if recipient_email is also provided.',
        },
        'include_signature': {
          'type': 'boolean',
          'description': 'Append the sender\'s Gmail signature (the \'Send mail as\' signature configured in Gmail settings) to the message body, ahead of any quoted or forwarded content.',
        },
      },
      'required': ['thread_id'],
    },
  ),
  TelegramTool(
    name: 'gmail_forward_message',
    label: 'Forwarding an email',
    category: ToolCategory.gmail,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Forward an existing Gmail message to specified recipients, preserving original body and attachments. Verify recipients and content before forwarding to avoid unintended exposure. Bulk forwarding may trigger 429/5xx rate limits; keep concurrency to 5–10 and apply backoff. Messages near Gmail\'s size limits may fail; reconstruct a smaller draft if needed. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'cc': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'List of email addresses to CC.',
        },
        'bcc': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'List of email addresses to BCC.',
        },
        'message_id': {
          'type': 'string',
          'description': 'Gmail message ID (hexadecimal string, e.g., \'17f45ec49a9c3f1b\'). Must contain only hex characters [0-9a-fA-F]. Obtain this from actions like \'List Messages\' or \'Fetch Emails\'.',
        },
        'recipients': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'List of email addresses to forward the message to.',
        },
        'additional_text': {
          'type': 'string',
          'description': 'Optional additional text to include before the forwarded content.',
        },
        'include_signature': {
          'type': 'boolean',
          'description': 'Append the sender\'s Gmail signature (the \'Send mail as\' signature configured in Gmail settings) to the message body, ahead of any quoted or forwarded content.',
        },
      },
      'required': ['message_id', 'recipients'],
    },
  ),
  TelegramTool(
    name: 'gmail_create_email_draft',
    label: 'Drafting an email',
    category: ToolCategory.gmail,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Creates a Gmail email draft. While all fields are optional per the Gmail API, practical validation requires at least one of recipient_email, cc, or bcc and at least one of subject or body. Supports To/Cc/Bcc recipients, subject, plain/HTML body (ensure `is_html=True` for HTML), attachments, and threading. Returns a draft_id that must be used as-is with gmail_send_draft — synthetic or stale IDs will fail. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'cc': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'Carbon Copy (CC) recipients\' email addresses. Each must be a valid email address (e.g., \'user@example.com\') or display name format (e.g., \'John Doe <user@example.com>\'). Plain names without email addresses are NOT valid. Optional for drafts (recipients can be added later before sending).',
        },
        'bcc': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'Blind Carbon Copy (BCC) recipients\' email addresses. Each must be a valid email address (e.g., \'user@example.com\') or display name format (e.g., \'Bob Jones <user@example.com>\'). Plain names without email addresses are NOT valid. Optional for drafts (recipients can be added later before sending).',
        },
        'body': {
          'type': 'string',
          'description': 'Email body content (plain text or HTML); `is_html` must be True if HTML. Optional - drafts can be created without a body and edited later before sending. Can also be provided as \'message_body\'.',
        },
        'is_html': {
          'type': 'boolean',
          'description': 'Set to True if `body` is already formatted HTML. When False, plain text newlines are auto-converted to <br/> tags. Both modes result in HTML email; this flag controls whether the body content is treated as raw HTML or plain text that gets HTML formatting applied.',
        },
        'subject': {
          'type': 'string',
          'description': 'Email subject line. Optional - drafts can be created without a subject and edited later before sending. When creating a draft reply to an existing thread (thread_id provided), leave this empty to stay in the same thread. Setting a subject will create a NEW thread instead.',
        },
        'thread_id': {
          'type': 'string',
          'description': 'ID of an existing Gmail thread to reply to; omit for new thread. If the thread ID is invalid or inaccessible, the draft will be created as a new thread instead of failing.',
        },
        'recipient_email': {
          'type': 'string',
          'description': 'Primary recipient\'s email address. Must be a valid email address (e.g., \'user@example.com\') or display name format (e.g., \'John Doe <user@example.com>\'). A plain name without an email address (e.g., \'John Doe\') is NOT valid - the \'@\' symbol and domain are required.',
        },
        'extra_recipients': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'Additional \'To\' recipients\' email addresses (not Cc or Bcc). Each must be a valid email address (e.g., \'user@example.com\'), display name format (e.g., \'Jane Doe <user@example.com>\'), or \'me\' for the authenticated user. Plain names without email addresses are NOT valid.',
        },
        'include_signature': {
          'type': 'boolean',
          'description': 'Append the sender\'s Gmail signature (the \'Send mail as\' signature configured in Gmail settings) to the message body, ahead of any quoted or forwarded content.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'gmail_send_draft',
    label: 'Sending a draft',
    category: ToolCategory.gmail,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Sends an existing draft email AS-IS to recipients already defined within the draft. IMPORTANT: This action does NOT accept recipient parameters (to, cc, bcc). The Gmail API\'s drafts/send endpoint sends drafts to whatever recipients are already set in the draft\'s To, Cc, and Bcc headers - it cannot add or override recipients. If the draft has no recipients, you must either: 1. Create a new draft with recipients using gmail_create_email_draft, then send it 2. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'draft_id': {
          'type': 'string',
          'description': 'The ID of the draft to send. Draft IDs are typically alphanumeric strings (e.g., \'r99885592323229922\'). Important: Do not confuse draft_id with message_id - they are different identifiers.',
        },
      },
      'required': ['draft_id'],
    },
  ),
  TelegramTool(
    name: 'gmail_add_label_to_email',
    label: 'Labelling an email',
    category: ToolCategory.gmail,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Adds and/or removes specified Gmail labels for a message; ensure `message_id` and all `label_ids` are valid (use \'listLabels\' for custom label IDs). Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'message_id': {
          'type': 'string',
          'description': 'Immutable ID of the message to modify. Gmail message IDs are hexadecimal strings (e.g., \'1a2b3c4d5e6f7890\'). IMPORTANT: Do NOT use UUIDs (32-character strings like \'093ca4662b214d5eba8f4ceeaad63433\'), thread IDs, or internal system IDs - these will cause \'Invalid id value\' errors.',
        },
        'add_label_ids': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'Label IDs to add (IDs, not display names). System labels: INBOX, SPAM, TRASH, UNREAD, STARRED, IMPORTANT, CATEGORY_PERSONAL, CATEGORY_SOCIAL, CATEGORY_PROMOTIONS, CATEGORY_UPDATES, CATEGORY_FORUMS. Use full CATEGORY_ prefix (e.g., \'CATEGORY_UPDATES\' not \'UPDATES\').',
        },
        'remove_label_ids': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'Label IDs to remove (IDs, not display names). System labels: INBOX, SPAM, TRASH, UNREAD, STARRED, IMPORTANT, CATEGORY_PERSONAL, CATEGORY_SOCIAL, CATEGORY_PROMOTIONS, CATEGORY_UPDATES, CATEGORY_FORUMS. Use full CATEGORY_ prefix (e.g., \'CATEGORY_UPDATES\' not \'UPDATES\').',
        },
      },
      'required': ['message_id'],
    },
  ),
  TelegramTool(
    name: 'gmail_batch_modify_messages',
    label: 'Updating emails',
    category: ToolCategory.gmail,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Modify labels on multiple Gmail messages in one efficient API call. Supports up to 1,000 messages per request for bulk operations like archiving, marking as read/unread, or applying custom labels. High-volume calls may return 429 rateLimitExceeded or 403 userRateLimitExceeded; apply exponential backoff. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'messageIds': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'List of message IDs to modify. Maximum 1,000 message IDs per request. Get message IDs from gmail_fetch_emails or gmail_list_threads actions. Accepts \'messageIds\', \'ids\', or \'message_ids\' as the parameter name.',
        },
        'addLabelIds': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'List of label IDs to add to the messages. IMPORTANT: Use label IDs, NOT label display names. System labels use their name as ID: INBOX, STARRED, IMPORTANT, SENT, DRAFT, SPAM, TRASH, UNREAD, CATEGORY_PERSONAL, CATEGORY_SOCIAL, CATEGORY_PROMOTIONS, CATEGORY_UPDATES, CATEGORY_FORUMS.',
        },
        'removeLabelIds': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'List of label IDs to remove from the messages. IMPORTANT: Use label IDs, NOT label display names. System labels use their name as ID: INBOX, STARRED, IMPORTANT, SENT, SPAM, TRASH, UNREAD.',
        },
      },
      'required': ['messageIds'],
    },
  ),
  TelegramTool(
    name: 'gmail_create_label',
    label: 'Creating a label',
    category: ToolCategory.gmail,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Creates a new label with a unique name in the specified user\'s Gmail account. Returns a labelId (e.g., \'Label_123\') required for downstream tools like gmail_add_label_to_email, gmail_batch_modify_messages, and GMAIL_MODIFY_THREAD_LABELS — those tools do not accept display names. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'label_name': {
          'type': 'string',
          'description': 'REQUIRED. The name for the new label. Must be unique within the account, non-blank, maximum length 225 characters, cannot contain commas (\',\'), not only whitespace, and must not be a reserved system label.',
        },
      },
      'required': ['label_name'],
    },
  ),
  TelegramTool(
    name: 'gmail_untrash_message',
    label: 'Restoring an email',
    category: ToolCategory.gmail,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Tool to remove a message from trash in Gmail. Use when you need to restore a previously trashed email message. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'message_id': {
          'type': 'string',
          'description': 'Required. The unique identifier of the email message to remove from trash. This is a hexadecimal string that can be obtained from listing or fetching emails.',
        },
      },
      'required': ['message_id'],
    },
  ),
  TelegramTool(
    name: 'gmail_move_to_trash',
    label: 'Moving an email to Trash',
    category: ToolCategory.gmail,
    cost: ToolCost.apps,
    requiresApproval: true,
    destructive: true,
    description: 'Moves an existing, non-deleted email message to the trash for the specified user. Trashed messages are recoverable and still count toward storage quota until purged. Prefer this over gmail_batch_delete_messages when recovery may be needed. For bulk operations, use gmail_batch_modify_messages or gmail_batch_delete_messages instead of repeated calls to this tool. Destructive: only when the user clearly asked for exactly this; it always waits for approval.',
    parameters: {
      'type': 'object',
      'properties': {
        'message_id': {
          'type': 'string',
          'description': 'Required. The unique identifier of the email message to move to trash. This is a hexadecimal string that can be obtained from listing or fetching emails. Verify the correct message via subject/snippet before trashing to avoid affecting unrelated conversations.',
        },
      },
      'required': ['message_id'],
    },
  ),
  TelegramTool(
    name: 'gmail_delete_draft',
    label: 'Deleting a draft',
    category: ToolCategory.gmail,
    cost: ToolCost.apps,
    requiresApproval: true,
    destructive: true,
    description: 'Permanently deletes a specific Gmail draft using its ID with no recovery possible; verify the correct `draft_id` and obtain explicit user confirmation before calling. Ensure the draft exists and the user has necessary permissions for the given `user_id`. Destructive: only when the user clearly asked for exactly this; it always waits for approval.',
    parameters: {
      'type': 'object',
      'properties': {
        'draft_id': {
          'type': 'string',
          'description': 'Immutable ID of the draft to delete. Must be obtained from gmail_list_drafts or gmail_create_email_draft actions. Draft IDs typically have an \'r\' prefix (e.g., \'r-1234567890\' or \'r1234567890\'). Draft IDs differ from message IDs used in gmail_batch_delete_messages — do not interchange.',
        },
      },
      'required': ['draft_id'],
    },
  ),
  TelegramTool(
    name: 'gmail_delete_message',
    label: 'Deleting an email forever',
    category: ToolCategory.gmail,
    cost: ToolCost.apps,
    requiresApproval: true,
    destructive: true,
    description: 'Permanently deletes a specific email message by its ID from a Gmail mailbox; for `user_id`, use \'me\' for the authenticated user or an email address to which the authenticated user has delegated access. Destructive: only when the user clearly asked for exactly this; it always waits for approval.',
    parameters: {
      'type': 'object',
      'properties': {
        'message_id': {
          'type': 'string',
          'description': 'Identifier of the email message to delete.',
        },
      },
      'required': ['message_id'],
    },
  ),
  TelegramTool(
    name: 'gmail_batch_delete_messages',
    label: 'Deleting emails forever',
    category: ToolCategory.gmail,
    cost: ToolCost.apps,
    requiresApproval: true,
    destructive: true,
    description: 'Tool to permanently delete multiple Gmail messages in bulk, bypassing Trash with no recovery possible. Use when you need to efficiently remove large numbers of emails (e.g., retention enforcement, mailbox hygiene). Use gmail_move_to_trash instead when reversibility may be needed. Always obtain explicit user confirmation and verify a sample of message IDs before executing. High-volume calls may trigger 429 rateLimitExceeded or 403 userRateLimitExceeded errors; apply exponential backoff. Destructive: only when the user clearly asked for exactly this; it always waits for approval.',
    parameters: {
      'type': 'object',
      'properties': {
        'messageIds': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'List of Gmail message IDs to delete. Each ID must be a hexadecimal string (e.g., \'18c5f5d1a2b3c4d5\'). Obtain IDs from actions like gmail_fetch_emails or gmail_list_threads - do not use human-readable descriptions.',
        },
      },
      'required': ['messageIds'],
    },
  ),
  TelegramTool(
    name: 'outlook_list_messages',
    label: 'Checking Outlook mail',
    category: ToolCategory.outlook,
    cost: ToolCost.apps,
    description: 'List or query Outlook messages from one folder (Inbox by default) or mailbox-wide with folder=\'allfolders\'. Use simple filter fields for common conditions, filter for a raw OData expression, or search for full-text matching. Supports field selection, sorting, page size, offset, and opaque continuation tokens. Microsoft Graph does not allow search with filter, orderby, or skip; use OUTLOOK_QUERY_EMAILS only when you want its stricter single-folder OData validation.',
    parameters: {
      'type': 'object',
      'properties': {
        'top': {
          'type': 'integer',
          'description': 'Maximum number of messages to return per request (1-1000). To page through more, use the `next_page_token` from the response (pass it back as `page_token`), repeating until it is absent. For large mailboxes (1000+ messages), always paginate.',
        },
        'skip': {
          'type': 'integer',
          'description': 'Number of messages to skip from the beginning of the result set, for pagination.',
        },
        'filter': {
          'type': 'string',
          'description': 'Raw OData \$filter expression for server-side message filtering, for example "sentDateTime ge 2026-01-01T00:00:00Z". Use this for sentDateTime ge/le and conditions not covered by the simple filter parameters. If both are provided, this expression and the simple filters are combined with \'and\'.',
        },
        'folder': {
          'type': 'string',
          'description': 'ID or well-known name of the mail folder. Well-known names (case-insensitive): archive, clutter, conflicts, conversationhistory, deleteditems, drafts, inbox, junkemail, localfailures, msgfolderroot, outbox, recoverableitemsdeletions, scheduled, searchfolders, sentitems, serverfailures, syncissues.',
        },
        'search': {
          'type': 'string',
          'description': 'Full-text search query using Microsoft Graph \$search syntax. Searches across subject, body, and sender fields server-side. Cannot be combined with filter, orderby, or skip; those parameters are omitted when search is set. Example: \'budget report\' or \'from:john@example.com\'',
        },
        'select': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'Message properties to include. Accepts a list of strings or a comma-separated string (e.g., \'id,subject,from\'). Valid properties: id, subject, from, toRecipients, ccRecipients, bccRecipients, receivedDateTime, sentDateTime, hasAttachments, importance, isRead, body, bodyPreview, categories, conversat…',
        },
        'is_read': {
          'type': 'boolean',
          'description': 'Filter by read status: \'true\' for read, \'false\' for unread. Unspecified means no filter by read status.',
        },
        'orderby': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'Properties to sort by, such as \'receivedDateTime desc\'. Default is \'receivedDateTime desc\'. When combined with filter, every orderby property must also appear first in filter in the same order; for example filter=\'sentDateTime ge 2026-01-01T00:00:00Z\' requires orderby=[\'sentDateTime desc\'].',
        },
        'subject': {
          'type': 'string',
          'description': 'Filter by exact match of the subject line. Special characters like apostrophes, brackets will be automatically escaped. For complex subject searches, consider using \'Search Messages\' instead.',
        },
        'categories': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'Filter by categories (case-sensitive); matches if tagged with any specified category.',
        },
        'importance': {
          'type': 'string',
          'description': 'Filter by importance: \'low\', \'normal\', or \'high\'.',
        },
        'page_token': {
          'type': 'string',
          'description': 'Opaque continuation token for fetching the next page. Omit it for the first page; then pass back the `next_page_token` from the previous response, unmodified, repeating until it is absent. Do not construct or edit this value.',
        },
        'from_address': {
          'type': 'string',
          'description': 'Filter by the sender\'s exact email address. NOTE: This filter is applied client-side on the returned results, not server-side.',
        },
        'conversation_id': {
          'type': 'string',
          'description': 'Filter messages by conversation ID to retrieve all messages in a specific email thread. NOTE: This filter is applied client-side on the returned results.',
        },
        'has_attachments': {
          'type': 'boolean',
          'description': 'Filter by attachment presence: \'true\' for messages with attachments, \'false\' for those without. NOTE: This filter is applied client-side on the returned results.',
        },
        'subject_contains': {
          'type': 'string',
          'description': 'Filter messages where the subject contains the specified case-insensitive substring. NOTE: This filter is applied client-side on the returned results. For better performance, use \'Search Messages\' instead.',
        },
        'subject_endswith': {
          'type': 'string',
          'description': 'Filter messages where the subject ends with the specified case-insensitive string. NOTE: This filter is applied client-side on the returned results. For better performance, use \'Search Messages\' instead.',
        },
        'sent_date_time_gt': {
          'type': 'string',
          'description': 'Filter messages sent after this ISO 8601 DateTimeOffset timestamp. Include a timezone, for example 2023-01-10T14:30:00Z. For inclusive ge/le comparisons, use filter with an unquoted date literal.',
        },
        'sent_date_time_lt': {
          'type': 'string',
          'description': 'Filter messages sent before this ISO 8601 DateTimeOffset timestamp. Include a timezone, for example 2023-02-20T10:00:00Z. For inclusive ge/le comparisons, use filter with an unquoted date literal.',
        },
        'subject_startswith': {
          'type': 'string',
          'description': 'Filter messages where the subject starts with the specified case-insensitive string.',
        },
        'received_date_time_ge': {
          'type': 'string',
          'description': 'Filter messages received on or after this ISO 8601 DateTimeOffset timestamp. Include a timezone, for example 2023-03-15T08:00:00Z.',
        },
        'received_date_time_gt': {
          'type': 'string',
          'description': 'Filter messages received after this ISO 8601 DateTimeOffset timestamp. Include a timezone, for example 2023-01-01T00:00:00Z.',
        },
        'received_date_time_le': {
          'type': 'string',
          'description': 'Filter messages received on or before this ISO 8601 DateTimeOffset timestamp. Include a timezone, for example 2023-03-31T23:59:59Z.',
        },
        'received_date_time_lt': {
          'type': 'string',
          'description': 'Filter messages received before this ISO 8601 DateTimeOffset timestamp. Include a timezone, for example 2023-04-01T00:00:00Z.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'outlook_search_messages',
    label: 'Searching Outlook mail',
    category: ToolCategory.outlook,
    cost: ToolCost.apps,
    description: 'Search Outlook messages using KQL syntax. Supports Microsoft 365, work/school, and personal Microsoft accounts. Personal accounts use the Messages API fallback. Examples: \'from:user@example.com AND received>=2025-10-01\', \'to:info@jcdn.nl AND subject:invoice\', \'received>today-30 AND hasattachment:yes\'',
    parameters: {
      'type': 'object',
      'properties': {
        'size': {
          'type': 'integer',
          'description': 'Number of search results to return per page (1-25). Note: For message entity, max size is 25. Also, from_index + size cannot exceed 1000 (API pagination window limit).',
        },
        'query': {
          'type': 'string',
          'description': 'KQL (Keyword Query Language) search query string. Supports advanced syntax for precise searches. **Basic Syntax:** - Simple keywords: \'budget report\' - Exact phrases: \'"quarterly review"\' - Boolean operators: \'urgent AND deadline\' or \'invoice OR receipt\' **Property Filters (prefix:value):** - from:…',
        },
        'region': {
          'type': 'string',
          'description': 'Geographic region for the search query. ONLY required when using application permissions (S2S authentication). DO NOT use with delegated permissions (user authentication) - the API will reject the request. Common values: \'US\', \'EU\', \'GB\', \'JP\', \'CN\', \'IN\', \'CA\', \'AU\', \'BR\', \'RU\'.',
        },
        'subject': {
          'type': 'string',
          'description': 'Text to search for within the message subject line. Legacy parameter - prefer using \'subject:text\' in the query parameter for more control. When combined with query, this filter is joined using AND. If query contains OR operators, the query is wrapped in parentheses to preserve precedence.',
        },
        'fromEmail': {
          'type': 'string',
          'description': 'Filter messages by sender email address or domain. Supports exact email (\'user@example.com\') or domain matching (\'example.com\'). Legacy parameter - prefer using \'from:email@example.com\' in the query parameter for more flexibility. When combined with query, this filter is joined using AND.',
        },
        'from_index': {
          'type': 'integer',
          'description': 'The 0-based starting index for Microsoft Search API pagination (max 999). Note: from_index + size cannot exceed 1000 (API pagination window limit). To paginate: check response[\'value\'][0][\'hitsContainers\'][0][\'moreResultsAvailable\'].',
        },
        'page_token': {
          'type': 'string',
          'description': 'Opaque continuation token for the next Messages API fallback page. Omit for the first page; then pass back the next_page_token from the previous response, unmodified. Do not construct or edit it. When set, it preserves the original mailbox, query, and page size.',
        },
        'hasAttachments': {
          'type': 'boolean',
          'description': 'Filters messages based on the presence of attachments. Legacy parameter - prefer using \'hasattachment:yes\' or \'hasattachment:no\' in the query parameter. When combined with query, this filter is joined using AND.',
        },
        'enable_top_results': {
          'type': 'boolean',
          'description': 'If `true`, sorts results by relevance; otherwise, sorts by date in descending order (newest first).',
        },
      },
    },
  ),
  TelegramTool(
    name: 'outlook_get_message',
    label: 'Opening an Outlook email',
    category: ToolCategory.outlook,
    cost: ToolCost.apps,
    description: 'Retrieve a message by immutable ID from the specified Outlook mailbox. Use `select` to include fields such as `internetMessageHeaders`. A 404 can indicate a deleted message, a different mailbox, or a stale legacy mutable ID.',
    parameters: {
      'type': 'object',
      'properties': {
        'select': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'List of message properties to include in the response. Can be provided as an array of strings (e.g., [\'subject\', \'body\']) or as a comma-separated string (e.g., \'subject,body\'). Reduces data transfer and improves performance.',
        },
        'message_id': {
          'type': 'string',
          'description': 'Unique immutable ID of the Outlook email message to retrieve. Accepts message IDs from outlook_list_messages (message.id), OUTLOOK_QUERY_EMAILS (message.id), or outlook_search_messages (use hitId from search results, as resource.id is not populated by the Search API).',
        },
      },
      'required': ['message_id'],
    },
  ),
  TelegramTool(
    name: 'outlook_list_events',
    label: 'Checking your Outlook calendar',
    category: ToolCategory.outlook,
    cost: ToolCost.apps,
    description: 'Retrieves events from a user\'s Outlook calendar via Microsoft Graph API. Supports primary/secondary/shared calendars, pagination, filtering, property selection, sorting, and timezone specification. Use calendar_id to access non-primary calendars.',
    parameters: {
      'type': 'object',
      'properties': {
        'top': {
          'type': 'integer',
          'description': 'Maximum number of events to retrieve per page for pagination.',
        },
        'skip': {
          'type': 'integer',
          'description': 'Number of initial events to bypass, used for pagination.',
        },
        'filter': {
          'type': 'string',
          'description': 'OData query string to filter calendar events. Filterable properties: \'start/dateTime\', \'end/dateTime\', \'subject\', \'categories\', \'importance\', \'sensitivity\', \'isAllDay\', \'isCancelled\', \'isReminderOn\', \'type\'.',
        },
        'select': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'List of specific event property names to return. MUST be provided as a list. If omitted, a default set of properties is returned. Valid field names: id, subject, body, bodyPreview, start, end, isAllDay, organizer, attendees, location, locations, recurrence, importance, sensitivity, showAs, categorie…',
        },
        'orderby': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'List of properties to sort results by. Each item is a string like \'start/dateTime desc\' or \'subject asc\'. MUST be provided as a list, even for single sort criteria. Use \'asc\' (default) or \'desc\' for order. IMPORTANT: Use calendar event properties ONLY.',
        },
        'timezone': {
          'type': 'string',
          'description': 'Preferred timezone for event start/end times. Accepts IANA format (e.g., \'America/New_York\', \'Europe/London\', \'Indian/Mauritius\', \'Asia/Tokyo\') or Windows format (e.g., \'Eastern Standard Time\', \'Pacific Standard Time\').',
        },
        'page_token': {
          'type': 'string',
          'description': 'Opaque continuation token for the next page. Omit for the first page; then pass back the `next_page_token` from the previous response, unmodified, until it is absent. Do not construct or edit it.',
        },
        'calendar_id': {
          'type': 'string',
          'description': 'Optional ID of a specific calendar to retrieve events from. If not provided, uses the default calendar. Get calendar IDs using LIST_CALENDARS action. IMPORTANT: Do NOT use \'primary\' or \'default\' as values - these are not valid calendar IDs in Microsoft Graph.',
        },
        'expand_recurring_events': {
          'type': 'boolean',
          'description': 'When true, automatically expands recurring events to show actual occurrences within the filtered date range instead of series masters. When false (default), returns series masters as before.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'outlook_send_email',
    label: 'Sending an Outlook email',
    category: ToolCategory.outlook,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Sends an email with subject, body, recipients, and optional attachments via Microsoft Graph API. Supports comma-separated email addresses in the to_email field for multiple recipients. Accepts either a single file or a list of files as attachments. Attachments require a non-empty file with valid name and mimetype. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'to': {
          'type': 'string',
          'description': 'The primary recipient\'s email address(es). You can provide a single email or multiple emails separated by commas. Valid email addresses will be extracted from strings containing extra text. Format: name@domain.com',
        },
        'body': {
          'type': 'string',
          'description': 'The content of the email body as a plain string (plain text or HTML based on `is_html`). Do not pass structured objects; provide only the raw text/HTML content.',
        },
        'is_html': {
          'type': 'boolean',
          'description': 'Specifies if the email body is HTML; `True` for HTML, `False` for plain text.',
        },
        'subject': {
          'type': 'string',
          'description': 'The subject line of the email.',
        },
        'to_name': {
          'type': 'string',
          'description': 'The display name of the primary recipient.',
        },
        'cc_emails': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'List of email addresses for CC recipients. Each email should be a separate string in the array. Do NOT pass comma-separated values as a single string.',
        },
        'bcc_emails': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'List of email addresses for BCC recipients. Each email should be a separate string in the array. Do NOT pass comma-separated values as a single string.',
        },
        'from_address': {
          'type': 'string',
          'description': 'Optional From address to set on the message (send as/on behalf). Provide a single email address. Requires appropriate mailbox permissions.',
        },
        'save_to_sent_items': {
          'type': 'boolean',
          'description': 'Indicates if the email should be saved in \'Sent Items\'.',
        },
      },
      'required': ['to', 'body', 'subject'],
    },
  ),
  TelegramTool(
    name: 'outlook_reply_email',
    label: 'Replying in Outlook',
    category: ToolCategory.outlook,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Sends a reply to an Outlook email message with optional HTML formatting, attachments, CC, and BCC recipients. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'comment': {
          'type': 'string',
          'description': 'The body content of the reply email. Can be plain text or HTML based on is_html flag.',
        },
        'is_html': {
          'type': 'boolean',
          'description': 'Whether the comment body should be rendered as HTML (true) or plain text (false). When false, HTML tags in the comment will be displayed as literal text.',
        },
        'cc_emails': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'List of email addresses for CC recipients.',
        },
        'bcc_emails': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'List of email addresses for BCC recipients.',
        },
        'message_id': {
          'type': 'string',
          'description': 'The Microsoft Graph message ID (NOT an email address). This is a Base64-encoded string typically starting with \'AAMk\' (e.g., \'AAMkAGI2TAAA=\'). Do NOT pass email addresses like \'user@example.com\'.',
        },
      },
      'required': ['comment', 'message_id'],
    },
  ),
  TelegramTool(
    name: 'outlook_create_draft',
    label: 'Drafting an Outlook email',
    category: ToolCategory.outlook,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Creates a new Outlook email draft with subject, body, recipients, and an optional attachment. This action creates a standalone draft for new conversations. To create a draft reply to an existing conversation/message, use the OUTLOOK_CREATE_DRAFT_REPLY action instead. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'body': {
          'type': 'string',
          'description': 'Content of the email draft; use `is_html` to specify if HTML or plain text.',
        },
        'is_html': {
          'type': 'boolean',
          'description': 'Specifies if the `body` is HTML. If `False`, `body` is plain text. Set to `True` when `body` contains HTML markup; otherwise markup renders as literal text.',
        },
        'subject': {
          'type': 'string',
          'description': 'Subject line for the email draft.',
        },
        'cc_recipients': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'Optional list of CC (carbon copy) recipient email addresses. Must be provided as an array of strings, e.g., ["cc@example.com"].',
        },
        'to_recipients': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'Optional list of primary \'To\' recipient email addresses. Must be provided as an array of strings, e.g., ["user@example.com"] for a single recipient or ["user1@example.com", "user2@example.com"] for multiple recipients. Do not pass as a JSON-encoded string.',
        },
        'bcc_recipients': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'Optional list of BCC (blind carbon copy) recipient email addresses. Must be provided as an array of strings, e.g., ["bcc@example.com"].',
        },
      },
      'required': ['body', 'subject'],
    },
  ),
  TelegramTool(
    name: 'outlook_move_message',
    label: 'Moving an Outlook email',
    category: ToolCategory.outlook,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Move a message to another folder within the specified user\'s mailbox. Immutable message IDs remain stable across moves within the mailbox. High-volume parallel moves can trigger HTTP 429 (MailboxConcurrency) throttling; honor the Retry-After header. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'message_id': {
          'type': 'string',
          'description': 'Unique immutable ID of the Outlook email message to move. Must be the complete, untruncated ID string from an Outlook list, search, or other message action. Outlook trigger payload IDs are mutable and can become stale after a folder move.',
        },
        'destination_id': {
          'type': 'string',
          'description': 'The destination folder ID, or a well-known folder name (e.g., \'inbox\', \'deleteditems\', \'drafts\', \'sentitems\'). If using a folder ID, it must be the complete, untruncated ID string - do not use shortened or ellipsis-containing IDs.',
        },
      },
      'required': ['message_id', 'destination_id'],
    },
  ),
  TelegramTool(
    name: 'outlook_calendar_create_event',
    label: 'Adding an Outlook event',
    category: ToolCategory.outlook,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Creates a new Outlook calendar event, ensuring `start_datetime` is chronologically before `end_datetime`. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'body': {
          'type': 'string',
          'description': 'The body of the event. This can be in plain text or HTML format, as specified by the \'is_html\' field. Optional - events can be created without a body.',
        },
        'is_html': {
          'type': 'boolean',
          'description': 'Specifies whether the \'body\' content is HTML. Set to true for HTML content; otherwise, it\'s treated as plain text.',
        },
        'show_as': {
          'type': 'string',
          'description': 'The status to show on the calendar for the duration of the event. Valid values are: \'free\', \'tentative\', \'busy\', \'oof\' (out of office), \'workingElsewhere\', \'unknown\'.',
        },
        'subject': {
          'type': 'string',
          'description': 'The subject of the calendar event.',
        },
        'location': {
          'type': 'string',
          'description': 'The physical location of the event.',
        },
        'time_zone': {
          'type': 'string',
          'description': 'The time zone for the start and end times of the event. Uses Windows time zone names (e.g., \'Pacific Standard Time\') or IANA time zone names (e.g., \'America/Los_Angeles\'). UTC is also a valid input.',
        },
        'categories': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'A list of category names to associate with the event. The API accepts any string values. For best compatibility with Outlook UI color-coding, use category names from the user\'s master category list. Category names are case-insensitive and duplicates will be automatically removed.',
        },
        'importance': {
          'type': 'string',
          'description': 'The importance of the event. Valid values are \'low\', \'normal\', \'high\'. Defaults to \'normal\'.',
        },
        'is_all_day': {
          'type': 'boolean',
          'description': 'Set to true for an all-day event. When true, start_datetime and end_datetime must both be at midnight and use the same time_zone.',
        },
        'calendar_id': {
          'type': 'string',
          'description': 'The ID of a specific calendar to create the event in. Obtainable from the list calendars action. If omitted, the event is created on the user\'s default calendar.',
        },
        'end_datetime': {
          'type': 'string',
          'description': 'The event\'s end date and time. Prefer local YYYY-MM-DDTHH:MM:SS with the IANA or Windows zone in time_zone. Z or a numeric offset is accepted only when it agrees with time_zone.',
        },
        'attendees_info': {
          'type': 'array',
          'items': {
            'type': 'object',
          },
          'description': 'A list of attendees for the event. Accepts multiple formats: (1) Simple email strings (e.g., [\'user@example.com\']), (2) Attendee objects with \'email\' (required), \'name\' (optional), and \'type\' (optional: \'required\', \'optional\', \'resource\', defaults to \'required\'), (3) Microsoft Graph-style objects wi…',
        },
        'start_datetime': {
          'type': 'string',
          'description': 'The event\'s start date and time. Prefer local YYYY-MM-DDTHH:MM:SS with the IANA or Windows zone in time_zone. Z or a numeric offset is accepted only when it agrees with time_zone.',
        },
        'is_online_meeting': {
          'type': 'boolean',
          'description': 'Set to true to indicate that the event is an online meeting. This will automatically generate an online meeting link if \'online_meeting_provider\' is set (e.g., a Microsoft Teams link).',
        },
        'online_meeting_provider': {
          'type': 'string',
          'description': 'Specifies the online meeting provider. Currently, only \'teamsForBusiness\' is supported. If \'is_online_meeting\' is true and this is set, a meeting link for the provider will be created.',
        },
      },
      'required': ['subject', 'time_zone', 'end_datetime', 'start_datetime'],
    },
  ),
  TelegramTool(
    name: 'outlook_delete_message',
    label: 'Deleting an Outlook email',
    category: ToolCategory.outlook,
    cost: ToolCost.apps,
    requiresApproval: true,
    destructive: true,
    description: 'Tool to permanently delete an Outlook email message by its message_id. Use when removing unwanted messages, cleaning up drafts, or performing mailbox maintenance. Destructive: only when the user clearly asked for exactly this; it always waits for approval.',
    parameters: {
      'type': 'object',
      'properties': {
        'message_id': {
          'type': 'string',
          'description': 'Unique identifier of the message to delete, typically obtained from \'List Emails\' or \'Search Messages\'.',
        },
      },
      'required': ['message_id'],
    },
  ),
  TelegramTool(
    name: 'googlecalendar_events_list',
    label: 'Checking your calendar',
    category: ToolCategory.calendar,
    cost: ToolCost.apps,
    description: 'Lists or incrementally synchronizes events from one calendar, defaulting to the connected user\'s primary calendar. Use timeMin/timeMax for a time window, singleEvents to expand recurring series, showDeleted to include cancelled events, query for text search, orderBy to sort, pageToken to continue a page sequence, and syncToken to retrieve changes after a completed full sync.',
    parameters: {
      'type': 'object',
      'properties': {
        'query': {
          'type': 'string',
          'description': 'Free text search terms to find events that match these terms in various fields. Optional.',
        },
        'timeMax': {
          'type': 'string',
          'description': 'Upper bound (exclusive) for an event\'s start time to filter by. Optional. If unset, no start-time upper bound is applied. Must be an RFC3339 timestamp with mandatory time zone offset (e.g., 2011-06-03T10:00:00-07:00 or 2011-06-03T10:00:00Z). Milliseconds may be provided but are ignored.',
        },
        'timeMin': {
          'type': 'string',
          'description': 'Lower bound (exclusive) for an event\'s end time to filter by. Optional. If unset, no end-time lower bound is applied. Must be an RFC3339 timestamp with mandatory time zone offset (e.g., 2011-06-03T10:00:00-07:00 or 2011-06-03T10:00:00Z). Milliseconds may be provided but are ignored.',
        },
        'timeZone': {
          'type': 'string',
          'description': 'Time zone used in the response for formatting event times. Optional. Use an IANA time zone identifier (e.g., America/Los_Angeles). Defaults to the user\'s primary time zone. Offsets (e.g., \'-03:00\', \'UTC+0\') and abbreviations (e.g., \'IST\', \'PST\') are invalid.',
        },
        'pageToken': {
          'type': 'string',
          'description': 'Opaque pagination token from a previous response\'s nextPageToken field. Must be the exact string returned by the API - do not use placeholder values like \'NEXT\', \'next\', \'1\', \'2\', etc. Omit this parameter for the first page.',
        },
        'calendarId': {
          'type': 'string',
          'description': 'Calendar identifier. Use "primary" for the user\'s main calendar, or a calendar ID from the user\'s accessible calendar list. Arbitrary email addresses will NOT work - the calendar must exist in the user\'s calendar list. Use googlecalendar_list_calendars to retrieve valid calendar IDs.',
        },
        'eventTypes': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'Event types to return. Google accepts this query parameter more than once, so provide a list to include multiple types. A single string is also accepted for compatibility. If unset, returns all event types. Values: "birthday", "default", "focusTime", "fromGmail", "outOfOffice", "workingLocation".',
        },
        'maxResults': {
          'type': 'integer',
          'description': 'Maximum number of events returned on one result page. The number of events in the resulting page may be less than this value, or none at all, even if there are more events matching the query. Incomplete pages can be detected by a non-empty nextPageToken field in the response.',
        },
        'updatedMin': {
          'type': 'string',
          'description': 'Lower bound for an event\'s last modification time (RFC3339). When specified, entries deleted since this time are always included regardless of showDeleted. Optional.',
        },
        'showDeleted': {
          'type': 'boolean',
          'description': 'Include cancelled events (status="cancelled"). Optional; default is false. This surfaces cancelled (soft-deleted) events, not items in the Trash. When syncToken or updatedMin is used, deletions since those markers are included regardless of showDeleted.',
        },
        'maxAttendees': {
          'type': 'integer',
          'description': 'The maximum number of attendees to include in the response. If there are more than the specified number of attendees, only the participant is returned. Optional. Must be >= 1 if provided.',
        },
        'singleEvents': {
          'type': 'boolean',
          'description': 'Whether to expand recurring events into instances and only return single one-off events and instances of recurring events. Optional. The default is False.',
        },
        'alwaysIncludeEmail': {
          'type': 'boolean',
          'description': 'Deprecated and ignored.',
        },
        'showHiddenInvitations': {
          'type': 'boolean',
          'description': 'Whether to include hidden invitations in the result. Optional. The default is False. Hidden invitations are events where your attendee entry has responseStatus=\'needsAction\' and attendees[].self==true. When true, such invitations are included.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'googlecalendar_find_event',
    label: 'Finding an event',
    category: ToolCategory.calendar,
    cost: ToolCost.apps,
    description: 'Finds events in a specified Google Calendar using text query, time ranges (event start/end, last modification), and event types. Ensure `timeMin` is not chronologically after `timeMax` if both are provided. Results may span multiple pages; always follow `nextPageToken` until absent to avoid silently missing events. Validate the correct match from results by checking summary, start.dateTime, and organizer.email before using event_id for mutations.',
    parameters: {
      'type': 'object',
      'properties': {
        'query': {
          'type': 'string',
          'description': 'Free-text search terms to find events. This query is matched against various event fields including summary, description, location, attendees\' details (displayName, email), and organizer\'s details. Cannot search by event_id.',
        },
        'order_by': {
          'type': 'string',
          'description': 'Order of events: \'startTime\' (ascending by start time) or \'updated\' (ascending by last modification time). Note: \'startTime\' requires single_events=true. Use \'updated\' if you need to include recurring masters (e.g., cancelled series).',
        },
        'time_max': {
          'type': 'string',
          'description': 'Upper bound (exclusive) for an event\'s start time to filter by. Only events starting before this time are included. Accepts multiple formats: 1. RFC3339 timestamp (e.g., \'2024-12-06T13:00:00Z\') 2. Comma-separated date/time parts (e.g., \'2024,12,06,13,00,00\') 3.',
        },
        'time_min': {
          'type': 'string',
          'description': 'Lower bound (exclusive) for an event\'s end time to filter by. Only events ending after this time are included. Accepts multiple formats: 1. RFC3339 timestamp (e.g., \'2024-12-06T13:00:00Z\') 2. Comma-separated date/time parts (e.g., \'2024,12,06,13,00,00\') 3.',
        },
        'page_token': {
          'type': 'string',
          'description': 'Token from a previous response\'s `nextPageToken` to fetch the subsequent page of results. Always follow every `nextPageToken` until absent; skipping pagination silently omits events on busy calendars.',
        },
        'calendar_id': {
          'type': 'string',
          'description': 'Identifier of the Google Calendar to query. IMPORTANT: This must be a valid calendar identifier, NOT a calendar name/title. Valid formats are: \'primary\' (the authenticated user\'s primary calendar), an email address (e.g., \'user@example.com\'), or a calendar ID (e.g., \'abc123xyz@group.calendar.google.…',
        },
        'event_types': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'Event types to include. Supported values: \'birthday\', \'default\', \'focusTime\', \'outOfOffice\', \'workingLocation\'.',
        },
        'max_results': {
          'type': 'integer',
          'description': 'Maximum number of events per page (1-2500).',
        },
        'updated_min': {
          'type': 'string',
          'description': 'Lower bound (exclusive) for an event\'s last modification time to filter by. Only events updated after this time are included. When specified, events deleted since this time are also included, regardless of the `show_deleted` parameter. Accepts multiple formats: 1.',
        },
        'show_deleted': {
          'type': 'boolean',
          'description': 'Include events whose status is \'cancelled\'. This surfaces cancelled/deleted events, not a separate \'trash\' view. Behavior with recurring events: when single_events=true, only individual cancelled instances are returned (the recurring master is omitted); to include cancelled recurring masters, set si…',
        },
        'single_events': {
          'type': 'boolean',
          'description': 'When true, recurring event series are expanded into their individual instances. When false, only the recurring master events are returned. Note: Ordering by \'startTime\' requires singleEvents=true.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'googlecalendar_find_free_slots',
    label: 'Finding free time',
    category: ToolCategory.calendar,
    cost: ToolCost.apps,
    description: 'Finds both free and busy time slots in Google Calendars for specified calendars within a defined time range. If `time_min` is not provided, defaults to the current timestamp in the specified timezone. If `time_max` is not provided, defaults to 23:59:59 of the day specified in `time_min` (if provided), otherwise defaults to 23:59:59 of the current day in the specified timezone.',
    parameters: {
      'type': 'object',
      'properties': {
        'items': {
          'type': 'array',
          'items': {
            'type': 'object',
          },
          'description': 'List of calendar identifiers to query for free/busy information. Pass as a simple list of strings, e.g., [\'primary\'] or [\'primary\', \'user@example.com\'].',
        },
        'time_max': {
          'type': 'string',
          'description': 'End datetime for the query interval. Accepts ISO, comma-separated, or simple datetime formats. If provided without an explicit timezone, it is interpreted in the specified `timezone`.',
        },
        'time_min': {
          'type': 'string',
          'description': 'Start datetime for the query interval. Accepts ISO, comma-separated, or simple datetime formats. If provided without an explicit timezone, it is interpreted in the specified `timezone`.',
        },
        'timezone': {
          'type': 'string',
          'description': 'IANA timezone identifier (e.g., \'America/New_York\', \'Europe/London\', \'Asia/Tokyo\'). Determines how naive `time_min`/`time_max` are interpreted and the timezone used in the response for `timeMin`, `timeMax`, busy periods, and calculated free slots.',
        },
        'group_expansion_max': {
          'type': 'integer',
          'description': 'Maximum calendar identifiers to return for a single group. Must be between 1 and 100 (inclusive). Values exceeding 100 will be rejected.',
        },
        'calendar_expansion_max': {
          'type': 'integer',
          'description': 'Maximum calendars for which FreeBusy information is provided. Must be between 1 and 50 (inclusive). Values exceeding 50 will be rejected.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'googlecalendar_list_calendars',
    label: 'Listing calendars',
    category: ToolCategory.calendar,
    cost: ToolCost.apps,
    description: 'Lists calendars accessible through the connected user\'s CalendarList, returning IDs and user-specific metadata such as access role, color, visibility, selection, and reminders. Hidden calendars are omitted unless show_hidden is true; min_access_role and show_deleted provide additional filtering. Continue with page_token until next_page_token is absent; for incremental synchronization, pass next_sync_token back as sync_token.',
    parameters: {
      'type': 'object',
      'properties': {
        'page_token': {
          'type': 'string',
          'description': 'Token for the page of results to return, from a previous response.',
        },
        'sync_token': {
          'type': 'string',
          'description': 'Sync token from a previous list request to get only changed entries; showDeleted, showHidden, and pageToken are ignored if provided. Also ignores minAccessRole. An HTTP 410 Gone response means the token has expired; perform a full resync by omitting sync_token.',
        },
        'max_results': {
          'type': 'integer',
          'description': 'Maximum calendars to return on one page. Google defaults to 100 and allows at most 250. Follow next_page_token until absent to enumerate every accessible calendar.',
        },
        'show_hidden': {
          'type': 'boolean',
          'description': 'Include calendars not typically shown in the UI.',
        },
        'show_deleted': {
          'type': 'boolean',
          'description': 'Include deleted calendars in the result.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'googlecalendar_create_event',
    label: 'Adding an event',
    category: ToolCategory.calendar,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Creates a timed event using start_datetime and either end_datetime or duration fields, or an all-day event using an inclusive start_date and exclusive end_date. send_updates defaults to "all", which emails all attendees; choose "externalOnly" or "none" to control notifications. The organizer is added as an attendee unless exclude_organizer is true, and a Google Meet link is requested by default. No conflict checking is performed; use GOOGLECALENDAR_FREE_BUSY_QUERY first when conflicts matter. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'summary': {
          'type': 'string',
          'description': 'Summary (title) of the event.',
        },
        'end_date': {
          'type': 'string',
          'description': 'Exclusive end date for an all-day event in YYYY-MM-DD format. Must be provided together with start_date and be later than start_date.',
        },
        'location': {
          'type': 'string',
          'description': 'Geographic location of the event as free-form text.',
        },
        'timezone': {
          'type': 'string',
          'description': 'IANA timezone name from the timezone database (e.g., \'America/New_York\', \'Europe/London\', \'Asia/Jerusalem\', \'UTC\'). Required if datetime is naive. For recurring events, start and end must include a timeZone. If not provided, UTC is used.',
        },
        'attendees': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'List of attendees. Each attendee can be either: (1) A string email address (e.g., \'user@example.com\'), or (2) An object with \'email\' (required), \'optional\' (boolean, default false), \'displayName\' (string), \'comment\' (string), \'additionalGuests\' (integer), and \'resource\' (boolean).',
        },
        'recurrence': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'List of RRULE, EXRULE, RDATE, EXDATE lines for recurring events. Supported frequencies: DAILY, WEEKLY, MONTHLY, YEARLY. For recurring events, start.timeZone and end.timeZone must be present.',
        },
        'start_date': {
          'type': 'string',
          'description': 'Inclusive start date for an all-day event in YYYY-MM-DD format. Must be provided together with end_date and without start_datetime or end_datetime.',
        },
        'calendar_id': {
          'type': 'string',
          'description': 'Calendar identifier. Use \'primary\' (recommended) for the user\'s main calendar. Alternatively, use a calendar ID from the user\'s accessible calendar list. Calendar IDs look like email addresses (e.g., \'xyz@group.calendar.google.com\' for shared calendars).',
        },
        'description': {
          'type': 'string',
          'description': 'Description of the event. Can contain HTML. Optional. Must be omitted for \'birthday\' event type.',
        },
        'end_datetime': {
          'type': 'string',
          'description': 'Event end time in ISO 8601 format: YYYY-MM-DDTHH:MM:SS. When provided, this parameter takes precedence over event_duration_hour and event_duration_minutes. If not provided, the end time is calculated using start_datetime + duration. Must be after start_datetime.',
        },
        'start_datetime': {
          'type': 'string',
          'description': 'Event start time in ISO 8601 format: YYYY-MM-DDTHH:MM:SS. Required for timed events; omit it when using start_date and end_date for an all-day event.',
        },
        'guestsCanModify': {
          'type': 'boolean',
          'description': 'If True, guests can modify the event.',
        },
        'exclude_organizer': {
          'type': 'boolean',
          'description': 'If True, the organizer will NOT be added as an attendee. Default is False (organizer is included).',
        },
        'create_meeting_room': {
          'type': 'boolean',
          'description': 'Defaults to True. When True, for CREATE operations creates a Google Meet link; for UPDATE operations preserves existing conference data if present, or adds a new Meet link if none exists. Google Workspace accounts will successfully receive a Meet link.',
        },
        'event_duration_hour': {
          'type': 'integer',
          'description': 'Number of hours for the event duration. Supports multi-day events (e.g., 240 hours = 10 days). For durations under 1 hour, use event_duration_minutes instead. Ignored if end_datetime is provided.',
        },
        'guestsCanInviteOthers': {
          'type': 'boolean',
          'description': 'Whether attendees other than the organizer can invite others to the event.',
        },
        'event_duration_minutes': {
          'type': 'integer',
          'description': 'Duration in minutes (0-59 ONLY). NEVER use 60+ minutes - use event_duration_hour=1 instead. Maximum value is 59. Combined duration (hours + minutes) must be greater than 0. Ignored if end_datetime is provided.',
        },
        'guestsCanSeeOtherGuests': {
          'type': 'boolean',
          'description': 'Whether attendees other than the organizer can see who the event\'s attendees are.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'googlecalendar_quick_add',
    label: 'Adding an event',
    category: ToolCategory.calendar,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Parses natural language text to quickly create a basic Google Calendar event with its title, date, and time, suitable for simple scheduling; does not support direct attendee addition or recurring events, and `calendar_id` must be valid if not \'primary\'. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'text': {
          'type': 'string',
          'description': 'Required natural language input describing the event. It must contain at least one non-whitespace character. Google Calendar parses it for event details like title, date, and time.',
        },
        'calendar_id': {
          'type': 'string',
          'description': 'Identifier of the calendar for the event. Use \'primary\' for the main calendar, or provide a specific calendar ID (e.g., email address).',
        },
      },
      'required': ['text'],
    },
  ),
  TelegramTool(
    name: 'googlecalendar_patch_event',
    label: 'Changing an event',
    category: ToolCategory.calendar,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Update specified fields of an existing event in a Google Calendar using patch semantics (array fields like `attendees` are fully replaced if provided); ensure the `calendar_id` and `event_id` are valid and the user has write access to the calendar. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'summary': {
          'type': 'string',
          'description': 'New title for the event.',
        },
        'color_id': {
          'type': 'string',
          'description': 'Color ID for the event (1-11). Use GOOGLECALENDAR_COLORS_GET to retrieve available colors.',
        },
        'end_time': {
          'type': 'string',
          'description': 'New end time (RFC3339 timestamp, e.g., \'2024-07-01T11:00:00-07:00\'). Explicit timezone information (Z or an offset) is preserved; offset-less values are interpreted in `timezone`, or UTC when it is omitted. For all-day events, use YYYY-MM-DD format (exclusive end date).',
        },
        'event_id': {
          'type': 'string',
          'description': 'The unique technical identifier of the event to update. IMPORTANT: This is NOT the event title/name. Event IDs are opaque strings typically base32hex encoded (5-1024 characters using lowercase a-v and digits 0-9).',
        },
        'location': {
          'type': 'string',
          'description': 'New geographic location (physical address or virtual meeting link).',
        },
        'sequence': {
          'type': 'integer',
          'description': 'Sequence number as per iCalendar specification. Incremented on each event update.',
        },
        'timezone': {
          'type': 'string',
          'description': 'IANA Time Zone Database name for start/end times (e.g., \'America/Los_Angeles\'). Interprets offset-less values and sets the display/recurrence zone; Z or numeric offsets still identify the instant.',
        },
        'attendees': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'List of valid email addresses for attendees (e.g., \'user@example.com\'). Replaces existing attendees. Provide an empty list to remove all.',
        },
        'recurrence': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'RRULE, EXRULE, RDATE and EXDATE lines per RFC5545 for recurring events. Replaces existing recurrence rules if provided.',
        },
        'start_time': {
          'type': 'string',
          'description': 'New start time (RFC3339 timestamp, e.g., \'2024-07-01T10:00:00-07:00\'). Explicit timezone information (Z or an offset) is preserved; offset-less values are interpreted in `timezone`, or UTC when it is omitted. For all-day events, use YYYY-MM-DD format.',
        },
        'attachments': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'File attachments (max 25). Each with \'fileUrl\' (required) and optional \'title\', \'mimeType\'. Requires supportsAttachments=true.',
        },
        'calendar_id': {
          'type': 'string',
          'description': 'Identifier of the calendar. Use \'primary\' for the primary calendar of the logged-in user. To find other calendar IDs, use the `calendarList.list` method. Must be provided in snake_case format.',
        },
        'description': {
          'type': 'string',
          'description': 'New description for the event; can include HTML.',
        },
        'max_attendees': {
          'type': 'integer',
          'description': 'Maximum attendees in response; does not affect invited count. If more, response includes organizer only. Must be positive.',
        },
        'attendees_omitted': {
          'type': 'boolean',
          'description': 'Whether attendees may have been omitted from the event\'s representation.',
        },
        'guests_can_modify': {
          'type': 'boolean',
          'description': 'Whether attendees other than the organizer can modify the event (default: false).',
        },
        'anyone_can_add_self': {
          'type': 'boolean',
          'description': 'Whether anyone can invite themselves to the event (default: false).',
        },
        'supports_attachments': {
          'type': 'boolean',
          'description': 'Client application supports event attachments. Set to `True` if so.',
        },
        'conference_data_version': {
          'type': 'integer',
          'description': 'API client\'s conference data support version. Set to 1 to manage conference details (e.g., Google Meet links); 0 (default) ignores conference data. Setting to 1 enables reading/preserving conference data but does not generate a new Meet link — use GOOGLECALENDAR_UPDATE_EVENT with `create_meeting_roo…',
        },
        'guests_can_invite_others': {
          'type': 'boolean',
          'description': 'Whether attendees other than the organizer can invite others (default: true).',
        },
        'guests_can_see_other_guests': {
          'type': 'boolean',
          'description': 'Whether attendees can see who the event\'s attendees are (default: true).',
        },
      },
      'required': ['event_id', 'calendar_id'],
    },
  ),
  TelegramTool(
    name: 'googlecalendar_delete_event',
    label: 'Deleting an event',
    category: ToolCategory.calendar,
    cost: ToolCost.apps,
    requiresApproval: true,
    destructive: true,
    description: 'Deletes an event from the specified calendar. Only Google\'s HTTP 204 confirms deletion; 404 or 410 can also mean the event belongs to a different calendar. Bulk deletions may trigger `rateLimitExceeded` or `userRateLimitExceeded`; cap concurrency to 5–10 requests and apply exponential backoff. Destructive: only when the user clearly asked for exactly this; it always waits for approval.',
    parameters: {
      'type': 'object',
      'properties': {
        'event_id': {
          'type': 'string',
          'description': 'Unique identifier of the event to delete. For standalone events, use the base event ID (e.g., \'abc123def456\'). For recurring event instances, use the instance ID format \'baseEventId_YYYYMMDDTHHMMSSZ\' (e.g., \'abc123def456_20260522T093000Z\') where the timestamp suffix represents the instance\'s origina…',
        },
        'calendar_id': {
          'type': 'string',
          'description': 'Identifier of the Google Calendar (e.g., email address, specific ID, or \'primary\' for the authenticated user\'s main calendar) from which the event will be deleted.',
        },
        'send_notifications': {
          'type': 'boolean',
          'description': 'Deprecated. Whether to send notifications about the deletion of the event. Note that some emails might still be sent.',
        },
      },
      'required': ['event_id'],
    },
  ),
  TelegramTool(
    name: 'googledrive_find_file',
    label: 'Searching your Drive',
    category: ToolCategory.googleDocs,
    cost: ToolCost.apps,
    description: 'The comprehensive Google Drive search tool that handles all file and folder discovery needs. Use this for any file finding task - from simple name searches to complex queries with date filters, MIME types, permissions, custom properties, folder scoping, and more. Searches across My Drive and shared drives with full metadata support.',
    parameters: {
      'type': 'object',
      'properties': {
        'q': {
          'type': 'string',
          'description': 'Query string to filter file results. Accepts both simple text searches and full Google Drive query syntax. **Simple Text Search:** Bare text (e.g., "SAM RFP") is auto-converted to fullText search. Bare email addresses are auto-converted to owner search.',
        },
        'spaces': {
          'type': 'string',
          'description': 'A comma-separated list of spaces to query. Supported values are \'drive\', \'appDataFolder\' and \'photos\'.',
        },
        'driveId': {
          'type': 'string',
          'description': 'ID of the shared drive to search. When provided, \'corpora\' will automatically be set to \'drive\' (mutually exclusive with corpora=\'allDrives\'). Required if \'corpora\' is \'drive\'.',
        },
        'orderBy': {
          'type': 'string',
          'description': 'Comma-separated sort keys. Ascending by default; add \'desc\' for descending. Cannot be used when query (q) contains fullText search terms. **Valid Keys:** - `createdTime`, `modifiedTime`, `modifiedByMeTime` - Dates - `viewedByMeTime`, `sharedWithMeTime` - Activity dates - `name`, `name_natural` - Fil…',
        },
        'pageSize': {
          'type': 'integer',
          'description': 'The maximum number of files to return per page.',
        },
        'folder_id': {
          'type': 'string',
          'description': 'ID of a specific folder to search within. This automatically adds "\'folder_id\' in parents" to the query. Can be combined with the \'q\' parameter to further filter results within the folder. Use \'root\' to search within the user\'s root folder (My Drive).',
        },
        'pageToken': {
          'type': 'string',
          'description': 'The token for continuing a previous list request on the next page. IMPORTANT: This must be the exact opaque string from a previous response\'s \'nextPageToken\' field - do not modify, truncate, URL-encode, or construct tokens manually. Invalid or corrupted tokens will result in API errors.',
        },
        'supportsAllDrives': {
          'type': 'boolean',
          'description': 'Whether the requesting application supports both My Drives and shared drives. If \'includeItemsFromAllDrives\' is true, this must also be true.',
        },
        'includeItemsFromAllDrives': {
          'type': 'boolean',
          'description': 'Whether both My Drive and shared drive items should be included in results. Must be true when corpora is \'drive\' or \'allDrives\'. If true, \'supportsAllDrives\' should also be true.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'googledrive_get_file_metadata',
    label: 'Looking at a Drive file',
    category: ToolCategory.googleDocs,
    cost: ToolCost.apps,
    description: 'Gets a Drive file\'s metadata by ID, optionally returning only the metadata selected by `fields`. Use `fields` such as `id,name,mimeType,parents,modifiedTime` when a compact partial response is needed; omit it for Google\'s default metadata. This does not download file content: use GOOGLEDRIVE_DOWNLOAD_FILE for native bytes or exported Workspace content.',
    parameters: {
      'type': 'object',
      'properties': {
        'fileId': {
          'type': 'string',
          'description': 'The Google Drive file ID (an opaque alphanumeric string like \'1a2b3c4d5e6f7g8h9i0j\'), NOT a file name. If you only have a file name, use googledrive_find_file or GOOGLEDRIVE_LIST_FILES to get the file ID first.',
        },
        'supportsAllDrives': {
          'type': 'boolean',
          'description': 'Whether the requesting application supports both My Drives and shared drives. Defaults to true to ensure files in shared drives are accessible.',
        },
      },
      'required': ['fileId'],
    },
  ),
  TelegramTool(
    name: 'googledrive_parse_file',
    label: 'Reading a Drive file',
    category: ToolCategory.googleDocs,
    cost: ToolCost.apps,
    description: 'DEPRECATED: Exports Google Workspace files (max 10MB) to a specified format using `mime_type`, or downloads other file types; use `GOOGLEDRIVE_DOWNLOAD_FILE` instead.',
    parameters: {
      'type': 'object',
      'properties': {
        'file_id': {
          'type': 'string',
          'description': 'The unique ID of the file stored in Google Drive that you want to export or download.',
        },
      },
      'required': ['file_id'],
    },
  ),
  TelegramTool(
    name: 'googledocs_search_documents',
    label: 'Searching your Docs',
    category: ToolCategory.googleDocs,
    cost: ToolCost.apps,
    description: 'Search for Google Documents using various filters including name, content, date ranges, and more.',
    parameters: {
      'type': 'object',
      'properties': {
        'query': {
          'type': 'string',
          'description': 'Search query to filter documents. Provide either: (1) Plain text to search in document content (e.g., \'quarterly report\'), which will search fullText, or (2) Drive API query syntax with operators like \'name contains\', \'fullText contains\', combined with \'and\', \'or\', \'not\'.',
        },
        'order_by': {
          'type': 'string',
          'description': 'Order results by field. Common options: \'modifiedTime desc\', \'modifiedTime asc\', \'name\', \'createdTime desc\'',
        },
        'page_token': {
          'type': 'string',
          'description': 'Token for continuing a previous search request on the next page. Use the next_page_token from the previous response to retrieve additional results.',
        },
        'max_results': {
          'type': 'integer',
          'description': 'Maximum number of documents to return per page (1-100). Defaults to 10. Use page_token for pagination when more results are available.',
        },
        'starred_only': {
          'type': 'boolean',
          'description': 'Whether to return only starred documents. Defaults to False.',
        },
        'created_after': {
          'type': 'string',
          'description': 'Return documents created after this date. Use RFC 3339 format like \'2024-01-01T00:00:00Z\'.',
        },
        'modified_after': {
          'type': 'string',
          'description': 'Return documents modified after this date. Use RFC 3339 format like \'2024-01-01T00:00:00Z\'.',
        },
        'shared_with_me': {
          'type': 'boolean',
          'description': 'Whether to return only documents shared with the current user. Defaults to False.',
        },
        'include_trashed': {
          'type': 'boolean',
          'description': 'Whether to include documents in trash. Defaults to False.',
        },
        'include_shared_drives': {
          'type': 'boolean',
          'description': 'Whether to include documents from shared drives you have access to. Defaults to True.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'googledocs_get_document_plaintext',
    label: 'Reading a Doc',
    category: ToolCategory.googleDocs,
    cost: ToolCost.apps,
    description: 'Retrieve a Google Doc by ID and return a best-effort plain-text rendering. Converts document structure into plain text including paragraphs, lists, and tables without requiring clients to traverse complex Docs API JSON.',
    parameters: {
      'type': 'object',
      'properties': {
        'tab_ids': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'Optional tab IDs to include when include_tabs_content=true. Nested child tabs are searched recursively.',
        },
        'document_id': {
          'type': 'string',
          'description': 'The unique identifier for the Google Document. Accepts either a document ID (typically a 44-character alphanumeric string) or a full Google Docs URL. When a URL is provided, the document ID will be automatically extracted.',
        },
        'include_tables': {
          'type': 'boolean',
          'description': 'Whether to include table content in the plain text output. Tables are rendered with configurable cell and row delimiters.',
        },
        'include_footers': {
          'type': 'boolean',
          'description': 'Whether to include footer text in the plain text output. Footers are appended with a clear section separator.',
        },
        'include_headers': {
          'type': 'boolean',
          'description': 'Whether to include header text in the plain text output. Headers are appended with a clear section separator.',
        },
        'include_footnotes': {
          'type': 'boolean',
          'description': 'Whether to include footnote text in the plain text output. Footnotes are appended with a clear section separator.',
        },
        'table_row_delimiter': {
          'type': 'string',
          'description': 'The delimiter to use between table rows (default: newline character).',
        },
        'include_tabs_content': {
          'type': 'boolean',
          'description': 'When true, fetch the document using includeTabsContent=true query parameter to render all tabs. When false, only the main body content is rendered.',
        },
        'table_cell_delimiter': {
          'type': 'string',
          'description': 'The delimiter to use between table cells (default: tab character).',
        },
      },
      'required': ['document_id'],
    },
  ),
  TelegramTool(
    name: 'googlesheets_search_spreadsheets',
    label: 'Searching your Sheets',
    category: ToolCategory.googleDocs,
    cost: ToolCost.apps,
    description: 'Search for Google Spreadsheets using various filters including name, content, date ranges, and more.',
    parameters: {
      'type': 'object',
      'properties': {
        'query': {
          'type': 'string',
          'description': 'Search query to filter spreadsheets. Behavior depends on the \'search_type\' parameter. For advanced searches, use Google Drive query syntax with fields like \'name contains\', \'fullText contains\', or boolean filters like \'sharedWithMe = true\'. DO NOT use spreadsheet IDs as search terms.',
        },
        'order_by': {
          'type': 'string',
          'description': 'Sort order (comma-separated list for multi-field sorting). Valid fields: createdTime, folder, modifiedByMeTime, modifiedTime, name, name_natural, quotaBytesUsed, recency, sharedWithMeTime, starred, viewedByMeTime. Append \' desc\' for descending order (default is ascending).',
        },
        'page_token': {
          'type': 'string',
          'description': 'Token for retrieving the next page of results. Use the \'next_page_token\' value from a previous response to get subsequent pages. Leave empty to get the first page.',
        },
        'max_results': {
          'type': 'integer',
          'description': 'Maximum number of spreadsheets to return (1-1000). Defaults to 10.',
        },
        'starred_only': {
          'type': 'boolean',
          'description': 'Whether to return only starred spreadsheets. Defaults to False.',
        },
        'created_after': {
          'type': 'string',
          'description': 'Return spreadsheets created after this date. Use RFC 3339 format like \'2024-01-01T00:00:00Z\'.',
        },
        'modified_after': {
          'type': 'string',
          'description': 'Return spreadsheets modified after this date. Use RFC 3339 format like \'2024-01-01T00:00:00Z\'.',
        },
        'shared_with_me': {
          'type': 'boolean',
          'description': 'Whether to return only spreadsheets shared with the current user. Defaults to False.',
        },
        'include_trashed': {
          'type': 'boolean',
          'description': 'Whether to include spreadsheets in trash. Defaults to False.',
        },
        'include_shared_drives': {
          'type': 'boolean',
          'description': 'Whether to include spreadsheets from shared drives you have access to. Defaults to True.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'googlesheets_get_sheet_names',
    label: 'Listing sheet tabs',
    category: ToolCategory.googleDocs,
    cost: ToolCost.apps,
    description: 'Lists all worksheet names from a specified Google Spreadsheet (which must exist), useful for discovering sheets before further operations.',
    parameters: {
      'type': 'object',
      'properties': {
        'exclude_hidden': {
          'type': 'boolean',
          'description': 'When True, hidden sheets will be excluded from the results. When False (default), all sheets including hidden ones are returned. Hidden sheets are sheets that have been hidden via the \'Hide sheet\' option in Google Sheets UI.',
        },
        'spreadsheet_id': {
          'type': 'string',
          'description': 'The unique identifier of the Google Spreadsheet (alphanumeric string, typically 44 characters). Extract only the ID portion from URLs - do not include leading/trailing slashes, \'/edit\' suffixes, query parameters, or URL fragments.',
        },
      },
      'required': ['spreadsheet_id'],
    },
  ),
  TelegramTool(
    name: 'googlesheets_values_get',
    label: 'Reading a spreadsheet',
    category: ToolCategory.googleDocs,
    cost: ToolCost.apps,
    description: 'Returns a range of values from a spreadsheet. Use when you need to read data from specific cells or ranges in a Google Sheet.',
    parameters: {
      'type': 'object',
      'properties': {
        'range': {
          'type': 'string',
          'description': 'The A1 notation or R1C1 notation of the range to retrieve values from. If the sheet name contains spaces or special characters, wrap the sheet name in single quotes (e.g., "\'My Sheet\'!A1:B2"). Without single quotes, the API will return a 400 error for sheet names with spaces.',
        },
        'end_row': {
          'type': 'integer',
          'description': '1-based row number to stop reading at (inclusive). Use with start_row for pagination to avoid large response errors. Example: start_row=501, end_row=1000 fetches rows 501-1000.',
        },
        'start_row': {
          'type': 'integer',
          'description': '1-based row number to start reading from (inclusive). Use with end_row for pagination to avoid large response errors. Example: start_row=1, end_row=500 fetches the first 500 rows.',
        },
        'spreadsheet_id': {
          'type': 'string',
          'description': 'The unique identifier of the Google Spreadsheet from which to retrieve values. This is the long alphanumeric string found in the spreadsheet URL between \'/d/\' and \'/edit\' (e.g., \'1BxiMVs0XRA5nFMdKvBdBZjgmUUqptlbs74OgvE2upms\').',
        },
      },
      'required': ['range', 'spreadsheet_id'],
    },
  ),
  TelegramTool(
    name: 'googledrive_create_file_from_text',
    label: 'Creating a Drive file',
    category: ToolCategory.googleDocs,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Creates a new file in Google Drive from provided text content (up to 10MB), supporting various formats including automatic conversion to Google Workspace types. Returns flat metadata fields (`id`, `mimeType`, `name`) at the top level — not nested under a `file` object. Created files are private by default; use a sharing tool afterward for collaborative access. Rapid successive calls may trigger `403 rateLimitExceeded` or `429 userRateLimitExceeded`; apply exponential backoff between retries. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'file_name': {
          'type': 'string',
          'description': 'Required. Desired name for the new file on Google Drive. Also accepts \'title\' or \'name\' as aliases.',
        },
        'mime_type': {
          'type': 'string',
          'description': 'MIME type for the new file, determining how Google Drive interprets its content. Must exactly match the content type — a mismatched value (e.g., `text/plain` for HTML) breaks Drive previews and downstream conversion.',
        },
        'parent_id': {
          'type': 'string',
          'description': 'IMPORTANT: Must be a valid Google Drive folder ID that exists and you have access to. Do NOT pass folder names - only folder IDs work. If omitted, the file is created in the root of \'My Drive\'. To get a folder ID from a folder name, use GOOGLEDRIVE_FIND_FOLDER first.',
        },
        'text_content': {
          'type': 'string',
          'description': 'Required. Plain text content to be written into the new file. Also accepts \'content\', \'body\', or \'text\' as aliases. Only the documented aliases (`content`, `body`, `text`) are accepted; undocumented keys like `file_content` cause an \'Invalid request data\' error. Must be UTF-8 encoded.',
        },
      },
      'required': ['file_name', 'text_content'],
    },
  ),
  TelegramTool(
    name: 'googledrive_create_folder',
    label: 'Creating a Drive folder',
    category: ToolCategory.googleDocs,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Creates a new folder in Google Drive, optionally within an EXISTING parent folder specified by its ID or name. The parent folder MUST already exist - use GOOGLEDRIVE_FIND_FOLDER first to verify the parent exists or find its ID. Google Drive permits duplicate folder names, so always store and reuse the folder ID returned by this action rather than relying on names for future lookups. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'name': {
          'type': 'string',
          'description': 'Name for the new folder. This is a required field.',
        },
        'parent_id': {
          'type': 'string',
          'description': 'ID or exact name of an EXISTING parent folder. IMPORTANT: The parent folder MUST already exist - this action will NOT create parent folders automatically. If you need to create nested folders, first use GOOGLEDRIVE_FIND_FOLDER to verify the parent exists, or create it with a separate call.',
        },
      },
      'required': ['name'],
    },
  ),
  TelegramTool(
    name: 'googledrive_add_file_sharing_preference',
    label: 'Sharing a Drive file',
    category: ToolCategory.googleDocs,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'DEPRECATED: Use GOOGLEDRIVE_CREATE_PERMISSION instead; use GOOGLEDRIVE_UPDATE_PERMISSION to modify existing permissions (avoids duplicate entries). Modifies sharing permissions for an existing Google Drive file, granting a specified role to a user, group, domain, or \'anyone\'. Bulk calls may trigger 403 rateLimitExceeded (~100 req/100s/user); use jittered exponential backoff. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'domain': {
          'type': 'string',
          'description': 'Domain to grant permission to (e.g., \'example.com\'). Required if \'type\' is \'domain\'.',
        },
        'file_id': {
          'type': 'string',
          'description': 'Unique identifier of the file to update sharing settings for. Must be an alphanumeric string containing only letters, numbers, hyphens, and underscores (no slashes, spaces, or other special characters).',
        },
        'email_address': {
          'type': 'string',
          'description': 'Email address of the user or group. Required if \'type\' is \'user\' or \'group\'.',
        },
        'transfer_ownership': {
          'type': 'boolean',
          'description': 'Whether to transfer ownership to the specified user. Required when role is \'owner\'. Only a single user can be specified in the request when transferring ownership. Ownership transfer is difficult to reverse — obtain explicit confirmation before setting true.',
        },
      },
      'required': ['file_id'],
    },
  ),
  TelegramTool(
    name: 'googledocs_create_document_markdown',
    label: 'Creating a Doc',
    category: ToolCategory.googleDocs,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Creates a new Google Docs document, optionally initializing it with a title and content provided as Markdown text. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'title': {
          'type': 'string',
          'description': 'The title for the new Google Docs document.',
        },
        'markdown_text': {
          'type': 'string',
          'description': 'The initial content for the document, formatted as Markdown. Also accepts \'content\' as an alias. Supports headings, real Google Docs lists including nested lists, multiple Markdown tables, task-list markers, images via publicly accessible URLs or matching image_assets uploads (max 2KB URL length aft…',
        },
      },
      'required': ['title'],
    },
  ),
  TelegramTool(
    name: 'googledocs_update_document_markdown',
    label: 'Rewriting a Doc',
    category: ToolCategory.googleDocs,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Replaces the entire content of an existing Google Docs document with new Markdown text; requires edit permissions for the document. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'id': {
          'type': 'string',
          'description': 'The unique identifier for the Google Docs document to update. Accepts either a document ID (alphanumeric string, length varies by document age - newer documents typically have 44-character IDs) or a full Google Docs URL (e.g., https://docs.google.com/document/d/{DOCUMENT_ID}/edit).',
        },
        'tab_id': {
          'type': 'string',
          'description': 'Optional tab ID to replace with the rendered Markdown. When omitted, the first tab is updated.',
        },
        'markdown': {
          'type': 'string',
          'description': 'Markdown content that will replace the document\'s entire existing content. Supports standard Markdown features.',
        },
      },
      'required': ['id', 'markdown'],
    },
  ),
  TelegramTool(
    name: 'googlesheets_spreadsheets_values_append',
    label: 'Adding rows to a sheet',
    category: ToolCategory.googleDocs,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Tool to append values to a spreadsheet. Use when you need to add new data to the end of an existing table in a Google Sheet. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'range': {
          'type': 'string',
          'description': 'A1 notation range used to locate a logical table. New rows are appended after the last row of that table within this range. First call googlesheets_get_sheet_names with this exact spreadsheet_id and use one of the returned sheet names; sheet names are case-sensitive and default names like \'Sheet1\' a…',
        },
        'values': {
          'type': 'array',
          'items': {
            'type': 'array',
            'items': {
              'type': 'string',
            },
          },
          'description': '2D array of values to append. Typically, each inner list is a ROW (majorDimension=ROWS). Use null/None for empty cells.',
        },
        'spreadsheetId': {
          'type': 'string',
          'description': 'The spreadsheet ID (typically 44 characters containing letters, numbers, hyphens, and underscores). Found in the URL between /d/ and /edit. NOT the sheet name (tab name) - that belongs in the \'range\' parameter.',
        },
        'includeValuesInResponse': {
          'type': 'boolean',
          'description': 'Determines if the update response should include the values of the cells that were appended. By default, responses do not include the updated values.',
        },
      },
      'required': ['range', 'values', 'spreadsheetId'],
    },
  ),
  TelegramTool(
    name: 'googlesheets_values_update',
    label: 'Updating a sheet',
    category: ToolCategory.googleDocs,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Tool to set values in a range of a Google Spreadsheet. Use when you need to update or overwrite existing cell values in a specific range. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'range': {
          'type': 'string',
          'description': 'The A1 notation of the range to update values in (e.g., \'Sheet1!A1:C2\', \'MySheet!C:C\', or \'A1:D5\'). Wrap sheet names containing spaces or special characters in single quotes; escape an apostrophe within a quoted sheet name by doubling it (e.g., "\'[Draft] Fall\'\'26\'!A1:B2").',
        },
        'values': {
          'type': 'array',
          'items': {
            'type': 'array',
            'items': {
              'type': 'string',
            },
          },
          'description': 'The data to write. This is an array of arrays, the outer array representing all the data and each inner array representing a major dimension. Each item in the inner array corresponds with one cell.',
        },
        'spreadsheet_id': {
          'type': 'string',
          'description': 'The unique identifier of the Google Spreadsheet to update. This ID can be found in the URL of the spreadsheet (e.g., https://docs.google.com/spreadsheets/d/{spreadsheet_id}/edit). Must be a non-empty string.',
        },
        'auto_expand_sheet': {
          'type': 'boolean',
          'description': 'If True (default), automatically expands the sheet\'s dimensions (adds columns/rows) when the target range exceeds the current grid limits. If False, the operation will fail with an error if the range exceeds grid limits.',
        },
        'include_values_in_response': {
          'type': 'boolean',
          'description': 'Determines if the update response should include the values of the cells that were updated. By default, responses do not include the updated values.',
        },
      },
      'required': ['range', 'values', 'spreadsheet_id'],
    },
  ),
  TelegramTool(
    name: 'googledrive_trash_file',
    label: 'Moving a Drive file to Trash',
    category: ToolCategory.googleDocs,
    cost: ToolCost.apps,
    requiresApproval: true,
    destructive: true,
    description: 'Tool to move a file or folder to trash (soft delete). Use when you need to delete a file but want to allow recovery via UNTRASH_FILE. This action is distinct from permanent deletion and provides a safer cleanup workflow. Destructive: only when the user clearly asked for exactly this; it always waits for approval.',
    parameters: {
      'type': 'object',
      'properties': {
        'file_id': {
          'type': 'string',
          'description': 'The ID of the file to trash.',
        },
        'supportsAllDrives': {
          'type': 'boolean',
          'description': 'Whether the requesting application supports both My Drives and shared drives. Defaults to true.',
        },
      },
      'required': ['file_id'],
    },
  ),
  TelegramTool(
    name: 'slack_list_all_channels',
    label: 'Listing Slack channels',
    category: ToolCategory.slack,
    cost: ToolCost.apps,
    description: 'Lists conversations available to the user with various filters and search options. Always use resolved `channel_id` (not display names) for downstream operations, as names may be non-unique. The `created` field in results is a Unix epoch timestamp (UTC). Pagination across large workspaces may return HTTP 429 with a `Retry-After` header; honor the delay and resume from the last successful cursor.',
    parameters: {
      'type': 'object',
      'properties': {
        'limit': {
          'type': 'integer',
          'description': 'Maximum number of channels to return per page (1 to 1000). Fewer channels may be returned than requested. This schema defaults to 1 if omitted.',
        },
        'types': {
          'type': 'string',
          'description': 'Comma-separated list of conversation types to include: `public_channel` (regular #channels everyone can join), `private_channel` (invite-only channels), `im` (1-on-1 direct messages), `mpim` (group direct messages with 3+ people). Defaults to `public_channel` if omitted.',
        },
        'cursor': {
          'type': 'string',
          'description': 'Pagination cursor (from a previous response\'s `next_cursor`) for the next page of results. Omit for the first page. Loop on `response_metadata.next_cursor` until it is empty to retrieve all channels; stopping early silently omits results.',
        },
        'team_id': {
          'type': 'string',
          'description': 'ID of the Slack workspace (team) to operate on, e.g. T0123456789. Use only with org-level Enterprise Grid tokens when you need to target a specific workspace; omit for single-workspace tokens.',
        },
        'exclude_archived': {
          'type': 'boolean',
          'description': 'Excludes archived channels if true. The API defaults to false (archived channels are included).',
        },
      },
    },
  ),
  TelegramTool(
    name: 'slack_find_channels',
    label: 'Finding Slack channels',
    category: ToolCategory.slack,
    cost: ToolCost.apps,
    description: 'Find channels in a Slack workspace by any criteria - name, topic, purpose, or description. Returns channel IDs (C*/G* prefixed) required by most Slack tools — always resolve names to IDs here before passing to other tools. NOTE: This action searches channels and conversations visible to the authenticated user.',
    parameters: {
      'type': 'object',
      'properties': {
        'limit': {
          'type': 'integer',
          'description': 'Maximum number of conversations to request from Slack in this single API page before local search filtering (1 to 999). Defaults to 50. Fewer matching channels may be returned; use response_metadata.next_cursor to search subsequent pages.',
        },
        'query': {
          'type': 'string',
          'description': 'Search query to find channels. Searches across channel name, topic, purpose, and description (case-insensitive partial matching). Leading \'#\' prefix is automatically stripped.',
        },
        'types': {
          'type': 'string',
          'description': 'Comma-separated list of channel types to include: `public_channel`, `private_channel`, `mpim` (multi-person direct message), `im` (direct message). Defaults to public and private channels.',
        },
        'cursor': {
          'type': 'string',
          'description': 'Pagination cursor from response_metadata.next_cursor of a previous response. Omit for the first page.',
        },
        'team_id': {
          'type': 'string',
          'description': 'ID of the Slack workspace (team) to operate on, e.g. T0123456789. Use only with org-level Enterprise Grid tokens when you need to target a specific workspace; omit for single-workspace tokens.',
        },
        'exact_match': {
          'type': 'boolean',
          'description': 'When true, only return channels whose name exactly matches the query (case-insensitive). Also matches against previous channel names and the \'general\' flag. When false, returns partial matches across name, topic, and purpose. Defaults to false.',
        },
        'member_only': {
          'type': 'boolean',
          'description': 'Only return channels the user is a member of. Defaults to false.',
        },
        'exclude_archived': {
          'type': 'boolean',
          'description': 'Exclude archived channels from search results. Defaults to true.',
        },
      },
      'required': ['query'],
    },
  ),
  TelegramTool(
    name: 'slack_fetch_conversation_history',
    label: 'Reading a Slack channel',
    category: ToolCategory.slack,
    cost: ToolCost.apps,
    description: 'Fetches a chronological list of messages and events from a specified Slack conversation, accessible by the authenticated user/bot, with options for pagination and time range filtering. IMPORTANT LIMITATION: This action only returns messages from the main channel timeline. Threaded replies are NOT returned by this endpoint. To retrieve threaded replies, use the slack_fetch_message_thread_from_a_conversation action (conversations.replies API) instead.',
    parameters: {
      'type': 'object',
      'properties': {
        'limit': {
          'type': 'integer',
          'description': 'Maximum number of messages to request in this single Slack API call (1-1000). Defaults to 100. Slack may return fewer than requested, especially for non-Marketplace apps where Slack can cap each page at 15 messages.',
        },
        'cursor': {
          'type': 'string',
          'description': 'Pagination cursor from `response_metadata.next_cursor` of a previous response. Omit this for the first page; pass the returned cursor in a follow-up call to fetch the next page.',
        },
        'latest': {
          'type': 'string',
          'description': 'End of the time range of messages to include in results. Accepts a Unix timestamp or a Slack timestamp (e.g., \'1234567890.000000\'). NOTE: This filter only applies to main channel messages, not threaded replies. Use slack_fetch_message_thread_from_a_conversation to retrieve replies.',
        },
        'oldest': {
          'type': 'string',
          'description': 'Start of the time range of messages to include in results. Accepts a Unix timestamp or a Slack timestamp (e.g., \'1234567890.000000\'). NOTE: This filter only applies to main channel messages, not threaded replies. Use slack_fetch_message_thread_from_a_conversation to retrieve replies.',
        },
        'channel': {
          'type': 'string',
          'description': 'The ID of the public channel, private channel, direct message, or multi-person direct message to fetch history from.',
        },
        'inclusive': {
          'type': 'boolean',
          'description': 'When true, includes messages at the exact \'oldest\' or \'latest\' boundary timestamps in results. When false (default), excludes boundary messages. Only applies when \'oldest\' or \'latest\' is specified.',
        },
      },
      'required': ['channel'],
    },
  ),
  TelegramTool(
    name: 'slack_fetch_message_thread_from_a_conversation',
    label: 'Reading a Slack thread',
    category: ToolCategory.slack,
    cost: ToolCost.apps,
    description: 'Retrieves replies to a specific parent message in a Slack conversation, using the channel ID and the parent message\'s timestamp (`ts`). Note: The parent message in the response contains metadata (reply_count, reply_users, latest_reply) that indicates expected thread activity.',
    parameters: {
      'type': 'object',
      'properties': {
        'ts': {
          'type': 'string',
          'description': 'Timestamp of the parent message in the thread. Must be an existing message. If no replies, only the parent message itself is returned. Must be the exact full timestamp string of the root/parent message — not a reply\'s ts, a truncated value, a permalink, or an integer; these silently return wrong res…',
        },
        'limit': {
          'type': 'integer',
          'description': 'Maximum number of messages to return. Fewer may be returned even if more are available.',
        },
        'cursor': {
          'type': 'string',
          'description': 'Pagination cursor from `response_metadata.next_cursor` of a previous response to get subsequent pages. If omitted, fetches the first page.',
        },
        'latest': {
          'type': 'string',
          'description': 'Latest message timestamp in the time range to include results.',
        },
        'oldest': {
          'type': 'string',
          'description': 'Oldest message timestamp in the time range to include results. Must be a UTC-based Slack ts string; incorrect timezone conversion or rounding can produce empty result windows.',
        },
        'channel': {
          'type': 'string',
          'description': 'ID of the conversation (channel, direct message, etc.) to fetch the thread from. Must be a channel ID, not a channel name. Token must have membership in private channels or DMs, otherwise returns empty results or `not_in_channel`/`channel_not_found`.',
        },
        'inclusive': {
          'type': 'boolean',
          'description': 'Whether to include messages with `latest` or `oldest` timestamps in results. Effective only if `latest` or `oldest` is specified.',
        },
      },
      'required': ['ts', 'channel'],
    },
  ),
  TelegramTool(
    name: 'slack_search_messages',
    label: 'Searching Slack',
    category: ToolCategory.slack,
    cost: ToolCost.apps,
    description: 'Workspace‑wide Slack message search with date ranges and filters. Use `query` modifiers (e.g., in:#channel, from:@user, before/after:YYYY-MM-DD), sorting (score/timestamp), and pagination.',
    parameters: {
      'type': 'object',
      'properties': {
        'page': {
          'type': 'integer',
          'description': 'Page number for manual pagination control. Cannot be used with auto_paginate - choose either automatic collection OR manual page control, not both.',
        },
        'sort': {
          'type': 'string',
          'description': 'Sort results by `score` (relevance) or `timestamp` (chronological).',
        },
        'count': {
          'type': 'integer',
          'description': 'Without auto_paginate: Number of messages per page (max 100). With auto_paginate: Total messages desired. Set count=500 to get 500 messages with automatic pagination handling.',
        },
        'query': {
          'type': 'string',
          'description': 'Search query supporting various modifiers for precise filtering: **Location Modifiers:** - `in:#channel-name` - Messages in specific channel - `in:@username` - Direct messages with user **User Modifiers:** - `from:@username` - Messages from specific user - `from:botname` - Messages from bot **Conten…',
        },
        'cursor': {
          'type': 'string',
          'description': 'Cursor for cursor-mark pagination. Use `*` for the first call, then use `next_cursor` from the previous response for subsequent calls. This is the modern pagination approach recommended by Slack. Cannot be used with `page` parameter - choose either cursor-based or page-based pagination.',
        },
        'team_id': {
          'type': 'string',
          'description': 'ID of the Slack workspace (team) to operate on, e.g. T0123456789. Use only with org-level Enterprise Grid tokens when you need to target a specific workspace; omit for single-workspace tokens.',
        },
        'sort_dir': {
          'type': 'string',
          'description': 'Sort direction: `asc` (ascending) or `desc` (descending).',
        },
      },
      'required': ['query'],
    },
  ),
  TelegramTool(
    name: 'slack_list_unread_channel_messages',
    label: 'Checking unread Slack',
    category: ToolCategory.slack,
    cost: ToolCost.apps,
    description: 'Lists all unread messages in a specified Slack channel for the authenticated user. This action fetches messages that have been posted since the user\'s last read position in the channel. Use this action when you need to retrieve messages the user hasn\'t seen yet. The action determines the user\'s read position and returns all messages posted after that timestamp. Note: This only returns messages from the main channel timeline, not threaded replies.',
    parameters: {
      'type': 'object',
      'properties': {
        'limit': {
          'type': 'integer',
          'description': 'Maximum number of unread messages to return (1-1000). Defaults to 25. Use pagination cursor for additional messages.',
        },
        'cursor': {
          'type': 'string',
          'description': 'Pagination cursor from response_metadata.next_cursor of a previous response. Omit for the first page.',
        },
        'channel': {
          'type': 'string',
          'description': 'The ID of the channel to fetch unread messages from. Must be a channel, private channel, or group DM that the authenticated user is a member of.',
        },
      },
      'required': ['channel'],
    },
  ),
  TelegramTool(
    name: 'slack_find_users',
    label: 'Finding Slack people',
    category: ToolCategory.slack,
    cost: ToolCost.apps,
    description: 'Find users in a Slack workspace by any criteria - email, name, display name, or other text. Includes optimized email lookup for exact email matches. Zero results may reflect email visibility restrictions or workspace policies, not global absence. Repeated calls may trigger HTTP 429; honor the Retry-After header.',
    parameters: {
      'type': 'object',
      'properties': {
        'email': {
          'type': 'string',
          'description': 'Email address to search for. This is a convenience parameter that automatically performs an email-based search. Either email or search_query parameter is required.',
        },
        'limit': {
          'type': 'integer',
          'description': 'Maximum number of users to request from Slack in this single API page before local search filtering (1 to 1000). Defaults to 50. Fewer matching users may be returned; use response_metadata.next_cursor to search subsequent pages.',
        },
        'cursor': {
          'type': 'string',
          'description': 'Pagination cursor from response_metadata.next_cursor of a previous users.list response. Used for general searches; omit for the first page.',
        },
        'team_id': {
          'type': 'string',
          'description': 'ID of the Slack workspace (team) to operate on, e.g. T0123456789. Use only with org-level Enterprise Grid tokens when you need to target a specific workspace; omit for single-workspace tokens.',
        },
        'exact_match': {
          'type': 'boolean',
          'description': 'When true, only returns users with exact matches on name, display name, real name, first name, last name, or email fields (case-insensitive). For email queries, uses Slack\'s dedicated email lookup endpoint. When false, allows partial/substring matching. Defaults to false.',
        },
        'include_bots': {
          'type': 'boolean',
          'description': 'Include bot users in search results. Defaults to false.',
        },
        'search_query': {
          'type': 'string',
          'description': 'Search query to find users. Can be a Slack user ID (e.g., \'U012ABCDEF\'), email address, or name. For user IDs (starting with \'U\' or \'W\'), uses Slack\'s users.info API directly. For email addresses with exact_match=true, uses Slack\'s email lookup endpoint.',
        },
        'include_locale': {
          'type': 'boolean',
          'description': 'Include the `locale` field for each user. Defaults to `false`.',
        },
        'include_deleted': {
          'type': 'boolean',
          'description': 'Include deleted/deactivated users in search results. Defaults to false.',
        },
        'include_restricted': {
          'type': 'boolean',
          'description': 'Include restricted (guest) users in search results. Defaults to true.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'slack_list_reminders',
    label: 'Listing Slack reminders',
    category: ToolCategory.slack,
    cost: ToolCost.apps,
    description: 'Lists all reminders with their details for the authenticated Slack user; returns an empty array if no reminders exist (valid state, not an error). Reminder text is not unique—perform client-side matching on returned objects before extracting a reminder ID for use with SLACK_DELETE_A_SLACK_REMINDER.',
    parameters: {
      'type': 'object',
      'properties': {
        'team_id': {
          'type': 'string',
          'description': 'ID of the Slack workspace (team) to operate on, e.g. T0123456789. Use only with org-level Enterprise Grid tokens when you need to target a specific workspace; omit for single-workspace tokens.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'slack_send_message',
    label: 'Sending a Slack message',
    category: ToolCategory.slack,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Posts a message to a Slack channel, DM, or private group. Provide exactly one visible content mode: `markdown_text` for normal Markdown content, or `blocks` for raw Slack Block Kit layouts. Use `fallback_text` only with `blocks`; it maps to Slack\'s top-level `text` fallback. Fails with `not_in_channel`, `channel_not_found`, or `channel_is_archived` if the bot lacks access. Rate-limited at ~1 req/sec (HTTP 429, honor `Retry-After`). Not idempotent — duplicate calls post duplicate messages. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'blocks': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'Use this instead of `markdown_text` only when you need Slack Block Kit capabilities that Markdown cannot express: buttons, approval/reject actions, select menus, checkboxes, radio buttons, date/time pickers, overflow menus, interactive workflow payloads, section accessories, image/video blocks, cont…',
        },
        'channel': {
          'type': 'string',
          'description': 'ID or name of the channel, private group, or IM channel to send the message to. Can be specified as either \'channel\' or \'channel_id\'. Do NOT include the \'#\' prefix (e.g., use \'general\' not \'#general\') - any leading \'#\' will be automatically stripped.',
        },
        'thread_ts': {
          'type': 'string',
          'description': 'Timestamp (`ts`) of an existing message to make this a threaded reply. Use `ts` of the parent message, not another reply. Example: \'1476746824.000004\'.',
        },
        'unfurl_links': {
          'type': 'boolean',
          'description': 'Enable unfurling of text-based URLs. Defaults `false` for bots, `true` if `as_user` is `true`.',
        },
        'unfurl_media': {
          'type': 'boolean',
          'description': 'Enable media previews (images, videos) from URLs. Set to `true` (default) to show media previews, `false` to hide them.',
        },
        'fallback_text': {
          'type': 'string',
          'description': 'Optional only when using `blocks`. Maps to Slack\'s top-level `text` field for notifications, accessibility, search previews, and clients that cannot render blocks. This should be a short plain-text summary of the block content, not another visible message body.',
        },
        'markdown_text': {
          'type': 'string',
          'description': 'Use this for normal LLM-written message content. Pass standard Markdown exactly as written; this tool sends it to Slack\'s native `markdown_text` argument without converting it to blocks. Do not use this together with `blocks`.',
        },
        'reply_broadcast': {
          'type': 'boolean',
          'description': 'If `true` for a threaded reply, also posts to main channel. Defaults to `false`.',
        },
      },
      'required': ['channel'],
    },
  ),
  TelegramTool(
    name: 'slack_schedule_message',
    label: 'Scheduling a Slack message',
    category: ToolCategory.slack,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Schedules a message to a Slack channel, DM, or private group for a future time (`post_at`), requiring `text`, `blocks`, or `attachments` for content; scheduling is limited to 120 days in advance. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'text': {
          'type': 'string',
          'description': 'This sends raw text only, use markdown_text field for formatting. Primary text of the message; formatting with `mrkdwn` applies. Required if `blocks` and `attachments` are not provided.',
        },
        'parse': {
          'type': 'string',
          'description': 'Message text treatment: `full` for special formatting, `none` otherwise (default). See Slack\'s `chat.postMessage` docs for options.',
        },
        'blocks': {
          'type': 'string',
          'description': '**DEPRECATED**: Use `markdown_text` field instead. JSON array of structured blocks as a URL-encoded string for message layout and design. Required if `text` and `attachments` are not provided.',
        },
        'channel': {
          'type': 'string',
          'description': 'Channel, private group, or DM channel ID (e.g., C1234567890) or name (e.g., #general) to send the message to. Bot must be a member of the target channel; missing membership returns `not_in_channel` error.',
        },
        'post_at': {
          'type': 'string',
          'description': 'Unix EPOCH timestamp (integer seconds since 1970-01-01 00:00:00 UTC) for the future message send time. Must be strictly greater than current time (past values return `time_in_past` error). Always convert local times to UTC epoch seconds before use; Slack evaluates in UTC only.',
        },
        'thread_ts': {
          'type': 'string',
          'description': 'Timestamp of the parent message for the scheduled message to be a thread reply. Must be float seconds (e.g., `1234567890.123456`).',
        },
        'link_names': {
          'type': 'boolean',
          'description': 'Pass true to automatically link channel names (e.g., #general) and usernames (e.g., @user). NOTE: This parameter is deprecated by Slack; the linking behavior is primarily controlled by Slack\'s default message parsing.',
        },
        'attachments': {
          'type': 'string',
          'description': 'This is Slack\'s legacy \'secondary attachments\' field for adding rich formatting elements like colored sidebars, structured fields, and author info. Pass as a JSON string array. NOT for file/image uploads. To send files or images, use \'SLACK_UPLOAD_OR_CREATE_A_FILE_IN_SLACK\' instead.',
        },
        'unfurl_links': {
          'type': 'boolean',
          'description': 'Pass false to disable automatic link unfurling. Defaults to true. NOTE: Due to a known Slack API limitation, this parameter may not be respected for scheduled messages (works correctly for chat.postMessage but may be ignored by chat.scheduleMessage).',
        },
        'unfurl_media': {
          'type': 'boolean',
          'description': 'Pass false to disable automatic media unfurling. Defaults to true. NOTE: Due to a known Slack API limitation, this parameter may not be respected for scheduled messages (works correctly for chat.postMessage but may be ignored by chat.scheduleMessage).',
        },
        'markdown_text': {
          'type': 'string',
          'description': '**PREFERRED**: Write your scheduled message in markdown for nicely formatted display. Supports headers (#), bold (**text**), italic (*text*), strikethrough (~~text~~), code (```), links ([text](url)), quotes (>), and dividers (---). Your message will be posted with beautiful formatting.',
        },
        'reply_broadcast': {
          'type': 'boolean',
          'description': 'With `thread_ts`, makes reply visible to all in channel, not just thread members. Defaults to `false`.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'slack_updates_a_slack_message',
    label: 'Editing a Slack message',
    category: ToolCategory.slack,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Updates a Slack message by timestamp. Provide exactly one visible content mode: `markdown_text` for normal Markdown content, or `blocks` for raw Slack Block Kit layouts. Use `fallback_text` only with `blocks`; it maps to Slack\'s top-level `text` fallback. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'ts': {
          'type': 'string',
          'description': 'Timestamp of the message to update (string, Unix time with microseconds, e.g., `\'1234567890.123456\'`).',
        },
        'blocks': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'Use this instead of `markdown_text` only when updating to Slack Block Kit capabilities that Markdown cannot express: buttons, approval/reject actions, select menus, checkboxes, radio buttons, date/time pickers, overflow menus, interactive workflow payloads, section accessories, image/video blocks, c…',
        },
        'as_user': {
          'type': 'boolean',
          'description': 'Pass `true` to update the message as the authenticated user; applicable to bot users as well.',
        },
        'channel': {
          'type': 'string',
          'description': 'ID or name of the channel, private group, or IM channel containing the message to update. Can be specified as either \'channel\' or \'channel_id\'. Do NOT include the \'#\' prefix (e.g., use \'general\' not \'#general\') - any leading \'#\' will be automatically stripped.',
        },
        'file_ids': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'Array of file IDs to attach to the updated message. Files must already be uploaded to Slack.',
        },
        'fallback_text': {
          'type': 'string',
          'description': 'Optional only when using `blocks`. Maps to Slack\'s top-level `text` field for notifications, accessibility, search previews, and clients that cannot render blocks. This should be a short plain-text summary of the block content, not another visible message body.',
        },
        'markdown_text': {
          'type': 'string',
          'description': 'Use this for normal LLM-written updated message content. Pass standard Markdown exactly as written; this tool sends it to Slack\'s native `markdown_text` argument without converting it to blocks. Do not use this together with `blocks`.',
        },
        'reply_broadcast': {
          'type': 'boolean',
          'description': 'If `true` and the message is a thread reply, broadcast the updated message to the channel. Defaults to `false`.',
        },
      },
      'required': ['ts', 'channel'],
    },
  ),
  TelegramTool(
    name: 'slack_add_reaction_to_an_item',
    label: 'Reacting in Slack',
    category: ToolCategory.slack,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Adds a specified emoji reaction to an existing message in a Slack channel, identified by its timestamp; does not remove or retrieve reactions. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'name': {
          'type': 'string',
          'description': 'Name of the emoji to add as a reaction (e.g., \'thumbsup\'). This is the emoji name without colons. For emojis with skin tone modifiers, append \'::skin-tone-X\' where X is a number from 2 to 6 (e.g., \'wave::skin-tone-3\').',
        },
        'channel': {
          'type': 'string',
          'description': 'ID of the channel where the message to add the reaction to was posted.',
        },
        'timestamp': {
          'type': 'string',
          'description': 'Timestamp of the message to which the reaction will be added. This is a unique identifier for the message, typically a string representing a float value like \'1234567890.123456\'. Must be the exact message timestamp; permalinks or approximate values will not work.',
        },
      },
      'required': ['name', 'channel', 'timestamp'],
    },
  ),
  TelegramTool(
    name: 'slack_set_status',
    label: 'Setting your Slack status',
    category: ToolCategory.slack,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: '(DEPRECATED: use `SLACK_SET_USER_PROFILE`) Updates a Slack user\'s profile, setting either individual fields or multiple fields via a JSON object. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'name': {
          'type': 'string',
          'description': 'Name of a single profile field to set. Use with `value` if `profile` is not provided.',
        },
        'user': {
          'type': 'string',
          'description': 'ID of the user whose profile will be updated; defaults to authenticated user. Team admins on paid teams can specify another member\'s ID.',
        },
        'value': {
          'type': 'string',
          'description': 'Value for the single profile field specified by `name`. Use with `name` if `profile` is not provided.',
        },
        'profile': {
          'type': 'string',
          'description': 'JSON string of key-value pairs for profile fields to update (max 50 fields, 255 chars per field name). Pass as a plain JSON string (not URL-encoded). If provided, `name` and `value` are ignored.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'slack_create_a_reminder',
    label: 'Adding a Slack reminder',
    category: ToolCategory.slack,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Creates a Slack reminder with specified text and time; time accepts Unix timestamps, seconds from now, or natural language (e.g., \'in 15 minutes\', \'every Thursday at 2pm\'). Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'text': {
          'type': 'string',
          'description': 'The textual content of the reminder message.',
        },
        'time': {
          'type': 'string',
          'description': 'Specifies when the reminder should occur. This can be a Unix timestamp (integer, up to five years from now), the number of seconds until the reminder (integer, if within 24 hours, e.g., \'300\' for 5 minutes), or a natural language description (string, e.g., "in 15 minutes," or "every Thursday at 2pm"…',
        },
        'user': {
          'type': 'string',
          'description': 'The ID of the user who will receive the reminder (e.g., \'U012AB3CD4E\'). If not specified, the reminder will be sent to the user who created it. NOTE: Setting reminders for other users is no longer supported for user tokens - only bot tokens can set reminders for other users.',
        },
        'team_id': {
          'type': 'string',
          'description': 'ID of the Slack workspace (team) to operate on, e.g. T0123456789. Use only with org-level Enterprise Grid tokens when you need to target a specific workspace; omit for single-workspace tokens.',
        },
      },
      'required': ['text', 'time'],
    },
  ),
  TelegramTool(
    name: 'slack_deletes_a_message_from_a_chat',
    label: 'Deleting a Slack message',
    category: ToolCategory.slack,
    cost: ToolCost.apps,
    requiresApproval: true,
    destructive: true,
    description: 'Deletes a message, identified by its channel ID and timestamp, from a Slack channel, private group, or direct message conversation; the authenticated user or bot must be the original poster. Destructive: only when the user clearly asked for exactly this; it always waits for approval.',
    parameters: {
      'type': 'object',
      'properties': {
        'ts': {
          'type': 'string',
          'description': 'Timestamp of the message to be deleted. Must be the exact Slack message timestamp string with fractional precision, e.g., \'1234567890.123456\'. Thread replies use their own `ts`; ephemeral messages and certain app-posted messages cannot be deleted via this method even with a valid timestamp.',
        },
        'as_user': {
          'type': 'boolean',
          'description': 'Legacy parameter for classic Slack apps. Pass true to delete the message as the authed user. Bot tokens can only delete messages posted by that bot. This parameter is primarily for legacy apps and is generally not needed with modern bot tokens.',
        },
        'channel': {
          'type': 'string',
          'description': 'The ID of the channel, private group, or direct message conversation containing the message to be deleted.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'slack_leave_a_conversation',
    label: 'Leaving a Slack channel',
    category: ToolCategory.slack,
    cost: ToolCost.apps,
    requiresApproval: true,
    destructive: true,
    description: '(DEPRECATED: use `SLACK_LEAVE_CONVERSATION`) Leaves a Slack conversation given its channel ID; fails if leaving as the last member of a private channel or if used on a Slack Connect channel. Destructive: only when the user clearly asked for exactly this; it always waits for approval.',
    parameters: {
      'type': 'object',
      'properties': {
        'channel': {
          'type': 'string',
          'description': 'ID of the conversation to leave (e.g., C1234567890).',
        },
      },
      'required': ['channel'],
    },
  ),
  TelegramTool(
    name: 'slack_archive_conversation',
    label: 'Archiving a Slack channel',
    category: ToolCategory.slack,
    cost: ToolCost.apps,
    requiresApproval: true,
    destructive: true,
    description: 'Archives a Slack conversation by its ID, rendering it read-only and hidden while retaining history, ideal for cleaning up inactive channels; be aware that some channels (like #general or certain DMs) cannot be archived and this may impact connected integrations. Destructive: only when the user clearly asked for exactly this; it always waits for approval.',
    parameters: {
      'type': 'object',
      'properties': {
        'channel': {
          'type': 'string',
          'description': 'ID of the Slack conversation to archive. This ID uniquely identifies a channel (e.g., public, private).',
        },
      },
    },
  ),
  TelegramTool(
    name: 'notion_search_notion_page',
    label: 'Searching Notion',
    category: ToolCategory.notion,
    cost: ToolCost.apps,
    description: 'Searches Notion pages and databases by title. Use specific search terms to find items by title (primary approach). KNOWN LIMITATIONS: (1) Search indexing is not immediate - recently shared items may not appear. (2) Search is not exhaustive - results may be incomplete. (3) Database pages return all custom properties with full nested structures, which can create large responses for databases with many properties - use filter_properties to reduce response size.',
    parameters: {
      'type': 'object',
      'properties': {
        'query': {
          'type': 'string',
          'description': 'Text to search for in page and database titles. Use specific search terms to find items by title (primary approach). Note: Notion\'s search has known limitations - indexing is not immediate and recently shared items may not appear.',
        },
        'direction': {
          'type': 'string',
          'description': 'Specifies the sort direction for the results. Required if `timestamp` is provided. Valid values are `ascending` or `descending`.',
        },
        'page_size': {
          'type': 'integer',
          'description': 'The number of items to include in the response. Must be an integer between 1 and 100, inclusive. Defaults to 25.',
        },
        'timestamp': {
          'type': 'string',
          'description': 'The timestamp field to sort the results by. Currently, the only supported value is `last_edited_time`. If provided, `direction` must also be specified.',
        },
        'start_cursor': {
          'type': 'string',
          'description': 'An opaque cursor value from a previous response\'s `next_cursor` field. Must be exactly as returned by the API - do not pass page IDs, database IDs, or any other identifiers. If `None`, empty, or invalid, results start from the beginning.',
        },
        'filter_property': {
          'type': 'string',
          'description': 'The property to filter the search results by. Currently, the only supported value is `object`, which filters by the type specified in `filter_value`. Defaults to `object`.',
        },
        'filter_properties': {
          'type': 'array',
          'items': {
            'type': 'object',
          },
          'description': 'List of property names to include in the response for page results. When specified, only these properties will be returned in each page\'s \'properties\' object, reducing response size. Useful for database pages with many custom properties. If not specified, all properties are returned.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'notion_get_page_markdown',
    label: 'Reading a Notion page',
    category: ToolCategory.notion,
    cost: ToolCost.apps,
    description: 'Retrieve a Notion page\'s full content rendered as Notion-flavored Markdown in a single API call. Use when you need the readable content of a page without recursive block-children fetching.',
    parameters: {
      'type': 'object',
      'properties': {
        'page_id': {
          'type': 'string',
          'description': 'The UUID of the Notion page to retrieve as markdown. Accepts both hyphenated (8-4-4-4-12) and unhyphenated (32 characters) UUID formats. This endpoint retrieves the full page content rendered as Notion-flavored Markdown in a single API call, avoiding the need for recursive block-children fetching.',
        },
        'include_transcript': {
          'type': 'boolean',
          'description': 'Set to true to include meeting note transcripts in the markdown response. Defaults to false if not specified.',
        },
      },
      'required': ['page_id'],
    },
  ),
  TelegramTool(
    name: 'notion_fetch_data',
    label: 'Browsing Notion',
    category: ToolCategory.notion,
    cost: ToolCost.apps,
    description: 'Fetches Notion items (pages and/or databases) from the Notion workspace, use this to get minimal data about the items in the workspace with a query or list all items in the workspace with minimal data',
    parameters: {
      'type': 'object',
      'properties': {
        'query': {
          'type': 'string',
          'description': 'An optional search query to filter pages and/or databases by their title or content. If not provided (None or empty string), all accessible items matching the selected type (pages, databases, or both) are returned.',
        },
        'page_size': {
          'type': 'integer',
          'description': 'The maximum number of items per page (1-100). IMPORTANT: Notion API enforces a hard maximum of 100 items per request - values above 100 will be automatically capped to 100. To retrieve more than 100 items, use pagination by passing the returned \'next_cursor\' value in subsequent requests.',
        },
        'start_cursor': {
          'type': 'string',
          'description': 'Pagination cursor to fetch the next page of results. Pass the \'next_cursor\' value from a previous response to retrieve the next page. When null or not provided, the first page is returned.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'notion_query_database',
    label: 'Reading a Notion database',
    category: ToolCategory.notion,
    cost: ToolCost.apps,
    description: 'Queries a Notion database to retrieve pages (rows). In Notion, databases are collections where each row is a page and columns are properties. Returns paginated results with metadata. Important requirements: - The database must be shared with your integration - Property names in sorts must match existing database properties exactly (case-sensitive) - For timestamp sorting, use \'created_time\' or \'last_edited_time\' (case-insensitive) - The start_cursor must be the opaque value from a previous response\'s next_cursor fi…',
    parameters: {
      'type': 'object',
      'properties': {
        'sorts': {
          'type': 'array',
          'items': {
            'type': 'object',
          },
          'description': 'List of sort rules to order the database query results. Each sort rule must specify: \'property_name\' (name of database property or timestamp field) and \'ascending\' (True/False). For database properties: names must match exactly (case-sensitive).',
        },
        'page_size': {
          'type': 'integer',
          'description': 'Number of items (database rows/pages) to return per request. Valid range: 1-100. Default is 100. The API may return fewer items than requested if that\'s all that\'s available.',
        },
        'database_id': {
          'type': 'string',
          'description': 'The UUID of the Notion DATABASE to query (32-character hex string, optionally with hyphens). Query parameters (e.g., ?v=viewid) from Notion URLs are automatically stripped. IMPORTANT: This must be a DATABASE ID, not a page ID. Pages and databases are different object types in Notion.',
        },
        'start_cursor': {
          'type': 'string',
          'description': 'An opaque pagination cursor for fetching the next page of results. Use the exact \'next_cursor\' field from a previous query response. If omitted, returns the first page.',
        },
      },
      'required': ['database_id'],
    },
  ),
  TelegramTool(
    name: 'notion_fetch_database',
    label: 'Looking at a Notion database',
    category: ToolCategory.notion,
    cost: ToolCost.apps,
    description: 'Fetches a Notion database\'s structural metadata (properties, title, etc.) via its `database_id`, not the data entries; `database_id` must reference an existing database.',
    parameters: {
      'type': 'object',
      'properties': {
        'database_id': {
          'type': 'string',
          'description': 'Required. The unique identifier of the Notion database in UUID format (e.g., \'2ec43c10-7ecd-8159-a8f4-ff16630df66c\') or unhyphenated 32-char hex (e.g., \'2ec43c107ecd8159a8f4ff16630df66c\'). Must be a DATABASE ID, not a page ID.',
        },
      },
      'required': ['database_id'],
    },
  ),
  TelegramTool(
    name: 'notion_fetch_comments',
    label: 'Reading Notion comments',
    category: ToolCategory.notion,
    cost: ToolCost.apps,
    description: 'Fetches unresolved comments for a specified Notion block or page ID. The block/page must be shared with your Notion integration and the integration must have \'Read comments\' capability enabled, otherwise a 404 error will be returned.',
    parameters: {
      'type': 'object',
      'properties': {
        'page_id': {
          'type': 'string',
          'description': 'Identifier for a Notion page from which to fetch comments. This is an alias for block_id since pages are blocks in Notion. Provide either page_id or block_id, but not both. IMPORTANT: The page must be shared with your Notion integration - if not shared, you will receive a 404 error.',
        },
        'block_id': {
          'type': 'string',
          'description': 'Identifier for a Notion block from which to fetch comments. In Notion, pages are technically blocks, so you can pass a page ID here as well. Provide either block_id or page_id, but not both.',
        },
        'page_size': {
          'type': 'integer',
          'description': 'The number of comments to return in a single response page. Must be between 1 and 100, inclusive. Default is 100.',
        },
        'start_cursor': {
          'type': 'string',
          'description': 'A pagination cursor. If provided, the response will contain the page of results starting after this cursor. If omitted, the first page of results is returned.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'notion_create_notion_page',
    label: 'Creating a Notion page',
    category: ToolCategory.notion,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Creates a new page in a Notion workspace under a specified parent page or database. Supports creating pages with markdown content using the native markdown parameter, or as an empty page that can be populated later. PREREQUISITES: - Parent page/database must exist and be accessible in your Notion workspace - Use search_pages or list_databases first to obtain valid parent IDs LIMITATIONS: - Cannot create root-level pages (must have a parent) - May encounter conflicts if creating pages too quickly - Title-based paren… Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'icon': {
          'type': 'string',
          'description': 'An emoji to be used as the icon for the new page. Must be a single emoji character. If the title starts with this emoji, it will be stripped from the title text to prevent duplication.',
        },
        'cover': {
          'type': 'string',
          'description': 'The URL of an image to be used as the cover for the new page. The URL must be publicly accessible.',
        },
        'title': {
          'type': 'string',
          'description': 'The title of the new page to be created. If an icon emoji is provided and the title starts with the same emoji, it will be automatically removed from the title to avoid duplication.',
        },
        'markdown': {
          'type': 'string',
          'description': 'Page content as Notion-flavored Markdown. When provided, the page will be created from this markdown string. If properties.title is omitted, the first # h1 heading will be extracted as the page title. This parameter is mutually exclusive with children and content parameters.',
        },
        'parent_id': {
          'type': 'string',
          'description': 'CRITICAL: Must be either: 1) A valid Notion UUID in dashed format (8-4-4-4-12 hex characters like \'59833787-2cf9-4fdf-8782-e53db20768a5\') or dashless format (32 hex characters like \'598337872cf94fdf8782e53db20768a5\') of an existing Notion page or database.',
        },
      },
      'required': ['title', 'parent_id'],
    },
  ),
  TelegramTool(
    name: 'notion_add_multiple_page_content',
    label: 'Adding to a Notion page',
    category: ToolCategory.notion,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Bulk-add content blocks to Notion. Text >2000 chars auto-splits. Parses markdown formatting. ⚠️ PARENT BLOCK TYPES: Content is added AS CHILDREN of parent_block_id. - To add content AFTER a heading, use PAGE ID as parent + heading ID in \'after\' param. - Headings CANNOT have children unless is_toggleable=True. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'after': {
          'type': 'string',
          'description': 'Block ID to insert content AFTER (as siblings). Use this to add content after a heading: set parent_block_id to the PAGE ID and \'after\' to the HEADING block ID. The new blocks appear immediately after this block at the same nesting level.',
        },
        'content_blocks': {
          'type': 'array',
          'items': {
            'type': 'object',
          },
          'description': '⚠️ CRITICAL: Notion API enforces 2000 char limit per text.content field. Content >2000 chars auto-splits. List of blocks to add (max 100). Each item can be in EITHER format: A) Unwrapped (recommended): {\'content\': \'text\', \'block_property\': \'paragraph\'} B) Wrapped: {\'content_block\': {\'content\': \'text…',
        },
        'parent_block_id': {
          'type': 'string',
          'description': 'The UUID of the parent page or block where content will be added AS CHILDREN (nested inside). ⚠️ COMMON MISTAKE: To add content AFTER a block (as siblings), use the page ID as parent_block_id and specify the block ID in the \'after\' parameter.',
        },
      },
      'required': ['content_blocks', 'parent_block_id'],
    },
  ),
  TelegramTool(
    name: 'notion_insert_row_database',
    label: 'Adding a Notion row',
    category: ToolCategory.notion,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Creates a new page (row) in a specified Notion database. Prerequisites: - Database must be shared with your integration - Property names AND types must match schema exactly (case-sensitive) - Use notion_fetch_data with fetch_type=\'databases\' first to get exact property names and types - Each database has ONE \'title\' property; other text fields are \'rich_text\' - Database must NOT have multiple data sources (synced databases are not supported) Common Errors: - 404: Database not shared with integration - 400 "not a pr… Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'icon': {
          'type': 'string',
          'description': 'Emoji to be used as the page icon. Must be a single emoji character.',
        },
        'cover': {
          'type': 'string',
          'description': 'URL of an external image to set as the page cover. The URL must point to a publicly accessible image.',
        },
        'properties': {
          'type': 'array',
          'items': {
            'type': 'object',
          },
          'description': 'Property values for the new page. Accepts a LIST of objects or a JSON-encoded string. Each object must include: `name` (exact property name, case-sensitive), `type` (property data type), and `value` (string-formatted value).',
        },
        'database_id': {
          'type': 'string',
          'description': 'Identifier (UUID) of the Notion database where the new page (row) will be inserted. Can be provided with or without hyphens (e.g., \'59833787-2cf9-4fdf-8782-e53db20768a5\' or \'598337872cf94fdf8782e53db20768a5\').',
        },
        'child_blocks': {
          'type': 'array',
          'items': {
            'type': 'object',
          },
          'description': 'A list of `NotionRichText` objects defining content blocks (e.g., paragraphs, headings, media) to append to the new page\'s body. Accepts either a list of objects OR a JSON-encoded string representing a list. If omitted, the page body will be empty.',
        },
      },
      'required': ['database_id'],
    },
  ),
  TelegramTool(
    name: 'notion_update_row_database',
    label: 'Updating a Notion row',
    category: ToolCategory.notion,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Updates a specific row/page within a Notion database by its page UUID (row_id). IMPORTANT CLARIFICATION: This action updates INDIVIDUAL ROWS (pages) in a database, NOT the database structure. - To update a ROW/PAGE: Use THIS action with `row_id` (the page UUID) - To update DATABASE SCHEMA (columns, properties, title): Use NOTION_UPDATE_SCHEMA_DATABASE with `database_id` REQUIRED: `row_id` is MANDATORY. This is the UUID of the specific page/row to update. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'icon': {
          'type': 'string',
          'description': 'The emoji to be used as the icon for the page. Must be a single emoji character (e.g., \'😻\', \'🤔\'). Empty strings or whitespace-only values are ignored.',
        },
        'cover': {
          'type': 'string',
          'description': 'URL of an external image to be used as the cover for the page (e.g., \'https://google.com/image.png\'). Empty strings or whitespace-only values are ignored.',
        },
        'row_id': {
          'type': 'string',
          'description': 'REQUIRED: The page UUID of the database row to update. This is a PAGE ID (not a database ID). A database row in Notion is actually a page - use the page\'s UUID here. Format: 32-character UUID with hyphens (e.g., \'59833787-2cf9-4fdf-8782-e53db20768a5\'). NOT a URL or page title.',
        },
        'delete_row': {
          'type': 'boolean',
          'description': 'If true, the row (page) will be archived, effectively deleting it from the active view. If the page is already archived, the action will return success with the current page state. If false, the row will be updated with other provided data.',
        },
        'properties': {
          'type': 'array',
          'items': {
            'type': 'object',
          },
          'description': 'List of properties to update. Each property requires: (1) \'name\' - exact property name as shown in Notion, (2) \'type\' - the property type (title, rich_text, number, select, status, multi_select, date, people, relation, checkbox, url, email, phone_number, files), (3) \'value\' - formatted according to…',
        },
      },
      'required': ['row_id'],
    },
  ),
  TelegramTool(
    name: 'notion_create_comment',
    label: 'Commenting in Notion',
    category: ToolCategory.notion,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Adds a comment to a Notion page (via `parent_page_id`) OR to an existing discussion thread (via `discussion_id`); cannot create new discussion threads on specific blocks (inline comments). Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'comment': {
          'type': 'object',
          'description': 'Content of the comment as a NotionRichText object or a JSON string. Simplest form: {\'content\': \'Looks good!\'} or {\'text\': \'Looks good!\'} (both \'content\' and \'text\' are accepted as the field name). Can also be passed as a JSON string: \'{"content": "Looks good!"}\'.',
        },
        'discussion_id': {
          'type': 'string',
          'description': 'The ID of an existing discussion thread to which the comment will be added. This is required if `parent_page_id` is not provided. Must be a valid UUID (32 hex characters with or without hyphens).',
        },
        'parent_page_id': {
          'type': 'string',
          'description': 'The ID of the Notion page where the comment will be added. This is required if `discussion_id` is not provided. Must be a valid UUID (32 hex characters with or without hyphens). Page IDs can be obtained using other Notion actions that fetch page details or list pages.',
        },
      },
      'required': ['comment'],
    },
  ),
  TelegramTool(
    name: 'notion_archive_notion_page',
    label: 'Archiving a Notion page',
    category: ToolCategory.notion,
    cost: ToolCost.apps,
    requiresApproval: true,
    destructive: true,
    description: 'Archives (moves to trash) or unarchives (restores from trash) a specified Notion page. Limitation: Workspace-level pages (top-level pages with no parent page or database) cannot be archived via the API and must be archived manually in the Notion UI. Destructive: only when the user clearly asked for exactly this; it always waits for approval.',
    parameters: {
      'type': 'object',
      'properties': {
        'archive': {
          'type': 'boolean',
          'description': 'Set to `true` to move the page to trash (archive), or `false` to restore it from trash (unarchive). Defaults to `true`.',
        },
        'page_id': {
          'type': 'string',
          'description': 'The unique identifier (UUID) of the Notion page to be archived or unarchived. Must be a page ID, not a database ID. Note: Workspace-level pages (pages that sit at the root of your workspace with no parent page or database) cannot be archived via the API - only pages nested under other pages or datab…',
        },
      },
      'required': ['page_id'],
    },
  ),
  TelegramTool(
    name: 'notion_replace_page_content',
    label: 'Replacing a Notion page',
    category: ToolCategory.notion,
    cost: ToolCost.apps,
    requiresApproval: true,
    destructive: true,
    description: 'Safely replaces a page\'s child blocks by optionally backing up current content, deleting existing children, then appending new children in batches. Use when you need to rebuild a page without leaving partial states. Notion does not provide atomic transactions; this tool orchestrates a multi-step workflow with optional backup to reduce risk. Destructive: only when the user clearly asked for exactly this; it always waits for approval.',
    parameters: {
      'type': 'object',
      'properties': {
        'page_id': {
          'type': 'string',
          'description': 'The unique identifier (UUID) of the page whose content will be replaced. Must be a valid Notion page ID in UUID format (with or without hyphens).',
        },
        'new_children': {
          'type': 'array',
          'items': {
            'type': 'object',
          },
          'description': 'Array of block objects to append to the page after clearing existing content. Supported types: paragraph, heading_1/2/3, bulleted_list_item, numbered_list_item, to_do, toggle, callout, code, quote, equation, image, video, audio, file, pdf, embed, bookmark, divider, table_of_contents, breadcrumb, col…',
        },
        'create_backup': {
          'type': 'boolean',
          'description': 'Whether to create a backup page with the current content before replacing it. Strongly recommended when replacing important content.',
        },
        'backup_title_suffix': {
          'type': 'string',
          'description': 'Suffix to append to the original page title when creating a backup page.',
        },
        'archive_existing_children': {
          'type': 'boolean',
          'description': 'Whether to delete (archive) existing child blocks before appending new content. Set to False to keep existing content and only append new blocks.',
        },
      },
      'required': ['page_id', 'new_children'],
    },
  ),
  TelegramTool(
    name: 'notion_delete_block',
    label: 'Deleting a Notion block',
    category: ToolCategory.notion,
    cost: ToolCost.apps,
    requiresApproval: true,
    destructive: true,
    description: 'Archives a Notion block, page, or database using its ID, which sets its \'archived\' property to true (like moving to "Trash" in the UI) and allows it to be restored later. Note: This operation will fail if the block has an archived parent or ancestor in the hierarchy. You must unarchive the ancestor before archiving/deleting its descendants. Destructive: only when the user clearly asked for exactly this; it always waits for approval.',
    parameters: {
      'type': 'object',
      'properties': {
        'block_id': {
          'type': 'string',
          'description': 'Identifier of the block, page, or database to be deleted (archived). Must be a valid Notion block/page/database ID in UUID format (with or without hyphens).',
        },
      },
      'required': ['block_id'],
    },
  ),
  TelegramTool(
    name: 'github_list_notifications',
    label: 'Checking GitHub notifications',
    category: ToolCategory.githubAccount,
    cost: ToolCost.apps,
    description: 'Tool to list notification threads for the authenticated user with efficient polling support. Use when you need to fetch the user\'s GitHub notification inbox with filters like unread/participating/since. Returns notification threads plus polling headers (Last-Modified, ETag, X-Poll-Interval) for efficient polling. IMPORTANT: This endpoint requires a Personal Access Token (classic) with \'notifications\' or \'repo\' scope. It does NOT work with GitHub App tokens or fine-grained personal access tokens.',
    parameters: {
      'type': 'object',
      'properties': {
        'all': {
          'type': 'boolean',
          'description': 'If true, show notifications marked as read. Default shows only unread notifications.',
        },
        'page': {
          'type': 'integer',
          'description': 'Page number of results to fetch.',
        },
        'since': {
          'type': 'string',
          'description': 'Only show notifications updated after the given ISO 8601 timestamp (YYYY-MM-DDTHH:MM:SSZ).',
        },
        'before': {
          'type': 'string',
          'description': 'Only show notifications updated before the given ISO 8601 timestamp (YYYY-MM-DDTHH:MM:SSZ).',
        },
        'per_page': {
          'type': 'integer',
          'description': 'Number of results per page (maximum 50).',
        },
        'participating': {
          'type': 'boolean',
          'description': 'If true, only shows notifications in which the user is directly participating or mentioned.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'github_search_issues_and_pull_requests',
    label: 'Searching your GitHub',
    category: ToolCategory.githubAccount,
    cost: ToolCost.apps,
    description: 'Searches GitHub for issues and pull requests. Supports keywords, qualifiers (repo:, org:, user:, state:, label:, author:, assignee:, mentions:, etc.), and type filters (is:issue, is:pr). Type filters cannot be used alone - they must be combined with at least one keyword or other qualifier. All other qualifiers work independently. The @me shorthand (e.g., assignee:@me, mentions:@me) is automatically resolved to your username.',
    parameters: {
      'type': 'object',
      'properties': {
        'q': {
          'type': 'string',
          'description': 'Search query using GitHub\'s search syntax. Supports keywords, qualifiers (repo:, org:, user:, state:, label:, author:, assignee:, mentions:, etc.), and type filters (is:issue, is:pr).',
        },
        'page': {
          'type': 'integer',
          'description': 'Page number for results.',
        },
        'per_page': {
          'type': 'integer',
          'description': 'Number of results per page.',
        },
      },
      'required': ['q'],
    },
  ),
  TelegramTool(
    name: 'github_get_an_issue',
    label: 'Opening an issue',
    category: ToolCategory.githubAccount,
    cost: ToolCost.apps,
    description: 'Retrieves detailed information about a specific issue in a repository using the owner, repository name, and issue number.',
    parameters: {
      'type': 'object',
      'properties': {
        'repo': {
          'type': 'string',
          'description': 'Name of the repository (without `.git` extension). Not case-sensitive.',
        },
        'owner': {
          'type': 'string',
          'description': 'Username of the account owning the repository. Not case-sensitive.',
        },
        'issue_number': {
          'type': 'integer',
          'description': 'The identifying number of the issue.',
        },
      },
      'required': ['repo', 'owner', 'issue_number'],
    },
  ),
  TelegramTool(
    name: 'github_get_a_pull_request',
    label: 'Opening a pull request',
    category: ToolCategory.githubAccount,
    cost: ToolCost.apps,
    description: 'Retrieves a specific pull request from a GitHub repository using its owner, repository name, and pull request number.',
    parameters: {
      'type': 'object',
      'properties': {
        'repo': {
          'type': 'string',
          'description': 'The name of the repository, without the .git extension. This value is not case sensitive.',
        },
        'owner': {
          'type': 'string',
          'description': 'The username of the account that owns the repository. This value is not case sensitive.',
        },
        'pull_number': {
          'type': 'integer',
          'description': 'The number that identifies the specific pull request.',
        },
      },
      'required': ['repo', 'owner', 'pull_number'],
    },
  ),
  TelegramTool(
    name: 'github_create_an_issue',
    label: 'Opening an issue',
    category: ToolCategory.githubAccount,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Creates a new issue in a GitHub repository, requiring the repository to exist and have issues enabled; specific fields like assignees, milestone, or labels may require push access. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'body': {
          'type': 'string',
          'description': 'The detailed textual contents of the new issue.',
        },
        'repo': {
          'type': 'string',
          'description': 'The name of the repository, without the `.git` extension (case-insensitive). The repository must exist, be accessible, and have issues enabled.',
        },
        'owner': {
          'type': 'string',
          'description': 'The GitHub account owner of the repository (case-insensitive). The repository must exist and be accessible to the authenticated user.',
        },
        'title': {
          'type': 'string',
          'description': 'The title for the new issue.',
        },
        'labels': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'Array of label names to associate with this issue (generally case-insensitive). NOTE: Only users with push access can set labels; they are silently dropped otherwise. Pass an empty list to clear all labels.',
        },
        'assignee': {
          'type': 'string',
          'description': 'Login for the user to whom this issue should be assigned. NOTE: Only users with push access can set the assignee; it is silently dropped otherwise. **This field is deprecated in favor of `assignees`.**',
        },
        'assignees': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'GitHub login names for users to assign to this issue. NOTE: Only users with push access can set assignees; they are silently dropped otherwise.',
        },
        'milestone': {
          'type': 'string',
          'description': 'The ID of the milestone to associate this issue with (e.g., "5"). NOTE: Only users with push access can set the milestone; it is silently dropped otherwise.',
        },
      },
      'required': ['repo', 'owner', 'title'],
    },
  ),
  TelegramTool(
    name: 'github_create_an_issue_comment',
    label: 'Commenting on GitHub',
    category: ToolCategory.githubAccount,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Creates a new comment on an existing GitHub issue or pull request within the specified repository. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'body': {
          'type': 'string',
          'description': 'Comment content in GitHub Flavored Markdown.',
        },
        'repo': {
          'type': 'string',
          'description': 'Name of the repository (without `.git` extension); not case-sensitive.',
        },
        'owner': {
          'type': 'string',
          'description': 'Account owner of the repository (username or organization); not case-sensitive.',
        },
        'issue_number': {
          'type': 'integer',
          'description': 'Number identifying the issue or pull request for the comment.',
        },
      },
      'required': ['body', 'repo', 'owner', 'issue_number'],
    },
  ),
  TelegramTool(
    name: 'github_mark_notifications_as_read',
    label: 'Clearing GitHub notifications',
    category: ToolCategory.githubAccount,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Marks notifications as read or unread, optionally for those updated at or before a `last_read_at` timestamp. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'read': {
          'type': 'boolean',
          'description': 'Indicates whether to mark targeted notifications as read (`true`) or unread (`false`). Defaults to `true` (mark as read) if not provided.',
        },
        'last_read_at': {
          'type': 'string',
          'description': 'If provided, only notifications updated at or before this timestamp are affected. If omitted, all current notifications are targeted.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'github_close_issue',
    label: 'Closing an issue',
    category: ToolCategory.githubAccount,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Close a GitHub issue by setting its state to closed. Use this action when you need to mark an issue as resolved or no longer relevant. Optionally specify a reason for closing (completed or not_planned) to provide context. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'repo': {
          'type': 'string',
          'description': 'The name of the repository without the `.git` extension. The name is not case sensitive.',
        },
        'owner': {
          'type': 'string',
          'description': 'The account owner of the repository. The name is not case sensitive.',
        },
        'issue_number': {
          'type': 'integer',
          'description': 'The number that identifies the issue.',
        },
      },
      'required': ['repo', 'owner', 'issue_number'],
    },
  ),
  TelegramTool(
    name: 'github_merge_a_pull_request',
    label: 'Merging a pull request',
    category: ToolCategory.githubAccount,
    cost: ToolCost.apps,
    requiresApproval: true,
    destructive: true,
    description: 'Merges an open and mergeable pull request in a repository. A 405 error can occur for multiple reasons: (1) The PR is still in draft mode - convert it to ready-for-review first using GITHUB_UPDATE_A_PULL_REQUEST. (2) Branch protection rules are not satisfied - check for required approving reviews, status checks, or other repository rules that must be met before merging. (3) The base branch has been modified since the PR was last synced - update the PR branch first using GITHUB_UPDATE_A_PULL_REQUEST_BRANCH. Destructive: only when the user clearly asked for exactly this; it always waits for approval.',
    parameters: {
      'type': 'object',
      'properties': {
        'sha': {
          'type': 'string',
          'description': 'SHA of the pull request\'s head commit. Must match for merge to succeed, ensuring PR hasn\'t changed since review.',
        },
        'repo': {
          'type': 'string',
          'description': 'Repository name, without the `.git` extension. Not case-sensitive.',
        },
        'owner': {
          'type': 'string',
          'description': 'Repository owner\'s username. Not case-sensitive.',
        },
        'pull_number': {
          'type': 'integer',
          'description': 'The unique number identifying the pull request. The PR must be mergeable: not a draft, and all branch protection rules (required reviews, status checks, etc.) must be satisfied.',
        },
        'commit_title': {
          'type': 'string',
          'description': 'Title for the merge commit message.',
        },
        'commit_message': {
          'type': 'string',
          'description': 'Additional details for the merge commit message.',
        },
      },
      'required': ['repo', 'owner', 'pull_number'],
    },
  ),
  TelegramTool(
    name: 'linear_list_linear_issues',
    label: 'Listing Linear issues',
    category: ToolCategory.linear,
    cost: ToolCost.apps,
    description: 'Lists non-archived Linear issues; if project_id is not specified, issues from all accessible projects are returned. Can filter by assignee_id. Only project_id and assignee_id server-side filters are supported; label, state, team, cycle, or date filters must be done client-side or via LINEAR_RUN_QUERY_OR_MUTATION. Response is a flat issues array plus page_info object (not GraphQL nodes/pageInfo).',
    parameters: {
      'type': 'object',
      'properties': {
        'after': {
          'type': 'string',
          'description': 'Cursor for pagination (opaque string). Use the exact `endCursor` value from the previous response\'s `page_info` to fetch the next set of issues. Do not modify, prefix, or transform the cursor value in any way.',
        },
        'first': {
          'type': 'integer',
          'description': 'Number of issues to return. Maximum 250 per page. To retrieve all issues, loop using page_info.hasNextPage and pass page_info.endCursor as after until hasNextPage is false.',
        },
        'project_id': {
          'type': 'string',
          'description': 'ID of the project to filter issues by. If provided, only issues belonging to this project will be returned. Must be a valid project ID that exists and is accessible to the authenticated user.',
        },
        'assignee_id': {
          'type': 'string',
          'description': 'UUID of the user to filter issues by assignee. Use \'me\' to filter by the current authenticated user, or provide a valid Linear user UUID (format: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx). Use LINEAR_GET_CURRENT_USER to get your own ID, or LINEAR_LIST_LINEAR_USERS to retrieve other user UUIDs.',
        },
        'include_transitions': {
          'type': 'boolean',
          'description': 'When true, includes the full status transition history for each issue, along with timestamps and computed time-in-state durations. When false (default), the tool returns the standard limited issue object with no transition data.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'linear_search_issues',
    label: 'Searching Linear',
    category: ToolCategory.linear,
    cost: ToolCost.apps,
    description: 'Search Linear issues using full-text search across identifier, title, and description. Use when you need to find issues by keywords or specific identifiers. Note: This endpoint only supports full-text search; for structured filtering by team, project, assignee, state, or labels, use LIST_ISSUES_BY_TEAM_ID instead.',
    parameters: {
      'type': 'object',
      'properties': {
        'after': {
          'type': 'string',
          'description': 'Cursor for pagination. Use the endCursor from the previous response\'s page_info to fetch the next page of results.',
        },
        'first': {
          'type': 'integer',
          'description': 'Number of issues to return per page. Must be between 1 and 50. Defaults to 25.',
        },
        'query': {
          'type': 'string',
          'description': 'The search query text. Searches across issue identifier (e.g., \'ENG-123\'), title, and description fields. This is a full-text search only; structured filtering by team, project, assignee, state, or labels is NOT supported on this endpoint. Use LIST_ISSUES_BY_TEAM_ID for filtered queries.',
        },
        'include_archived': {
          'type': 'boolean',
          'description': 'Whether to include archived issues in search results. Defaults to false (only active issues).',
        },
      },
      'required': ['query'],
    },
  ),
  TelegramTool(
    name: 'linear_get_linear_issue',
    label: 'Opening a Linear issue',
    category: ToolCategory.linear,
    cost: ToolCost.apps,
    description: 'Retrieves an existing Linear issue\'s comprehensive details, including id, identifier, title, description, timestamps, state, team, creator, attachments, comments (with user info and timestamps, use issue.comments.nodes for comment IDs), subscribers, and due date. Embedded screenshots are uploads.linear.app URLs in description/comment Markdown, not Attachment records; download them with LINEAR_GET_ATTACHMENT\'s upload_url input.',
    parameters: {
      'type': 'object',
      'properties': {
        'issue_id': {
          'type': 'string',
          'description': 'ID of the Linear issue. Must be in one of two formats: (1) UUID format: a 36-character string with hyphens (e.g., \'c5748ccf-c67f-4af4-bd74-fe513dc4c054\'), or (2) Shorthand identifier: team key (alphanumeric, must start with a letter, 1-10 chars) followed by hyphen and issue number (e.g., \'ENG-123\',…',
        },
      },
      'required': ['issue_id'],
    },
  ),
  TelegramTool(
    name: 'linear_list_linear_teams',
    label: 'Listing Linear teams',
    category: ToolCategory.linear,
    cost: ToolCost.apps,
    description: 'Retrieves all teams with their members and projects. Use stable team IDs or keys (not display names) for subsequent operations — names are non-unique. Results reflect only teams visible to the authenticated token scope; missing teams or members indicate permission limits. Large workspaces paginate via pageInfo.hasNextPage/endCursor — incomplete pagination silently drops teams or members. Members may belong to multiple teams; deduplicate user IDs when aggregating.',
    parameters: {
      'type': 'object',
      'properties': {
        'after': {
          'type': 'string',
          'description': 'Cursor for pagination. Use the `endCursor` value from the previous response\'s `page_info` to fetch the next page.',
        },
        'first': {
          'type': 'integer',
          'description': 'Number of teams to return per page. Maximum 250. Use with `after` to paginate through all teams.',
        },
        'project_id': {
          'type': 'string',
          'description': 'Optional project ID to filter teams\' associated projects. If provided, only projects matching this ID will be included in each team\'s \'projects\' list. If not provided, all projects for each team will be returned.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'linear_list_linear_projects',
    label: 'Listing Linear projects',
    category: ToolCategory.linear,
    cost: ToolCost.apps,
    description: 'Retrieves all projects from the Linear account. Returns a flat array (not a GraphQL connection) with fields id and name; use LINEAR_RUN_QUERY_OR_MUTATION for progress, state, issues, or team linkage. No server-side filtering: all workspace projects are returned regardless of team or name — filter client-side. Multiple projects can share identical names; always confirm project_id before downstream use. Results are permission-scoped to the connected user.',
    parameters: {
      'type': 'object',
      'properties': {
        'after': {
          'type': 'string',
          'description': 'Cursor for pagination. Use the `endCursor` from the previous response\'s `page_info` to fetch the next page.',
        },
        'first': {
          'type': 'integer',
          'description': 'Number of projects to return per page. Use with `after` to paginate through all projects.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'linear_create_linear_issue',
    label: 'Creating a Linear issue',
    category: ToolCategory.linear,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Creates a new issue in a specified Linear project and team, requiring team_id and title, and allowing optional properties like description, assignee, state, priority, cycle, and due date. All UUID parameters (state_id, assignee_id, cycle_id, label_ids, project_id) must belong to the same team as team_id. The created issue\'s id is returned in data.id — capture it for use as parent_id in sub-issues or follow-up operations. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'title': {
          'type': 'string',
          'description': 'The title of the new issue.',
        },
        'team_id': {
          'type': 'string',
          'description': 'UUID of the team responsible for this issue. IMPORTANT: You must use a valid team UUID that exists in your Linear workspace and that the authenticated user has access to. Use the LINEAR_GET_ALL_LINEAR_TEAMS action to retrieve the list of available teams and their UUIDs.',
        },
        'cycle_id': {
          'type': 'string',
          'description': 'UUID of the cycle (sprint) to assign this issue to. Cycles are time-bound periods used to organize and prioritize work. Only applicable if the team has cycles feature enabled. Must be a valid UUID format. Must belong to the same team as team_id.',
        },
        'due_date': {
          'type': 'string',
          'description': 'The target completion date for the issue in ISO8601 datetime format or YYYY-MM-DD TimelessDate format (e.g., \'2024-12-31\' or \'2024-12-31T23:59:59Z\')',
        },
        'estimate': {
          'type': 'integer',
          'description': 'The estimated complexity or effort for the issue, represented as a numerical point value (e.g., 1, 2, 3, 5, 8). The specific scale used (e.g., Fibonacci, Linear, T-shirt sizes mapped to numbers) is defined by the team\'s settings.',
        },
        'priority': {
          'type': 'integer',
          'description': 'Priority of the issue. 0 indicates no priority, 1 is Urgent, 2 is High, 3 is Normal, and 4 is Low.',
        },
        'state_id': {
          'type': 'string',
          'description': 'UUID of the workflow state to assign to the issue (must be a valid UUID format, not a state name like \'backlog\' or \'done\') Must belong to the same team as team_id — cross-team state UUIDs will be rejected.',
        },
        'label_ids': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'A list of UUIDs for labels to be added to this issue. EXCLUSIVE GROUP CONSTRAINT: Linear organizes labels into groups where only ONE label per group can be applied. STEP-BY-STEP: (1) Call LINEAR_LIST_LINEAR_LABELS with team_id to get available labels.',
        },
        'parent_id': {
          'type': 'string',
          'description': 'UUID of an existing issue to set as the parent of this new issue, creating a sub-issue relationship (must be a valid UUID format)',
        },
        'project_id': {
          'type': 'string',
          'description': 'UUID of the project to associate with this issue. Must be a valid UUID format (xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx with 8-4-4-4-12 hex characters). IMPORTANT: The project must belong to the same team specified in team_id - Linear requires projects and issues to be in the same team.',
        },
        'assignee_id': {
          'type': 'string',
          'description': 'UUID of the user to assign to this issue (must be a valid UUID format) User must be a member of the team specified in team_id.',
        },
        'description': {
          'type': 'string',
          'description': 'A detailed description of the issue, which can include markdown formatting.',
        },
      },
      'required': ['title', 'team_id'],
    },
  ),
  TelegramTool(
    name: 'linear_update_issue',
    label: 'Updating a Linear issue',
    category: ToolCategory.linear,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Updates an existing Linear issue using its `issue_id`; requires at least one other attribute for modification, and all provided entity IDs (for state, assignee, labels, etc.) must be valid UUIDs — only `issueId` accepts key format (e.g., \'ENG-123\'). All updated fields are fully overwritten, not merged; omit any field you do not intend to change. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'title': {
          'type': 'string',
          'description': 'New title for the issue.',
        },
        'teamId': {
          'type': 'string',
          'description': 'UUID of the team to move the issue to. Use this to transfer an issue from one team to another. The team must exist in your workspace and you must have access to it. Use the GET_ALL_LINEAR_TEAMS or LIST_LINEAR_TEAMS action to get valid team IDs.',
        },
        'cycleId': {
          'type': 'string',
          'description': 'UUID of the cycle (sprint) to assign this issue to. Must be a valid UUID in the format \'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx\'. IMPORTANT: Cycles are team-scoped in Linear. The cycle must belong to the same team as the issue, otherwise the API will reject the request with an error.',
        },
        'dueDate': {
          'type': 'string',
          'description': 'New due date in ISO8601 datetime format or YYYY-MM-DD TimelessDate format (e.g., \'2024-12-31\' or \'2024-12-31T23:59:59Z\')',
        },
        'issueId': {
          'type': 'string',
          'description': 'Identifier of the issue to update. Accepts either UUID format (e.g., \'d282c513-3265-4513-9099-abc0123def45\') or issue key format (e.g., \'ENG-123\', \'BLA-456\').',
        },
        'stateId': {
          'type': 'string',
          'description': 'UUID of the workflow state to transition the issue to. Must be a valid UUID in the format \'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx\' (e.g., \'f47ac10b-58cc-4372-a567-0e02b2c3d479\'). Do NOT use state names like \'To Do\', \'In Progress\', or \'Done\'. IMPORTANT: Workflow states are team-scoped in Linear.',
        },
        'estimate': {
          'type': 'integer',
          'description': 'Estimate points for the issue (e.g., 1, 2, 3, 5, 8). Teams may use different estimation types: exponential, fibonacci, linear, or t-shirt sizing.',
        },
        'labelIds': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'List of label identifiers to set; replaces all existing labels. An empty list removes all labels.',
        },
        'parentId': {
          'type': 'string',
          'description': 'UUID of an existing issue to set as this issue\'s parent (making this issue a sub-issue). The parent issue must not create a circular dependency (e.g., the parent cannot be this issue itself or one of its descendants), and you must have access to it.',
        },
        'priority': {
          'type': 'integer',
          'description': 'Priority: 0 (No), 1 (Urgent), 2 (High), 3 (Normal), 4 (Low).',
        },
        'projectId': {
          'type': 'string',
          'description': 'UUID of the project to associate the issue with. Must be a valid UUID in the format \'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx\'. IMPORTANT: Projects are team-scoped in Linear. The project must belong to the same team as the issue, otherwise the API will reject the request with an error.',
        },
        'assigneeId': {
          'type': 'string',
          'description': 'UUID of the user to assign to the issue. Must be a valid user UUID from your Linear workspace (format: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx). Use LIST_LINEAR_USERS to get valid user IDs. Do NOT use placeholder values like \'<DATE_TIME>\' or \'{USER_ID}\'.',
        },
        'description': {
          'type': 'string',
          'description': 'New Markdown description for the issue.',
        },
      },
      'required': ['issueId'],
    },
  ),
  TelegramTool(
    name: 'linear_create_linear_comment',
    label: 'Commenting in Linear',
    category: ToolCategory.linear,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Creates a new comment on a specified Linear issue. This action modifies shared workspace data and is not reversible — confirm the target issue and comment content before executing. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'body': {
          'type': 'string',
          'description': 'Non-empty comment content, in plain text or Markdown. Must not be whitespace-only.',
        },
        'issueId': {
          'type': 'string',
          'description': 'ID of the Linear issue to add the comment to. Must be in one of two formats: (1) UUID format: a 36-character string with hyphens (e.g., \'c5748ccf-c67f-4af4-bd74-fe513dc4c054\'), or (2) Shorthand identifier: team key (alphanumeric, must start with a letter, 1-10 chars) followed by hyphen and issue num…',
        },
      },
      'required': ['body', 'issueId'],
    },
  ),
  TelegramTool(
    name: 'linear_delete_linear_issue',
    label: 'Deleting a Linear issue',
    category: ToolCategory.linear,
    cost: ToolCost.apps,
    requiresApproval: true,
    destructive: true,
    description: 'Archives an existing Linear issue by its ID, which is Linear\'s standard way of deleting issues; the operation is idempotent. Archiving is permanent with no built-in undo — confirm the issue identifier and title with the user before executing, especially in bulk operations. Destructive: only when the user clearly asked for exactly this; it always waits for approval.',
    parameters: {
      'type': 'object',
      'properties': {
        'issue_id': {
          'type': 'string',
          'description': 'ID of the Linear issue to be archived. Must be in one of two formats: (1) UUID format: a 36-character string with hyphens (e.g., \'c5748ccf-c67f-4af4-bd74-fe513dc4c054\'), or (2) Shorthand identifier: team key (alphanumeric, must start with a letter, 1-10 chars) followed by hyphen and issue number (e.…',
        },
      },
      'required': ['issue_id'],
    },
  ),
  TelegramTool(
    name: 'todoist_get_all_tasks',
    label: 'Checking your tasks',
    category: ToolCategory.todoist,
    cost: ToolCost.apps,
    description: 'Fetches all INCOMPLETE tasks from Todoist and returns their details. Supports cursor-based pagination. IMPORTANT LIMITATIONS: - This endpoint only returns active (incomplete) tasks - Cannot retrieve completed tasks - use a different endpoint for that - Filter queries using \'completed\', \'!completed\', or \'completed after\' will fail - Project/label references must use ACTUAL EXISTING names from the user\'s account - Arbitrary text in filters causes 400 errors - use \'search: keyword\' for text search Common use cases: -…',
    parameters: {
      'type': 'object',
      'properties': {
        'ids': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'List of task IDs to retrieve (alphanumeric string IDs).',
        },
        'lang': {
          'type': 'string',
          'description': 'Language code for parsing date/times in queries.',
        },
        'limit': {
          'type': 'integer',
          'description': 'The number of tasks to return per page. Default is 50.',
        },
        'cursor': {
          'type': 'string',
          'description': 'Cursor for pagination. Provide the next_cursor value from previous response to get next page.',
        },
        'filter': {
          'type': 'string',
          'description': 'Filter tasks using Todoist filter syntax. This endpoint only returns INCOMPLETE tasks. Terms must be valid keywords or reference existing entities; arbitrary text causes 400 errors.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'todoist_filter_tasks',
    label: 'Filtering tasks',
    category: ToolCategory.todoist,
    cost: ToolCost.apps,
    description: 'Tool to get all tasks matching the filter. Use when you need to retrieve tasks based on specific filter criteria. This is a paginated endpoint using cursor-based pagination.',
    parameters: {
      'type': 'object',
      'properties': {
        'lang': {
          'type': 'string',
          'description': 'IETF language tag defining what language filter is written in, if differs from default English.',
        },
        'limit': {
          'type': 'integer',
          'description': 'The number of objects to return in a page (1-200). Default is 50.',
        },
        'query': {
          'type': 'string',
          'description': 'Filter tasks using Todoist filter syntax. Terms must be valid keywords or reference existing entities in the user\'s account. Comma operator (,) is NOT supported. **CRITICAL: Multiple filter conditions MUST be joined with explicit logical operators (&, &#124;, !).',
        },
        'cursor': {
          'type': 'string',
          'description': 'Cursor for pagination. Provide the next_cursor value from previous response to get next page.',
        },
      },
      'required': ['query'],
    },
  ),
  TelegramTool(
    name: 'todoist_get_all_projects',
    label: 'Listing Todoist projects',
    category: ToolCategory.todoist,
    cost: ToolCost.apps,
    description: 'Get all projects from a user\'s Todoist account. Retrieves all active (non-archived) projects; use TODOIST_LIST_ARCHIVED_WORKSPACE_PROJECTS for archived ones. Response returns the list in the projects field, with fields including project_id, name, color, parent project, sharing status, and is_inbox_project flag. Always reference projects by project_id — names are non-unique and may be localized. Detect the Inbox via is_inbox_project, not by name.',
    parameters: {
      'type': 'object',
      'properties': {
        'limit': {
          'type': 'integer',
          'description': 'The number of projects to return per page. Defaults to server default if not provided.',
        },
        'cursor': {
          'type': 'string',
          'description': 'Pagination cursor from a previous response. Use the next_cursor value to fetch the next page of results.',
        },
      },
    },
  ),
  TelegramTool(
    name: 'todoist_create_task',
    label: 'Adding a task',
    category: ToolCategory.todoist,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Create a new task in Todoist using the unified API v1. This action allows users to create tasks with various parameters including content, due dates, priority, and more. The task can be created in a specific project, section, or as a subtask of another task. Bulk creation may trigger HTTP 429; honor Retry-After response headers. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'order': {
          'type': 'integer',
          'description': 'Non-zero integer value used to sort tasks under the same parent.',
        },
        'labels': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'The task\'s labels (list of names for personal/shared labels). Labels must already exist in Todoist; referencing non-existent labels may fail silently.',
        },
        'content': {
          'type': 'string',
          'description': 'Task content/title. Can contain markdown-formatted text and hyperlinks. Do NOT include due dates or times in this field - use due_string instead.',
        },
        'due_date': {
          'type': 'string',
          'description': 'Specific date in YYYY-MM-DD format relative to user\'s timezone. Use this for exact dates without time. For natural language dates, use due_string instead. Only one due_* field can be used at a time (except due_lang). Cannot express recurrence; one-off tasks only.',
        },
        'due_lang': {
          'type': 'string',
          'description': '2-letter ISO 639-1 language code for parsing due_string. Required when due_string is in a language other than English. Supported codes: da (Danish), de (German), en (English), es (Spanish), fi (Finnish), fr (French), it (Italian), ja (Japanese), ko (Korean), nb (Norwegian), nl (Dutch), pl (Polish),…',
        },
        'duration': {
          'type': 'integer',
          'description': 'Task duration amount as a positive integer. Must be used together with duration_unit. Use this field for task duration instead of embedding \'for X minutes\' in due_string. Example: for a 15-minute task, set duration=15 and duration_unit=\'minute\'.',
        },
        'priority': {
          'type': 'integer',
          'description': 'Task priority from 1 (normal) to 4 (urgent).',
        },
        'parent_id': {
          'type': 'string',
          'description': 'Parent task ID for creating subtasks. Use IDs from todoist_get_all_tasks or TODOIST_GET_ACTIVE_TASK.',
        },
        'due_string': {
          'type': 'string',
          'description': 'Human-defined due date in arbitrary format. Accepts natural language expressions like \'tomorrow\', \'next Monday at 3pm\', \'in 2 hours\', \'every Friday\'. Also accepts formatted dates like \'Jan 21, 2026\' or ISO dates like \'2026-01-21\'. Value is interpreted using local time.',
        },
        'project_id': {
          'type': 'string',
          'description': 'Project ID where the task will be created. Use IDs from todoist_get_all_projects or TODOIST_CREATE_PROJECT. If not set, task is added to the user\'s Inbox. Project names are not unique; always use numeric IDs.',
        },
        'section_id': {
          'type': 'string',
          'description': 'Section ID to put task into. Use IDs from TODOIST_GET_ALL_SECTIONS.',
        },
        'assignee_id': {
          'type': 'string',
          'description': 'The responsible user ID for shared tasks (numeric format).',
        },
        'description': {
          'type': 'string',
          'description': 'Additional notes or details about the task. Can contain markdown-formatted text and hyperlinks. IMPORTANT: Do NOT include due dates, times, or scheduling information here - use the due_string field for natural language dates (e.g., \'tomorrow at 2pm\') or due_date/due_datetime for specific dates.',
        },
        'due_datetime': {
          'type': 'string',
          'description': 'Specific date and time in RFC3339 format in UTC. Use this for exact date and time. Only one due_* field can be used at a time (except due_lang). Cannot express recurrence; one-off tasks only. Use due_string for recurring schedules.',
        },
      },
      'required': ['content'],
    },
  ),
  TelegramTool(
    name: 'todoist_update_task',
    label: 'Updating a task',
    category: ToolCategory.todoist,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'Tool to update an existing task\'s properties. Cannot change a task\'s project; to move a task, use todoist_create_task then todoist_delete_task. Use when you need to modify a task\'s details after confirming its ID and new values. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'labels': {
          'type': 'array',
          'items': {
            'type': 'string',
          },
          'description': 'List of label names to assign to the task. Replaces the entire existing labels list — omit a label only if intentionally removing it. Labels must already exist in Todoist; non-existent names fail silently.',
        },
        'content': {
          'type': 'string',
          'description': 'New content for the task.',
        },
        'task_id': {
          'type': 'string',
          'description': 'The ID of the task to update.',
        },
        'due_date': {
          'type': 'string',
          'description': 'Due date in YYYY-MM-DD format.',
        },
        'due_lang': {
          'type': 'string',
          'description': 'Language code for parsing `due_string`, e.g., \'en\'.',
        },
        'duration': {
          'type': 'integer',
          'description': 'Positive integer for task duration amount (how long the task takes). Must be used together with duration_unit. This is separate from due date - use due_string/due_date/due_datetime for when the task is due.',
        },
        'priority': {
          'type': 'integer',
          'description': 'Task priority from 1 (normal) to 4 (urgent).',
        },
        'due_string': {
          'type': 'string',
          'description': 'Human-readable due date string for natural language date parsing. Examples: \'tomorrow\', \'next Monday\', \'Jan 15 at 3pm\', \'in 2 days\'. Duration syntax like \'for X minutes\' is automatically extracted and converted to the duration/duration_unit fields.',
        },
        'assignee_id': {
          'type': 'string',
          'description': 'User ID to assign the task to.',
        },
        'description': {
          'type': 'string',
          'description': 'New description for the task.',
        },
        'due_datetime': {
          'type': 'string',
          'description': 'Due date and time in RFC3339 format.',
        },
        'deadline_date': {
          'type': 'string',
          'description': 'Deadline date in YYYY-MM-DD format (premium feature).',
        },
      },
      'required': ['task_id'],
    },
  ),
  TelegramTool(
    name: 'todoist_close_task',
    label: 'Completing a task',
    category: ToolCategory.todoist,
    cost: ToolCost.apps,
    requiresApproval: true,
    description: 'DEPRECATED: Use TODOIST_CLOSE_TASK_V1 instead. This tool marks an existing task as completed in Todoist. It requires the `task_id` of the task to be closed. Closing an already-completed task returns an error; check task state first if idempotent behavior is needed. Changes something in the user\'s account: only when they asked; they approve first.',
    parameters: {
      'type': 'object',
      'properties': {
        'task_id': {
          'type': 'string',
          'description': 'The ID of the task to close (alphanumeric format from unified API v1). Verify the ID belongs to the intended task before calling, as completing the wrong task cannot be undone easily; use todoist_get_all_tasks or TODOIST_GET_TASK to confirm identity.',
        },
      },
      'required': ['task_id'],
    },
  ),
  TelegramTool(
    name: 'todoist_delete_task',
    label: 'Deleting a task',
    category: ToolCategory.todoist,
    cost: ToolCost.apps,
    requiresApproval: true,
    destructive: true,
    description: 'Tool to delete a specific task from Todoist. Permanently removes the task and all its subtasks with no recycle bin or undo option. Confirm with the user before executing, especially for bulk deletions. Destructive: only when the user clearly asked for exactly this; it always waits for approval.',
    parameters: {
      'type': 'object',
      'properties': {
        'task_id': {
          'type': 'string',
          'description': 'The ID of the task to delete. Todoist supports both numeric IDs (e.g., \'2995104339\') and alphanumeric IDs (e.g., \'6X4Vw2Hfmg73Q2XR\').',
        },
      },
      'required': ['task_id'],
    },
  ),
];
