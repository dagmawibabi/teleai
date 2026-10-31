<script lang="ts">
	import { onMount } from 'svelte';
	import BrandIcon from '#lib/components/BrandIcon.svelte';
	import Cursor from '#lib/components/Cursor.svelte';
	import Logo from '#lib/components/Logo.svelte';
	import Phone from '#lib/components/Phone.svelte';
	import Tri from '#lib/components/Tri.svelte';
	import TrianglePlate from '#lib/components/TrianglePlate.svelte';

	const github = 'https://github.com/dagmawibabi/triangle';
	const releases = `${github}/releases`;

	const apps = ['Telegram', 'Gmail', 'Calendar', 'Slack', 'Notion', 'Drive', 'GitHub', 'Linear', 'Todoist'];

	const tabs = [
		{
			name: 'Ask anything',
			title: 'It reads everything you connected.',
			text: 'Ask one question across your chats, inbox, calendar and files, and get an answer with its sources.',
			prompt: 'What needs my attention before the launch?',
			tools: ['Searching your Telegram chats', 'Checking your calendar'],
			answer: 'Three things.',
			details: [
				'Alex is waiting for your go-ahead in the launch group.',
				'The design review is at 11:00. The files are in Drive.',
				'Your afternoon is clear.'
			]
		},
		{
			name: 'Make something',
			title: 'Images, audio and music from a sentence.',
			text: 'Everything you make is saved in Files, ready to send to a chat or open somewhere else.',
			prompt: 'Make a quiet ambient soundtrack for a focus session.',
			tools: ['Choosing an audio model', 'Generating a looping track'],
			answer: 'Your track is ready.',
			details: [
				'Soft rain and warm textures, with no sudden changes.',
				'It’s saved in Files.',
				'Want it sent to Telegram?'
			]
		},
		{
			name: 'Keep watch',
			title: 'It tells you when something happens.',
			text: 'Set a watch on a person or a group, schedule a routine, or wake up to a brief of what you missed.',
			prompt: 'Tell me when the final designs land in the launch group.',
			tools: ['Creating a watch', 'Following the launch group'],
			answer: 'Watching.',
			details: [
				'When the designs arrive, you’ll get a summary and the original message.',
				'You can pause or change this watch anytime.'
			]
		},
		{
			name: 'Use your PC',
			title: 'Your computer, from your phone.',
			text: 'Run Triangle Companion on Windows. The assistant can find files, click, type and run commands, or you can watch the screen live and take over by touch.',
			prompt: 'Find last month’s invoice on my PC and send it to me.',
			tools: ['Searching your shared folders', 'Copying the file to your phone'],
			answer: 'It’s on your phone.',
			details: [
				'It was in Documents, under Invoices.',
				'The PDF is saved in Files.',
				'Only the folders you shared were searched.'
			]
		},
		{
			name: 'Run code',
			title: 'Python, charts and your cloud.',
			text: 'Run code in a sandbox, make charts, manage Cloudflare, and add more tools with MCP servers and skills.',
			prompt: 'Turn this CSV into a chart and save the result.',
			tools: ['Opening an E2B sandbox', 'Running Python'],
			answer: 'Your chart is ready.',
			details: [
				'The data is cleaned and grouped by month.',
				'The chart and the script are saved as files.',
				'Open them in the built-in editor to change anything.'
			]
		}
	];

	const shots = [
		{
			screen: 'assistant',
			title: 'Catch up in one message.',
			text: 'Your messages, email and calendar, answered in one place.',
			alt: 'Triangle assistant catching up on messages, email and calendar. Fictional sample conversation.'
		},
		{
			screen: 'watches',
			title: 'Hear about it when it happens.',
			text: 'A watch brings you the update and the message it came from.',
			alt: 'Triangle watch update summarizing a team’s launch progress. Fictional sample conversation.'
		},
		{
			screen: 'brief',
			title: 'Start the day with a brief.',
			text: 'Everything that happened overnight, with what needs you first.',
			alt: 'Triangle morning brief listing the day’s priorities. Fictional sample content.'
		}
	];

	const principles = [
		{
			title: 'You approve it first',
			text: 'Sends and changes wait for your OK, and you can edit them before they go.'
		},
		{
			title: 'Your keys stay on your phone',
			text: 'Bring your own AI provider and pick your own models.'
		},
		{
			title: 'You set the limits',
			text: 'Turn tools on one at a time, or switch everything to read-only.'
		}
	];

	const questions = [
		{
			question: 'What is Triangle?',
			answer:
				'An AI workspace for Android that connects your conversations, apps and everyday tools. It includes a full Telegram client, an assistant that works across connected services, creative tools, briefs and watches.'
		},
		{
			question: 'Is it free?',
			answer:
				'You can download Triangle from GitHub. You bring your own AI provider key, and that provider bills you for what you use. Optional services such as web search, connected apps, voice generation and cloud sandboxes may need their own keys or paid accounts.'
		},
		{
			question: 'Do I need a Telegram account?',
			answer:
				'No. You can start with AI chat, connected apps, cloud tools and your phone, then connect Telegram later in Settings → Apps & web.'
		},
		{
			question: 'Which AI models can I use?',
			answer:
				'You choose your own chat, image and audio models in Settings. Providers include Vercel AI Gateway, OpenRouter and Google AI Studio. What’s available depends on the provider and keys you add.'
		},
		{
			question: 'What happens to my data?',
			answer:
				'Your API keys are stored on your device. When you use an AI model or a connected service, the information needed for that request goes to that provider. You choose which tools the assistant can use, and sending or changing things asks for your approval by default.'
		},
		{
			question: 'Can Triangle use my computer?',
			answer:
				'Yes, on Windows, with Triangle Companion running on your PC and your phone connected over Tailscale or home Wi-Fi. Each ability has its own switch on the PC: shared folders, seeing the screen, mouse and keyboard, the clipboard, commands, and apps and system. Changes can be set to ask for your OK on the PC first.'
		},
		{
			question: 'How do I install it?',
			answer:
				'Open the GitHub releases page, download the APK for your Android device and install it. Android may ask you to allow installs from your browser or file manager. Then open Triangle, add an AI provider key and connect the apps you want.'
		}
	];

	let scrollY = $state(0);
	let pageHeight = $state(1);
	let viewportHeight = $state(1);
	let menuOpen = $state(false);
	let headerHidden = $state(false);
	let selectedTab = $state(0);
	let activeShot = $state(0);
	let approval = $state<'pending' | 'approved' | 'dismissed'>('pending');
	let dialogShot = $state(shots[0]);
	let screenshotDialog: HTMLDialogElement;
	let demoElement: HTMLElement;

	// The demo starts complete, so it reads fine before scripts load or with
	// reduced motion; play() rewinds it and writes it out.
	let typed = $state(Infinity);
	let toolsDone = $state(99);
	let linesShown = $state(99);

	const example = $derived(tabs[selectedTab]);
	const progress = $derived(Math.min(1, scrollY / Math.max(1, pageHeight - viewportHeight)));

	let timers: number[] = [];
	let reducedMotion = false;

	function play() {
		timers.forEach(clearTimeout);
		timers = [];
		if (reducedMotion) return;
		typed = 0;
		toolsDone = 0;
		linesShown = 0;
		const prompt = example.prompt;
		const tools = example.tools.length;
		const lines = example.details.length + 1;
		const typing = 16;
		for (let i = 1; i <= prompt.length; i++) {
			timers.push(window.setTimeout(() => (typed = i), i * typing));
		}
		let at = prompt.length * typing + 260;
		for (let i = 1; i <= tools; i++) {
			at += 420;
			timers.push(window.setTimeout(() => (toolsDone = i), at));
		}
		at += 200;
		for (let i = 1; i <= lines; i++) {
			at += 300;
			timers.push(window.setTimeout(() => (linesShown = i), at));
		}
		timers.push(
			window.setTimeout(() => {
				typed = Infinity;
			}, at)
		);
	}

	function selectTab(index: number) {
		if (index === selectedTab) return;
		selectedTab = index;
		play();
	}

	function tabKeys(event: KeyboardEvent) {
		const forward = ['ArrowDown', 'ArrowRight'].includes(event.key);
		const back = ['ArrowUp', 'ArrowLeft'].includes(event.key);
		if (!forward && !back && event.key !== 'Home' && event.key !== 'End') return;
		event.preventDefault();
		const next =
			event.key === 'Home'
				? 0
				: event.key === 'End'
					? tabs.length - 1
					: (selectedTab + (forward ? 1 : -1) + tabs.length) % tabs.length;
		selectTab(next);
		document.getElementById(`tab-${next}`)?.focus();
	}

	function showShot(shot: (typeof shots)[number]) {
		dialogShot = shot;
		screenshotDialog.showModal();
	}

	onMount(() => {
		reducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

		const reveals = new IntersectionObserver(
			(entries) => {
				for (const entry of entries) {
					if (entry.isIntersecting) {
						entry.target.classList.add('is-visible');
						reveals.unobserve(entry.target);
					}
				}
			},
			{ threshold: 0.14, rootMargin: '0px 0px -30px 0px' }
		);
		if (!reducedMotion) {
			document.documentElement.classList.add('motion-ready');
			document.querySelectorAll('[data-reveal]').forEach((element) => reveals.observe(element));
		}

		const demoSeen = new IntersectionObserver(
			([entry]) => {
				if (entry.isIntersecting) {
					play();
					demoSeen.disconnect();
				}
			},
			{ threshold: 0.35 }
		);
		demoSeen.observe(demoElement);

		const shotSeen = new IntersectionObserver(
			(entries) => {
				for (const entry of entries) {
					if (entry.isIntersecting) activeShot = Number((entry.target as HTMLElement).dataset.shot);
				}
			},
			{ rootMargin: '-48% 0px -48% 0px' }
		);
		document.querySelectorAll('[data-shot]').forEach((element) => shotSeen.observe(element));

		const sized = new ResizeObserver(() => {
			pageHeight = document.documentElement.scrollHeight;
		});
		sized.observe(document.body);

		let last = window.scrollY;
		function scrolled() {
			const now = window.scrollY;
			if (Math.abs(now - last) > 6) {
				headerHidden = now > last && now > 500;
				last = now;
			}
		}
		window.addEventListener('scroll', scrolled, { passive: true });

		// Buttons lean toward the mouse, a little.
		function lean(event: PointerEvent) {
			if (event.pointerType !== 'mouse' || reducedMotion) return;
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
			timers.forEach(clearTimeout);
			reveals.disconnect();
			demoSeen.disconnect();
			shotSeen.disconnect();
			sized.disconnect();
			window.removeEventListener('scroll', scrolled);
			document.removeEventListener('pointermove', lean);
			document.removeEventListener('pointerout', straighten);
			document.documentElement.classList.remove('motion-ready');
		};
	});
</script>

<svelte:window bind:scrollY bind:innerHeight={viewportHeight} />
<svelte:head>
	<title>Triangle: your world, one conversation</title>
	<meta
		name="description"
		content="Triangle brings AI, Telegram, your apps, your phone and your PC into one conversation. For Android, with your own AI keys."
	/>
	<meta name="theme-color" content="#000000" />
	<meta property="og:title" content="Triangle: your world, one conversation" />
	<meta
		property="og:description"
		content="Your chats, your apps, your PC and your AI, in one conversation on your phone."
	/>
	<meta property="og:type" content="website" />
	<meta property="og:image" content="/social-preview.jpg" />
	<meta property="og:image:width" content="1200" />
	<meta property="og:image:height" content="630" />
	<meta property="og:image:type" content="image/jpeg" />
	<meta
		property="og:image:alt"
		content="Triangle. Your world, one conversation. App previews of the assistant and morning brief."
	/>
	<meta name="twitter:card" content="summary_large_image" />
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

<header class:hidden-up={headerHidden && !menuOpen} class:solid={scrollY > 40 || menuOpen}>
	<a class="brand" href="#main" aria-label="Triangle home">
		<svg class="brand-mark" viewBox="0 0 40 40" width="26" height="26" fill="none" aria-hidden="true">
			<path class="brand-faint" d="M20 5 37 34H3Z" />
			<path class="brand-line" d="M20 5 37 34H3Z" pathLength="1" style={`stroke-dashoffset: ${1 - progress}`} />
		</svg>
		<span>triangle</span>
	</a>
	<nav aria-label="Main navigation" class="nav-links">
		<a href="#features"><span>What it does</span></a>
		<a href="#apps"><span>Tools</span></a>
		<a href="#control"><span>Control</span></a>
		<a href={github} target="_blank" rel="noreferrer"><span>GitHub</span></a>
	</nav>
	<a class="button small" data-magnetic href="#download"><span>Download</span><Tri size={8} /></a>
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
		<a href="#features" onclick={() => (menuOpen = false)}>What it does</a>
		<a href="#apps" onclick={() => (menuOpen = false)}>Tools</a>
		<a href="#control" onclick={() => (menuOpen = false)}>Control</a>
		<a href="#download" onclick={() => (menuOpen = false)}>Download</a>
		<a href={github} target="_blank" rel="noreferrer">GitHub</a>
	</nav>
</div>

<main id="main">
	<section class="hero" aria-labelledby="hero-heading">
		<TrianglePlate />
		<div class="hero-copy">
			<h1 id="hero-heading">
				<span class="line"><span>Your world.</span></span>
				<span class="line"><span>One conversation.</span></span>
			</h1>
			<p class="hero-text">
				Your chats, apps, phone and PC, with an AI that can work across all of them.
			</p>
			<div class="hero-actions">
				<a class="button" data-magnetic href="#download"><span>Get it for Android</span><Tri /></a>
				<a class="link" href="#features"><span>See what it does</span></a>
			</div>
		</div>
	</section>

	<section class="ticker" aria-label="Apps Triangle connects to">
		<div class="ticker-track">
			{#each [0, 1] as copy}
				<ul aria-hidden={copy === 1}>
					{#each apps as app}
						<li><BrandIcon name={app} size={26} /><span>{app}</span></li>
					{/each}
					<li class="ticker-more"><span>and 500+ more</span></li>
				</ul>
			{/each}
		</div>
	</section>

	<section class="features band" id="features" aria-labelledby="features-heading">
		<div class="heading" data-reveal="type">
			<h2 id="features-heading">One conversation that can do the work.</h2>
		</div>
		<div class="features-layout">
			<div class="tab-list" role="tablist" aria-label="What Triangle does" aria-orientation="vertical" data-reveal>
				{#each tabs as tab, index}
					<button
						type="button"
						role="tab"
						id={`tab-${index}`}
						aria-selected={selectedTab === index}
						aria-controls="feature-panel"
						tabindex={selectedTab === index ? 0 : -1}
						class:active={selectedTab === index}
						onclick={() => selectTab(index)}
						onkeydown={tabKeys}
					>
						<Tri size={13} class="tab-mark" /><span>{tab.name}</span>
					</button>
				{/each}
			</div>
			<div
				class="feature-panel"
				id="feature-panel"
				role="tabpanel"
				aria-labelledby={`tab-${selectedTab}`}
				tabindex="0"
				bind:this={demoElement}
			>
				{#key selectedTab}
					<div class="panel-copy">
						<h3>{example.title}</h3>
						<p>{example.text}</p>
					</div>
				{/key}
				<div class="demo">
					<div class="demo-bar">
						<Logo size={15} /><span>Example conversation</span>
					</div>
					<div class="demo-body">
						<p class="sr-only">{example.prompt}</p>
						<div class="demo-user" aria-hidden="true">
							{typed === Infinity ? example.prompt : example.prompt.slice(0, typed)}{#if typed !== Infinity && typed < example.prompt.length}<i
									class="caret"
								></i>{/if}
						</div>
						<ul class="demo-tools">
							{#each example.tools as tool, index}
								<li class:done={toolsDone > index} class:waiting={toolsDone < index}>
									<i></i><span>{tool}</span>
								</li>
							{/each}
						</ul>
						<div class="demo-answer">
							<h4 class:shown={linesShown > 0}>{example.answer}</h4>
							{#each example.details as detail, index}
								<p class:shown={linesShown > index + 1}>{detail}</p>
							{/each}
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="shots" aria-labelledby="shots-heading">
		<h2 id="shots-heading" class="sr-only">The app</h2>
		<div class="shots-steps">
			{#each shots as shot, index}
				<article data-shot={index} class:active={activeShot === index}>
					<h3>{shot.title}</h3>
					<p>{shot.text}</p>
					<button class="shots-inline" type="button" onclick={() => showShot(shot)} aria-label={`Enlarge: ${shot.title}`}>
						<Phone screen={shot.screen} alt={shot.alt} />
					</button>
				</article>
			{/each}
		</div>
		<div class="shots-stage">
			<button
				class="shots-phone"
				type="button"
				onclick={() => showShot(shots[activeShot])}
				aria-label={`Enlarge: ${shots[activeShot].title}`}
			>
				{#each shots as shot, index}
					<span class="shot-layer" class:active={activeShot === index} class:past={activeShot > index}>
						<Phone screen={shot.screen} alt={activeShot === index ? shot.alt : ''} />
					</span>
				{/each}
				<span class="phone-sizer"><Phone screen={shots[0].screen} alt="" /></span>
			</button>
			<ol class="shots-index" aria-hidden="true">
				{#each shots as _, index}<li class:active={activeShot === index}></li>{/each}
			</ol>
		</div>
	</section>

	<section class="tools band" id="apps" aria-labelledby="tools-heading">
		<div class="heading" data-reveal="type">
			<h2 id="tools-heading">A small shape with a lot inside.</h2>
		</div>
		<div class="grid">
			<article class="cell span-4 cell-voice wipe" data-reveal>
				<div class="art" aria-hidden="true">
					<svg viewBox="0 0 200 180" class="voice-tri">
						<defs>
							<clipPath id="voice-clip"><path d="M100 8 192 170H8Z" /></clipPath>
							<filter id="voice-blur" filterUnits="userSpaceOnUse" x="-60" y="-20" width="320" height="240"
								><feGaussianBlur stdDeviation="9" /></filter
							>
							<linearGradient id="voice-sky" x1="0" y1="0" x2="0" y2="1">
								<stop offset="0" stop-color="#000" />
								<stop offset=".42" stop-color="#17171a" />
								<stop offset=".62" stop-color="#b4b4b8" />
								<stop offset="1" stop-color="#f2f2f3" />
							</linearGradient>
						</defs>
						<g clip-path="url(#voice-clip)">
							<rect width="200" height="180" fill="url(#voice-sky)" />
							<g filter="url(#voice-blur)" fill="#fff">
								<circle class="cloud c1" cx="50" cy="118" r="26" />
								<circle class="cloud c2" cx="100" cy="104" r="30" />
								<circle class="cloud c3" cx="150" cy="120" r="24" />
							</g>
						</g>
						<path d="M100 8 192 170H8Z" fill="none" stroke="#555" />
					</svg>
				</div>
				<div class="copy">
					<h3>Voice mode</h3>
					<p>
						Talk hands-free. It answers out loud while it writes, and the triangle moves with both
						voices. Drag it down to read along.
					</p>
				</div>
			</article>
			<article class="cell span-2 cell-search wipe" data-reveal>
				<div class="art" aria-hidden="true">
					<div class="search-line"><span>That idea from last week</span><i class="caret"></i></div>
					<ul class="search-hits">
						<li>Your conversations</li>
						<li>Your inbox</li>
						<li>The web</li>
					</ul>
				</div>
				<div class="copy">
					<h3>One search</h3>
					<p>Conversations, Telegram, email, files and the web.</p>
				</div>
			</article>
			<article class="cell span-3 cell-pc wipe" data-reveal>
				<div class="art" aria-hidden="true">
					<svg viewBox="0 0 240 150" class="pc-screen">
						<rect x=".5" y=".5" width="239" height="149" fill="none" stroke="currentColor" opacity=".4" />
						<path d="M0 18H240" stroke="currentColor" opacity=".4" />
						<path class="pc-trail" d="M120 40 180 124H60Z" pathLength="1" />
						<circle class="pc-click" cx="120" cy="40" r="4" />
						<circle class="pc-click two" cx="180" cy="124" r="4" />
						<circle class="pc-click three" cx="60" cy="124" r="4" />
						<path class="pc-cursor" d="M0 0 0 15 4 11 7 18 10 17 7 10 13 10Z" />
					</svg>
				</div>
				<div class="copy">
					<h3>Your PC</h3>
					<p>
						Triangle Companion for Windows lets it move the mouse, type, open apps and reach the
						folders you share. You can watch and take over live.
					</p>
				</div>
			</article>
			<article class="cell span-3 cell-telegram wipe" data-reveal>
				<div class="art" aria-hidden="true">
					<ul class="chat-lines">
						<li><i></i><span style="--w: 62%"></span></li>
						<li class="me"><span style="--w: 44%"></span><i></i></li>
						<li><i></i><span style="--w: 74%"></span></li>
						<li class="me"><span style="--w: 30%"></span><i></i></li>
					</ul>
				</div>
				<div class="copy">
					<h3>A whole Telegram client</h3>
					<p>Chats, channels, folders, files, stickers and voice notes, with your own account.</p>
				</div>
			</article>
			<article class="cell span-2 cell-canvas wipe" data-reveal>
				<div class="art" aria-hidden="true">
					<div class="sheets"><i></i><i></i><i></i></div>
				</div>
				<div class="copy">
					<h3>Content Canvas</h3>
					<p>A home for links, emails, files and saved messages.</p>
				</div>
			</article>
			<article class="cell span-2 cell-phone wipe" data-reveal>
				<div class="art" aria-hidden="true">
					<ul class="switches">
						<li><span>Alarm at 7:00</span><i></i></li>
						<li><span>Flashlight</span><i></i></li>
						<li><span>Call Sara</span><i></i></li>
					</ul>
				</div>
				<div class="copy">
					<h3>Your phone</h3>
					<p>Find a text, set a timer, check your battery or call someone.</p>
				</div>
			</article>
			<article class="cell span-2 cell-code wipe" data-reveal>
				<div class="art" aria-hidden="true">
					<code class="term">
						<span>chart = plot(sales)</span>
						<span>chart.save("q3.png")</span>
						<span class="term-done">Saved q3.png</span>
					</code>
				</div>
				<div class="copy">
					<h3>Cloud and code</h3>
					<p>Cloudflare, E2B sandboxes, MCP servers and skills.</p>
				</div>
			</article>
		</div>
	</section>

	<section class="control band" id="control" aria-labelledby="control-heading">
		<div class="control-copy">
			<div data-reveal="type"><h2 id="control-heading">Nothing goes out until you say so.</h2></div>
			<ul class="principles" data-reveal>
				{#each principles as item}
					<li><h3>{item.title}</h3><p>{item.text}</p></li>
				{/each}
			</ul>
		</div>
		<div class="approval" class:approved={approval === 'approved'} class:dismissed={approval === 'dismissed'} data-reveal>
			<p class="approval-top">Telegram, to Launch team</p>
			<h3>Send this reply?</h3>
			<blockquote>The designs look great. Let’s ship on Friday. Thanks, everyone!</blockquote>
			<div class="approval-actions" aria-live="polite">
				{#if approval === 'pending'}
					<button type="button" class="button" data-magnetic onclick={() => (approval = 'approved')}>
						<span>Approve</span>
					</button>
					<button type="button" class="button ghost" data-magnetic onclick={() => (approval = 'dismissed')}>
						<span>Decline</span>
					</button>
				{:else}
					<div class="approval-result">
						<svg viewBox="0 0 40 40" width="26" height="26" fill="none" aria-hidden="true">
							<path d="M20 5 37 34H3Z" pathLength="1" />
						</svg>
						<span>{approval === 'approved' ? 'Approved. In the app, this would send now.' : 'Declined. Nothing was sent.'}</span>
					</div>
					<button class="link" type="button" onclick={() => (approval = 'pending')}><span>Try again</span></button>
				{/if}
			</div>
			<p class="approval-note">This is a demo, so nothing is really sent.</p>
		</div>
	</section>

	<section class="setup band" aria-labelledby="setup-heading">
		<div class="heading" data-reveal="type"><h2 id="setup-heading">Set up in three steps.</h2></div>
		<ol class="steps">
			<li data-reveal style="--delay: 0ms">
				<span class="step-number" aria-hidden="true">1</span>
				<h3>Install it</h3>
				<p>Download the Android APK from the latest GitHub release.</p>
			</li>
			<li data-reveal style="--delay: 120ms">
				<span class="step-number" aria-hidden="true">2</span>
				<h3>Add your keys</h3>
				<p>Add an AI provider key and connect your apps. Telegram can wait until you’re ready.</p>
			</li>
			<li data-reveal style="--delay: 240ms">
				<span class="step-number" aria-hidden="true">3</span>
				<h3>Ask something</h3>
				<p>Try “Catch me up on my day.”</p>
			</li>
		</ol>
	</section>

	<section class="faq band" aria-labelledby="faq-heading">
		<div class="heading" data-reveal="type"><h2 id="faq-heading">Questions.</h2></div>
		<div class="faq-list" data-reveal>
			{#each questions as item}
				<details name="triangle-faq">
					<summary><span>{item.question}</span><Tri size={12} class="faq-mark" /></summary>
					<p>{item.answer}</p>
				</details>
			{/each}
		</div>
	</section>

	<section class="download" id="download" aria-labelledby="download-heading">
		<svg class="download-tri" viewBox="0 0 600 520" fill="none" aria-hidden="true">
			<path d="M300 20 580 505H20Z" stroke="currentColor" stroke-width="56" />
		</svg>
		<div class="download-copy">
			<div data-reveal="type"><h2 id="download-heading">Bring it all together.</h2></div>
			<p>Triangle is for Android. Triangle Companion runs on Windows.</p>
			<div class="download-actions">
				<a class="button dark" data-magnetic href={releases} target="_blank" rel="noreferrer">
					<span>Download Triangle</span><Tri turn={180} />
				</a>
				<a class="link" href={github} target="_blank" rel="noreferrer"><span>Read the source</span></a>
			</div>
		</div>
	</section>
</main>

<footer>
	<a class="brand" href="#main" aria-label="Triangle home"><Logo size={22} /><span>triangle</span></a>
	<span>Made by <a class="link quiet" href="https://github.com/dagmawibabi" target="_blank" rel="noreferrer"><span>Dagmawi Babi</span></a></span>
	<nav aria-label="Footer">
		<a class="link quiet" href={github} target="_blank" rel="noreferrer"><span>GitHub</span></a>
		<a class="link quiet" href={releases} target="_blank" rel="noreferrer"><span>Releases</span></a>
		<a class="link quiet" href={github + '/issues'} target="_blank" rel="noreferrer"><span>Issues</span></a>
	</nav>
</footer>

<dialog bind:this={screenshotDialog} class="shot-dialog" aria-labelledby="dialog-title">
	<div class="dialog-bar">
		<h2 id="dialog-title">{dialogShot.title}</h2>
		<button type="button" class="link" onclick={() => screenshotDialog.close()}><span>Close</span></button>
	</div>
	<img src={`/screenshots/${dialogShot.screen}.png`} alt={dialogShot.alt} width="780" height="1640" />
	<p>Screenshots use fictional conversations.</p>
</dialog>
