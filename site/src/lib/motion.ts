/** Reveals [data-reveal] elements as they scroll in. Returns a cleanup. */
export function setupReveals() {
	if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) return () => {};
	const observer = new IntersectionObserver(
		(entries) => {
			for (const entry of entries) {
				if (entry.isIntersecting) {
					entry.target.classList.add('is-visible');
					observer.unobserve(entry.target);
				}
			}
		},
		{ threshold: 0.14, rootMargin: '0px 0px -30px 0px' }
	);
	document.documentElement.classList.add('motion-ready');
	document.querySelectorAll('[data-reveal]').forEach((element) => observer.observe(element));
	return () => {
		observer.disconnect();
		document.documentElement.classList.remove('motion-ready');
	};
}
