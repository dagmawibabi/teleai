<script lang="ts">
	import { onMount } from 'svelte';
	import Tri from '#lib/components/Tri.svelte';

	const github = 'https://github.com/dagmawibabi/triangle';
	const links = [
		{ href: '/#features', label: 'What it does' },
		{ href: '/tools', label: 'All tools' },
		{ href: '/#companion', label: 'PC companion' },
		{ href: '/#control', label: 'Control' }
	];

	let scrollY = $state(0);
	let innerHeight = $state(1);
	let pageHeight = $state(1);
	let menuOpen = $state(false);
	let hidden = $state(false);
	const progress = $derived(Math.min(1, scrollY / Math.max(1, pageHeight - innerHeight)));

	onMount(() => {
		const sized = new ResizeObserver(() => {
			pageHeight = document.documentElement.scrollHeight;
		});
		sized.observe(document.body);
		let last = window.scrollY;
		function scrolled() {
			const now = window.scrollY;
			if (Math.abs(now - last) > 6) {
				hidden = now > last && now > 500;
				last = now;
			}
		}
		window.addEventListener('scroll', scrolled, { passive: true });

		// Buttons lean toward the mouse, a little.
		const still = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
		function lean(event: PointerEvent) {
			if (event.pointerType !== 'mouse' || still) return;
			const button = (event.target as Element)?.closest?.('[data-magnetic]') as HTMLElement | null;
			if (!button) return;
			const box = button.getBoundingClientRect();
			button.style.setProperty('--lean-x', `${(event.clientX - box.left - box.width / 2) * 0.16}px`);
			button.style.setProperty('--lean-y', `${(event.clientY - box.top - box.height / 2) * 0.28}px`);
		}
		function straighten(event: PointerEvent) {
			const button = event.target as HTMLElement;
			if (button?.matches?.('[data-magnetic]')) {
				button.style.setProperty('--lean-x', '0px');
				button.style.setProperty('--lean-y', '0px');
			}
		}
		document.addEventListener('pointermove', lean, { passive: true });
		document.addEventListener('pointerout', straighten, { passive: true });
		return () => {
			sized.disconnect();
			window.removeEventListener('scroll', scrolled);
			document.removeEventListener('pointermove', lean);
			document.removeEventListener('pointerout', straighten);
		};
	});
</script>

<svelte:window bind:scrollY bind:innerHeight />

<header class:hidden-up={hidden && !menuOpen} class:solid={scrollY > 40 || menuOpen}>
	<a class="brand" href="/" aria-label="Triangle home" onclick={() => (menuOpen = false)}>
		<svg class="brand-mark" viewBox="0 0 40 40" width="26" height="26" fill="none" aria-hidden="true">
			<path class="brand-faint" d="M20 5 37 34H3Z" />
			<path class="brand-line" d="M20 5 37 34H3Z" pathLength="1" style={`stroke-dashoffset: ${1 - progress}`} />
		</svg>
		<span>triangle</span>
	</a>
	<nav aria-label="Main navigation" class="nav-links">
		{#each links as link}<a href={link.href}><span>{link.label}</span></a>{/each}
		<a href={github} target="_blank" rel="noreferrer"><span>GitHub</span></a>
	</nav>
	<a class="button small" data-magnetic href="/#download"><span>Download</span><Tri size={8} /></a>
	<button
		class="menu-toggle"
		type="button"
		aria-label={menuOpen ? 'Close menu' : 'Open menu'}
		aria-expanded={menuOpen}
		onclick={() => (menuOpen = !menuOpen)}
	>
		<i class:open={menuOpen}></i><i class:open={menuOpen}></i>
	</button>
</header>
<div class="menu-sheet" class:open={menuOpen} inert={!menuOpen}>
	<nav aria-label="Menu">
		{#each links as link}<a href={link.href} onclick={() => (menuOpen = false)}>{link.label}</a>{/each}
		<a href="/#download" onclick={() => (menuOpen = false)}>Download</a>
		<a href={github} target="_blank" rel="noreferrer">GitHub</a>
	</nav>
</div>
