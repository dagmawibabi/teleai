<script lang="ts">
	let { screen, alt, eager = false }: { screen: string; alt: string; eager?: boolean } = $props();
</script>

<div class="phone-frame">
	<div class="phone-side phone-side-left"></div>
	<div class="phone-side phone-side-right"></div>
	<img
		src={`/screenshots/${screen}.png`}
		{alt}
		width="780"
		height="1640"
		loading={eager ? 'eager' : 'lazy'}
		decoding="async"
	/>
</div>
