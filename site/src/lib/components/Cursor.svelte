<script lang="ts">
	import { onMount } from 'svelte';

	// A small triangle that trails a mouse pointer, points the way it's moving,
	// and opens up over anything clickable. Mouse only; the real cursor stays.
	let element: HTMLDivElement;

	onMount(() => {
		const usable =
			window.matchMedia('(pointer: fine)').matches &&
			!window.matchMedia('(prefers-reduced-motion: reduce)').matches;
		if (!usable) return;

		let x = 0;
		let y = 0;
		let shownX = 0;
		let shownY = 0;
		let angle = 0;
		let scale = 1;
		let wanted = 1;
		let frame = 0;
		let started = false;

		function tick() {
			const dx = x - shownX;
			const dy = y - shownY;
			shownX += dx * 0.22;
			shownY += dy * 0.22;
			if (Math.hypot(dx, dy) > 3) {
				const next = (Math.atan2(dy, dx) * 180) / Math.PI + 90;
				const turn = ((next - angle + 540) % 360) - 180;
				angle += turn * 0.14;
			}
			scale += (wanted - scale) * 0.2;
			element.style.transform = `translate3d(${shownX}px, ${shownY}px, 0) rotate(${angle}deg) scale(${scale})`;
			frame = requestAnimationFrame(tick);
		}
		function move(event: PointerEvent) {
			if (event.pointerType !== 'mouse') return;
			x = event.clientX;
			y = event.clientY;
			if (!started) {
				started = true;
				shownX = x;
				shownY = y;
				element.classList.add('on');
				frame = requestAnimationFrame(tick);
			}
			const over = (event.target as Element)?.closest?.('a, button, summary, [role="tab"]');
			wanted = over ? 2.6 : 1;
		}
		const down = () => (wanted = 0.6);
		const up = () => (wanted = 1);
		const out = () => element.classList.remove('on');
		const back = () => started && element.classList.add('on');

		window.addEventListener('pointermove', move, { passive: true });
		window.addEventListener('pointerdown', down);
		window.addEventListener('pointerup', up);
		document.documentElement.addEventListener('mouseleave', out);
		document.documentElement.addEventListener('mouseenter', back);
		return () => {
			cancelAnimationFrame(frame);
			window.removeEventListener('pointermove', move);
			window.removeEventListener('pointerdown', down);
			window.removeEventListener('pointerup', up);
			document.documentElement.removeEventListener('mouseleave', out);
			document.documentElement.removeEventListener('mouseenter', back);
		};
	});
</script>

<div bind:this={element} class="cursor" aria-hidden="true">
	<svg viewBox="0 0 20 20" width="20" height="20"><path d="M10 2 18 17H2Z" fill="#fff" /></svg>
</div>
