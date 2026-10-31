<script lang="ts">
	// The site's only pointer glyph: the logo's triangle, solid.
	let { size = 10, turn = 90, class: className = '' }: { size?: number; turn?: number; class?: string } =
		$props();
</script>

<svg
	class={`tri ${className}`}
	width={size}
	height={size}
	viewBox="0 0 20 20"
	style={`--turn: ${turn}deg`}
	aria-hidden="true"><path d="M10 2 19 18H1Z" fill="currentColor" /></svg
>
