<script lang="ts">
	let { size = 30, class: className = '' }: { size?: number; class?: string } = $props();
</script>

<svg width={size} height={size} viewBox="0 0 40 40" fill="none" class={className} aria-hidden="true"
	><path
		d="M20 5 37 34H3L20 5Z"
		stroke="currentColor"
		stroke-width="3.6"
		stroke-linejoin="miter"
	/></svg
>
