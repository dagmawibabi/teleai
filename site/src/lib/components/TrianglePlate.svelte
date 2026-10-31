<script lang="ts">
	import { onMount } from 'svelte';

	// A perforated steel plate: a lattice of tiny triangles that forms the hollow
	// logo at full scale. It ripples as if listening, parts around the pointer,
	// rings when clicked, and comes apart as the page scrolls.
	let canvas: HTMLCanvasElement;

	type Glyph = { x: number; y: number; base: number; shade: number; delay: number; seed: number };
	type Ring = { x: number; y: number; start: number };

	const levels = 8;
	const smooth = (a: number, b: number, v: number) => {
		const t = Math.min(1, Math.max(0, (v - a) / (b - a)));
		return t * t * (3 - 2 * t);
	};

	onMount(() => {
		const context = canvas.getContext('2d');
		if (!context) return;
		const ctx = context;
		const still = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
		const host = canvas.parentElement!;
		let glyphs: Glyph[] = [];
		let cell = 26;
		let width = 0;
		let height = 0;
		let frame = 0;
		let visible = true;
		const rings: Ring[] = [];
		const target = { x: -9999, y: -9999 };
		const pointer = { x: -9999, y: -9999 };
		const started = performance.now();

		function build() {
			const box = host.getBoundingClientRect();
			width = box.width;
			height = box.height;
			const dpr = Math.min(window.devicePixelRatio || 1, 2);
			canvas.width = Math.round(width * dpr);
			canvas.height = Math.round(height * dpr);
			ctx.setTransform(dpr, 0, 0, dpr, 0, 0);

			const narrow = width < 860;
			cell = narrow ? 17 : 24;
			const tall = narrow ? Math.min(height * 0.46, width * 0.92) : Math.min(height * 0.86, width * 0.56);
			const side = (tall * 2) / Math.sqrt(3);
			const cx = narrow ? width / 2 : width * 0.71;
			const top = narrow ? height * 0.09 : (height - tall) / 2 + 26;
			const corners = [
				{ x: cx, y: top },
				{ x: cx + side / 2, y: top + tall },
				{ x: cx - side / 2, y: top + tall }
			];
			const band = tall * 0.2;
			const rowHeight = (cell * Math.sqrt(3)) / 2;

			// The plate is cut away around the words, so they stay readable.
			const origin = host.getBoundingClientRect();
			const cutouts = [...host.querySelectorAll('h1 .line, .hero-text, .hero-actions a')].map((line) => {
				const words = document.createRange();
				words.selectNodeContents(line);
				const lineBox = line.getBoundingClientRect();
				return {
					left: words.getBoundingClientRect().left - origin.left - cell,
					right: words.getBoundingClientRect().right - origin.left + cell,
					top: lineBox.top - origin.top - cell * 0.5,
					bottom: lineBox.bottom - origin.top + cell * 0.25
				};
			});

			glyphs = [];
			for (let row = 0; row * rowHeight < height + cell; row++) {
				const y = row * rowHeight;
				for (let x = row % 2 ? cell / 2 : 0; x < width + cell; x += cell) {
					// Distance inside the big triangle; negative means outside.
					let inside = Infinity;
					for (let i = 0; i < 3; i++) {
						const a = corners[i];
						const b = corners[(i + 1) % 3];
						const length = Math.hypot(b.x - a.x, b.y - a.y);
						const d = ((b.x - a.x) * (y - a.y) - (b.y - a.y) * (x - a.x)) / length;
						inside = Math.min(inside, d);
					}
					let onBand = smooth(-cell * 0.4, cell * 0.6, inside) * (1 - smooth(band - cell, band, inside));
					for (const cut of cutouts) {
						const away = Math.max(cut.left - x, x - cut.right, cut.top - y, y - cut.bottom);
						onBand *= smooth(0, cell * 1.4, away);
					}
					const lit = top + tall > y ? 0.62 + (0.38 * (y - top)) / tall : 0.62;
					glyphs.push({
						x,
						y,
						base: 0.09 + onBand * 0.82,
						shade: 0.16 + onBand * Math.min(1, lit) * 0.84,
						delay: Math.hypot(x - cx, y - top) / Math.max(width, height),
						seed: Math.abs(Math.sin(x * 12.9898 + y * 78.233) * 43758.5453) % 1
					});
				}
			}
		}

		function draw(now: number) {
			const t = (now - started) / 1000;
			const scroll = still ? 0 : Math.min(1, window.scrollY / Math.max(1, height));
			pointer.x += (target.x - pointer.x) * 0.14;
			pointer.y += (target.y - pointer.y) * 0.14;
			while (rings.length && t - rings[0].start > 1.6) rings.shift();

			const paths = Array.from({ length: levels }, () => new Path2D());
			const reach = cell * 7.5;
			for (const g of glyphs) {
				const appear = still ? 1 : smooth(0, 0.7, t * 0.9 - g.delay * 0.9);
				if (appear <= 0) continue;
				let size = g.base * (0.86 + (still ? 0 : 0.14) * Math.sin(t * 1.15 - g.y * 0.011 - g.x * 0.005));
				let shade = g.shade;
				let spin = 0;
				let x = g.x;
				let y = g.y;

				// The pointer parts the plate and turns each triangle to face it.
				const dx = x - pointer.x;
				const dy = y - pointer.y;
				const near = 1 - Math.min(1, Math.hypot(dx, dy) / reach);
				if (near > 0) {
					const pull = near * near;
					const angle = Math.atan2(dy, dx);
					spin = pull * (angle + Math.PI / 2);
					x += Math.cos(angle) * pull * cell * 1.1;
					y += Math.sin(angle) * pull * cell * 1.1;
					size = size * (1 - pull) + pull * (g.base > 0.5 ? 0.3 : 0.75);
					shade = Math.max(shade, pull * 0.9);
				}

				for (const ring of rings) {
					const age = t - ring.start;
					const gap = Math.abs(Math.hypot(g.x - ring.x, g.y - ring.y) - age * 620);
					if (gap < 70) {
						const hit = (1 - gap / 70) * (1 - age / 1.6);
						size += hit * 0.7;
						shade = Math.min(1, shade + hit);
						spin += hit * 2;
					}
				}

				if (scroll > 0) {
					x += (g.seed - 0.5) * scroll * scroll * 240;
					y += g.seed * scroll * scroll * 300;
					spin += (g.seed - 0.5) * scroll * 5;
					size *= 1 - scroll * 0.55;
				}

				const r = cell * 0.56 * size * appear;
				if (r < 0.35) continue;
				const path = paths[Math.min(levels - 1, Math.floor(shade * levels))];
				const a = spin - Math.PI / 2;
				const third = (Math.PI * 2) / 3;
				path.moveTo(x + Math.cos(a) * r, y + Math.sin(a) * r);
				path.lineTo(x + Math.cos(a + third) * r, y + Math.sin(a + third) * r);
				path.lineTo(x + Math.cos(a + third * 2) * r, y + Math.sin(a + third * 2) * r);
				path.closePath();
			}

			ctx.clearRect(0, 0, width, height);
			paths.forEach((path, level) => {
				const grey = Math.round(40 + (215 * (level + 1)) / levels);
				ctx.fillStyle = `rgb(${grey} ${grey} ${grey})`;
				ctx.fill(path);
			});
		}

		function loop(now: number) {
			frame = 0;
			if (visible && !document.hidden) draw(now);
			frame = requestAnimationFrame(loop);
		}

		function move(event: PointerEvent) {
			const box = canvas.getBoundingClientRect();
			target.x = event.clientX - box.left;
			target.y = event.clientY - box.top;
			if (pointer.x < -999) {
				pointer.x = target.x;
				pointer.y = target.y;
			}
		}
		function leave() {
			target.x = target.y = pointer.x = pointer.y = -9999;
		}
		function press(event: PointerEvent) {
			const box = canvas.getBoundingClientRect();
			rings.push({
				x: event.clientX - box.left,
				y: event.clientY - box.top,
				start: (performance.now() - started) / 1000
			});
		}

		let resizeTimer = 0;
		const sized = new ResizeObserver(() => {
			clearTimeout(resizeTimer);
			resizeTimer = window.setTimeout(() => {
				build();
				if (still) draw(performance.now());
			}, 80);
		});
		const seen = new IntersectionObserver(([entry]) => (visible = entry.isIntersecting));

		build();
		sized.observe(host);
		// The headline's width changes once its font arrives.
		document.fonts?.ready.then(() => {
			build();
			if (still) draw(performance.now());
		});
		if (still) {
			draw(performance.now());
		} else {
			seen.observe(host);
			host.addEventListener('pointermove', move);
			host.addEventListener('pointerleave', leave);
			host.addEventListener('pointerdown', press);
			frame = requestAnimationFrame(loop);
		}

		return () => {
			cancelAnimationFrame(frame);
			clearTimeout(resizeTimer);
			sized.disconnect();
			seen.disconnect();
			host.removeEventListener('pointermove', move);
			host.removeEventListener('pointerleave', leave);
			host.removeEventListener('pointerdown', press);
		};
	});
</script>

<canvas bind:this={canvas} class="plate" aria-hidden="true"></canvas>
