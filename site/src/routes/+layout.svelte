<script lang="ts">
	import './layout.css';
	import type { LayoutProps } from './$types';
	import Cursor from '#lib/components/Cursor.svelte';
	import SiteFooter from '#lib/components/SiteFooter.svelte';
	import SiteHeader from '#lib/components/SiteHeader.svelte';

	let { children }: LayoutProps = $props();
</script>

<svelte:head>
	<link rel="icon" href="/favicon.svg" type="image/svg+xml" />
	<meta name="theme-color" content="#000000" />
	<link
		rel="preload"
		href="/fonts/sora-latin.woff2"
		as="font"
		type="font/woff2"
		crossorigin="anonymous"
	/>
</svelte:head>

<a class="skip-link" href="#main">Skip to content</a>
<Cursor />
<SiteHeader />

{@render children()}

<SiteFooter />
