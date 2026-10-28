<script lang="ts">
	let {
		name,
		size = 20,
		class: className = '',
		stroke = 1.7
	}: { name: string; size?: number; class?: string; stroke?: number } = $props();
	const paths: Record<string, string> = {
		arrow: 'M4 12h16m-6-6 6 6-6 6',
		down: 'M12 4v16m-6-6 6 6 6-6',
		upright: 'M6 18 18 6M6 6h12v12',
		chevron: 'm9 5 7 7-7 7',
		chevrondown: 'm6 9 6 6 6-6',
		download: 'M12 3v12m-5-5 5 5 5-5M4 16v4a1 1 0 0 0 1 1h14a1 1 0 0 0 1-1v-4',
		check: 'm5 12 4 4L19 6',
		plus: 'M12 5v14M5 12h14',
		close: 'm6 6 12 12M6 18 18 6',
		menu: 'M4 7h16M4 12h16M4 17h16',
		message: 'M21 11.5a8.5 8.5 0 0 1-8.5 8.5H4l-2 2v-10A9.5 9.5 0 1 1 21 11.5ZM7 9h9M7 13h6',
		sparkles: 'm12 3 2.5 6.5L21 12l-6.5 2.5L12 21l-2.5-6.5L3 12l6.5-2.5L12 3ZM20 2v4m-2-2h4',
		eye: 'M2 12s3.6-7 10-7 10 7 10 7-3.6 7-10 7S2 12 2 12Zm13 0a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z',
		code: 'm8 6-6 6 6 6m8-12 6 6-6 6M14 3l-4 18',
		search: 'M21 21l-5-5m2-6a8 8 0 1 1-16 0 8 8 0 0 1 16 0Z',
		folder: 'M3 6a2 2 0 0 1 2-2h5l2 3h7a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V6Z',
		mic: 'M9 5a3 3 0 0 1 6 0v7a3 3 0 0 1-6 0V5ZM5 10v2a7 7 0 0 0 14 0v-2M12 19v3M8 22h8',
		shield: 'm12 2 9 4v6c0 5-9 10-9 10S3 17 3 12V6l9-4Zm-4 10 3 3 5-6',
		lock: 'M6 10V7a6 6 0 0 1 12 0v3M5 10h14v11H5V10Zm7 5v2',
		key: 'm10 14 9-9m-3 3 3 3m-1-5 3 3M11 17a4 4 0 1 1-8 0 4 4 0 0 1 8 0Z',
		phone: 'M7 2h10a2 2 0 0 1 2 2v16a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2Zm3 16h4M10 5h4',
		sliders: 'M5 3v7m0 4v7m7-18v12m0 4v2m7-18v2m0 4v12M2 10h6m1 5h6m1-10h6',
		globe:
			'M22 12a10 10 0 1 1-20 0 10 10 0 0 1 20 0ZM2 12h20M12 2a18 18 0 0 1 0 20 18 18 0 0 1 0-20Z',
		cloud: 'M6 19a5 5 0 0 1-1-9 7 7 0 0 1 13-2 5.5 5.5 0 0 1 0 11H6Z',
		calendar:
			'M7 2v4m10-4v4M3 10h18M5 4h14a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2Zm2 10h3m4 0h3m-10 4h3',
		mail: 'M3 5h18v14H3V5Zm0 1 9 7 9-7',
		bell: 'M18 8a6 6 0 0 0-12 0c0 7-3 7-3 9h18c0-2-3-2-3-9ZM9 21h6',
		copy: 'M8 8h13v13H8V8ZM16 4V2H2v14h2',
		send: 'm22 2-7 20-4-9-9-4 20-7ZM22 2 11 13',
		refresh: 'M20 7a9 9 0 1 0 1 9M20 2v6h-6',
		terminal: 'm5 7 5 5-5 5m8 0h6M2 3h20v18H2V3Z',
		image: 'M3 3h18v18H3V3Zm0 13 6-6 7 11m-3-5 3-3 5 5M17 7h.01',
		book: 'M12 4v17M2 3c4-1 7 0 10 2 3-2 6-3 10-2v16c-4-1-7 0-10 2-3-2-6-3-10-2V3Z',
		sun: 'M12 2v2m0 16v2M2 12h2m16 0h2M5 5l1 1m12 12 1 1M5 19l1-1M18 6l1-1M17 12a5 5 0 1 1-10 0 5 5 0 0 1 10 0Z',
		android:
			'M5 9h14v10H5V9Zm0 0a7 7 0 0 1 14 0M8 3 6 1m10 2 2-2M2 10v7m20-7v7M8 19v3m8-3v3M9 6h.01M15 6h.01'
	};
</script>

<svg
	width={size}
	height={size}
	viewBox="0 0 24 24"
	fill="none"
	stroke="currentColor"
	stroke-width={stroke}
	stroke-linecap="round"
	stroke-linejoin="round"
	class={className}
	aria-hidden="true"><path d={paths[name] ?? paths.sparkles} /></svg
>
