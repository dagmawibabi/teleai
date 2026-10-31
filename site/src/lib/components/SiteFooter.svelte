<script lang="ts">
	import Logo from '#lib/components/Logo.svelte';

	const github = 'https://github.com/dagmawibabi/triangle';
</script>

<footer>
	<a class="brand" href="/" aria-label="Triangle home"><Logo size={22} /><span>triangle</span></a>
	<span>Made by <a class="link quiet" href="https://github.com/dagmawibabi" target="_blank" rel="noreferrer"><span>Dagmawi Babi</span></a></span>
	<nav aria-label="Footer">
		<a class="link quiet" href="/tools"><span>All tools</span></a>
		<a class="link quiet" href={github} target="_blank" rel="noreferrer"><span>GitHub</span></a>
		<a class="link quiet" href={github + '/releases'} target="_blank" rel="noreferrer"><span>Releases</span></a>
		<a class="link quiet" href={github + '/issues'} target="_blank" rel="noreferrer"><span>Issues</span></a>
	</nav>
</footer>
