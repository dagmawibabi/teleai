<script lang="ts">
	let { name, size = 24 }: { name: string; size?: number } = $props();
</script>

<svg width={size} height={size} viewBox="0 0 32 32" fill="none" aria-hidden="true">
	{#if name === 'Telegram'}
		<circle cx="16" cy="16" r="15" fill="#279AD0" /><path
			d="m7 15 18-7-4 18-7-6-4 3 1-7 11-6-13 8-2-3Z"
			fill="white"
		/>
	{:else if name === 'Gmail'}
		<path d="M4 24V9l12 9L28 9v15" stroke="#4285F4" stroke-width="5" stroke-linejoin="round" /><path
			d="m4 9 12 9L28 9"
			stroke="#EA4335"
			stroke-width="5"
			stroke-linecap="round"
		/><path d="M4 15v9" stroke="#34A853" stroke-width="5" /><path
			d="M28 15v9"
			stroke="#FBBC04"
			stroke-width="5"
		/>
	{:else if name === 'Slack'}
		<path d="M12 3v12M3 12h4" stroke="#36C5F0" stroke-width="6" stroke-linecap="round" /><path
			d="M29 12H17m3-9v4"
			stroke="#2EB67D"
			stroke-width="6"
			stroke-linecap="round"
		/><path d="M20 29V17m9 3h-4" stroke="#ECB22E" stroke-width="6" stroke-linecap="round" /><path
			d="M3 20h12m-3 9v-4"
			stroke="#E01E5A"
			stroke-width="6"
			stroke-linecap="round"
		/>
	{:else if name === 'Notion'}
		<rect x="3" y="3" width="26" height="26" rx="5" fill="#F5F5F5" /><path
			d="M8 24V8h4l8 12V8h4v16h-4L12 12v12H8Z"
			fill="#141414"
		/>
	{:else if name === 'GitHub'}
		<path
			fill="currentColor"
			d="M16 2a14 14 0 0 0-4.4 27.3v-3.7c-3.4.7-4.1-1.4-4.1-1.4-.5-1.4-1.4-1.8-1.4-1.8-1.1-.8.1-.8.1-.8 1.2.1 1.8 1.2 1.8 1.2 1.1 1.8 2.9 1.3 3.6 1 .1-.8.4-1.4.8-1.8-2.7-.3-5.6-1.4-5.6-6.2 0-1.4.5-2.5 1.3-3.4-.1-.3-.6-1.6.1-3.4 0 0 1.1-.3 3.5 1.3a12 12 0 0 1 6.4 0c2.4-1.6 3.5-1.3 3.5-1.3.7 1.8.2 3.1.1 3.4.8.9 1.3 2 1.3 3.4 0 4.8-2.9 5.9-5.6 6.2.4.4.8 1.2.8 2.3v5A14 14 0 0 0 16 2Z"
		/>
	{:else if name === 'Drive'}
		<path d="m11 3 10 17H11L1 20 11 3Z" fill="#0F9D58" /><path
			d="m11 3 10 17h10L21 3H11Z"
			fill="#FBBC04"
		/><path d="M1 20h30l-5 9H6L1 20Z" fill="#4285F4" />
	{:else if name === 'Calendar'}
		<rect x="3" y="3" width="26" height="26" rx="5" fill="#4285F4" /><path
			d="M9 9h14v14H9z"
			fill="white"
		/><path d="M11 14h10m-5-3v10" stroke="#4285F4" stroke-width="2" /><path
			d="m22 29 7-7h-7v7Z"
			fill="#34A853"
		/><path d="M3 22h7v7H3z" fill="#FBBC04" />
	{:else if name === 'Linear'}
		<circle cx="16" cy="16" r="14" fill="#8C8DFF" /><path
			d="m3 17 12 12M6 10l16 16M11 5l16 16"
			stroke="#11131A"
			stroke-width="2.5"
		/>
	{:else if name === 'Todoist'}
		<rect x="2" y="2" width="28" height="28" rx="7" fill="#E85C4A" /><path
			d="m7 11 5 3 13-7M7 17l5 3 13-7M7 23l5 3 13-7"
			stroke="white"
			stroke-width="2"
		/>
	{:else if name === 'Outlook'}
		<rect x="12" y="5" width="17" height="22" rx="2" fill="#28A8EA" /><path
			d="m12 15 8 6 9-6"
			stroke="white"
			stroke-width="1.5"
		/><path d="m2 6 17-3v26L2 26V6Z" fill="#0078D4" /><ellipse
			cx="10"
			cy="16"
			rx="4"
			ry="6"
			stroke="white"
			stroke-width="2"
		/>
	{:else if name === 'Cloudflare'}
		<path d="M3 24a6 6 0 0 1 2-11 10 10 0 0 1 19 3 5 5 0 0 1 6 8H3Z" fill="#F48120" /><path
			d="M5 24h21"
			stroke="#FFC989"
			stroke-width="3"
		/>
	{/if}
</svg>
