<script lang="ts">
	import { onMount } from 'svelte';
	import Icon from '#lib/components/Icon.svelte';
	import Logo from '#lib/components/Logo.svelte';
	import BrandIcon from '#lib/components/BrandIcon.svelte';
	import Phone from '#lib/components/Phone.svelte';

	const github = 'https://github.com/dagmawibabi/triangle';
	const releases = `${github}/releases`;
	let scrollY = $state(0);
	let pageHeight = $state(1);
	let viewportHeight = $state(1);
	let menuOpen = $state(false);
	let selectedTab = $state(0);
	let approval = $state<'pending' | 'approved' | 'dismissed'>('pending');
	let screenshotDialog: HTMLDialogElement;
	let activeScreenshot = $state({ screen: 'assistant', title: 'A little clarity, on demand.' });
	const scrollProgress = $derived(Math.min(1, scrollY / Math.max(1, pageHeight - viewportHeight)));
	const heroShift = $derived(Math.min(scrollY * 0.12, 90));
	const apps = ['Gmail', 'Slack', 'Notion', 'Drive', 'Calendar', 'GitHub', 'Linear', 'Todoist'];
	const orbitApps = [
		'Telegram',
		'Gmail',
		'Calendar',
		'Slack',
		'Notion',
		'GitHub',
		'Drive',
		'Linear'
	];
	const tabs = [
		{
			name: 'Ask anything',
			icon: 'message',
			label: 'A LITTLE CONTEXT GOES A LONG WAY',
			title: 'It gets the whole picture.',
			text: 'Find the message, connect the dots, catch up on what matters. Ask a question across your chats and apps, and get an answer you can actually act on.',
			prompt: 'What needs my attention before the launch?',
			tools: ['Searching your Telegram chats', 'Checking your calendar'],
			answer: 'Three things, and you’re in good shape.',
			details: [
				'Alex is waiting for your final go-ahead in the launch group.',
				'The design review is at 11:00. Your files are ready in Drive.',
				'Your afternoon is clear. A little room to make things happen.'
			],
			tags: ['Launch team', 'Google Calendar', 'Drive']
		},
		{
			name: 'Make something',
			icon: 'sparkles',
			label: 'FROM A THOUGHT TO A THING',
			title: 'Give your ideas an outlet.',
			text: 'Generate images, turn words into audio, or create a soundtrack for your next idea. Your creations stay together in Files, ready to share wherever they belong.',
			prompt: 'Make a quiet ambient soundtrack for my next focus session.',
			tools: ['Preparing your creative tools', 'Creating looping ambience'],
			answer: 'A little space to think.',
			details: [
				'Soft rain, warm textures, and no sudden changes.',
				'Your generated audio is saved in Files.',
				'Listen, download it, or ask me to send it to Telegram.'
			],
			tags: ['Audio generation', 'Files', 'Ready to share']
		},
		{
			name: 'Keep an eye out',
			icon: 'eye',
			label: 'LET THE IMPORTANT THINGS FIND YOU',
			title: 'A little ahead of your day.',
			text: 'Set a watch, schedule a routine, or wake up to a personal brief. Triangle keeps track of the things you choose, then brings the useful bits back to you.',
			prompt: 'Watch the launch group. Let me know when the final designs are ready.',
			tools: ['Setting up your watch', 'Following the launch group'],
			answer: 'Consider it on my radar.',
			details: [
				'I’ll watch for the final design update.',
				'When it arrives, I’ll bring you a summary and the original message.',
				'You can pause or change this watch whenever you like.'
			],
			tags: ['Background watches', 'Notifications', 'Your schedule']
		},
		{
			name: 'Reach your PC',
			icon: 'monitor',
			label: 'YOUR COMPUTER, FROM THE COUCH',
			title: 'Your PC, from your phone.',
			text: 'Run Triangle Companion on Windows and ask for what you need: find a file, open an app, click through a window, run a command. Watch the screen live and take over by touch whenever you like. You choose what it can do, and it can ask on the PC first.',
			prompt: 'Find last month’s invoice on my PC and send it to me.',
			tools: ['Searching your shared folders', 'Copying the file to your phone'],
			answer: 'Found it, and it’s on your phone.',
			details: [
				'It was in Documents, under Invoices.',
				'The PDF is saved in Files, ready to open or share.',
				'Only the folders you shared were searched.'
			],
			tags: ['Triangle Companion', 'Shared folders', 'Live screen']
		},
		{
			name: 'Go a little further',
			icon: 'code',
			label: 'SURPRISINGLY HANDY. SERIOUSLY CAPABLE.',
			title: 'Small app. Big toolkit.',
			text: 'Run code, make charts, manage your cloud, or extend your assistant with MCP and skills. For the days when “just a chat app” doesn’t quite cut it.',
			prompt: 'Turn this CSV into a chart and save the result.',
			tools: ['Opening your E2B sandbox', 'Running Python'],
			answer: 'Your numbers, with a little perspective.',
			details: [
				'The data is cleaned and grouped by month.',
				'Your chart and the Python script are saved as files.',
				'Open the built-in editor to explore or change the code.'
			],
			tags: ['Python', 'Code editor', 'Generated files']
		}
	];
	const example = $derived(tabs[selectedTab]);
	const capabilities = [
		{
			icon: 'search',
			class: 'search-card',
			label: 'FIND YOUR THREAD',
			title: 'One search. Your whole world.',
			text: 'Conversations, Telegram, email, files, and the web. Find what you remember, even when you forget where it lives.'
		},
		{
			icon: 'mic',
			class: 'voice-card',
			label: 'SAY IT YOUR WAY',
			title: 'Just talk it through.',
			text: 'Open voice mode and have a real conversation, hands-free. It answers out loud as it writes, and you can see the words anytime. Or dictate a thought and listen to a reply.'
		},
		{
			icon: 'folder',
			class: 'canvas-card',
			label: 'KEEP THE GOOD STUFF',
			title: 'A Canvas for your finds.',
			text: 'Give links, emails, files, and saved messages a home. A little less “where did I put that?”'
		},
		{
			icon: 'phone',
			class: 'device-card',
			label: 'RIGHT HERE, ON YOUR PHONE',
			title: 'Small everyday superpowers.',
			text: 'Find a text, set a timer, check your battery, or call a contact. Useful help, close at hand.'
		},
		{
			icon: 'cloud',
			class: 'cloud-card',
			label: 'A TOOLKIT THAT GROWS WITH YOU',
			title: 'From your cloud to your code.',
			text: 'Manage Cloudflare, work in an E2B sandbox, and add MCP servers and skills when you need more.'
		},
		{
			icon: 'sliders',
			class: 'personal-card',
			label: 'MAKE YOURSELF AT HOME',
			title: 'Unmistakably yours.',
			text: 'Your models, your accent color, your type. Fine-tune the workspace, right down to your home-screen widget.'
		}
	];
	const screenshots = [
		{
			screen: 'watches',
			title: 'A watch with your back.',
			text: 'The right update, at the right time.'
		},
		{
			screen: 'assistant',
			title: 'A little clarity, on demand.',
			text: 'Your world, in one conversation.'
		},
		{
			screen: 'brief',
			title: 'Mornings with perspective.',
			text: 'Start with what matters to you.'
		}
	];
	const questions = [
		{
			question: 'What exactly is Triangle?',
			answer:
				'Triangle is an AI workspace for Android that connects your conversations, apps, and everyday tools. It includes a full Telegram client, an assistant that can work across connected services, creative tools, briefs, watches, and more.'
		},
		{
			question: 'Is Triangle free to use?',
			answer:
				'You can download Triangle from GitHub. You bring your own AI provider API key, and any model usage is billed by that provider. Optional services such as web search, connected apps, voice generation, or cloud sandboxes may need their own keys or paid accounts.'
		},
		{
			question: 'Do I need a Telegram account?',
			answer:
				'No. You can start with AI chat, connected apps, cloud tools, and your phone. Connect Telegram later in Settings → Apps & web whenever you want to bring your chats into the picture.'
		},
		{
			question: 'Which AI models can I use?',
			answer:
				'Choose your own chat, image, and audio models in Settings. Triangle supports providers including Vercel AI Gateway, OpenRouter, and Google AI Studio. Available models and capabilities depend on the provider and keys you configure.'
		},
		{
			question: 'What happens to my data?',
			answer:
				'Your API keys are stored locally on your device. When you use an AI model or a connected service, the information needed for that request is processed by that provider. You choose the tools the assistant can use, and sending or changing things is presented for approval by default.'
		},
		{
			question: 'Can Triangle use my computer?',
			answer:
				'Yes, on Windows, with the Triangle Companion app running on your PC and your phone connected over Tailscale or home Wi-Fi. Each ability has its own switch on the PC: shared folders, seeing the screen, mouse and keyboard, the clipboard, commands, and apps and system. Changes can be set to ask for your OK on the PC first.'
		},
		{
			question: 'How do I install it?',
			answer:
				'Open the GitHub releases page, download the APK that matches your Android device, and install it. Android may ask you to allow installation from your browser or file manager. Then open Triangle, add an AI provider key, and connect the apps you want to use.'
		}
	];
	function showScreenshot(item: (typeof screenshots)[number]) {
		activeScreenshot = item;
		screenshotDialog.showModal();
	}
	onMount(() => {
		const media = window.matchMedia('(prefers-reduced-motion: reduce)');
		const observer = new IntersectionObserver(
			(entries) => {
				for (const entry of entries) {
					if (entry.isIntersecting) {
						entry.target.classList.add('is-visible');
						observer.unobserve(entry.target);
					}
				}
			},
			{ threshold: 0.12, rootMargin: '0px 0px -25px 0px' }
		);
		if (!media.matches) {
			document.documentElement.classList.add('motion-ready');
			document.querySelectorAll('[data-reveal]').forEach((element) => observer.observe(element));
		}
		const resize = new ResizeObserver(() => {
			pageHeight = document.documentElement.scrollHeight;
		});
		resize.observe(document.body);
		return () => {
			observer.disconnect();
			resize.disconnect();
			document.documentElement.classList.remove('motion-ready');
		};
	});
</script>

<svelte:window bind:scrollY bind:innerHeight={viewportHeight} />
<svelte:head>
	<title>Triangle — Your world. One conversation.</title>
	<meta
		name="description"
		content="A little less app hopping. A lot more living. Triangle brings AI, Telegram, your favorite apps, creative tools, and everyday tasks into one personal workspace for Android."
	/>
	<meta name="theme-color" content="#080b12" />
	<meta property="og:title" content="Triangle — Your world. One conversation." />
	<meta
		property="og:description"
		content="Your chats, your apps, your AI. A thoughtfully capable workspace for Android, with you in control."
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
	<link
		rel="preload"
		href="/fonts/manrope-latin.woff2"
		as="font"
		type="font/woff2"
		crossorigin="anonymous"
	/>
</svelte:head>

<a class="skip-link" href="#main">Skip to content</a>
<div
	class="scroll-progress"
	style={`transform: scaleX(${scrollProgress})`}
	aria-hidden="true"
></div>
<header class:scrolled={scrollY > 30}>
	<div class="nav-inner">
		<a class="wordmark" href="#main" aria-label="Triangle home"
			><Logo size={28} /><span>triangle<span class="wordmark-period">.</span></span></a
		>
		<nav aria-label="Main navigation" class:menu-open={menuOpen}>
			<a href="#features" onclick={() => (menuOpen = false)}>The possibilities</a><a
				href="#connected"
				onclick={() => (menuOpen = false)}>Your apps</a
			><a href="#control" onclick={() => (menuOpen = false)}>Your control</a><a
				href={github}
				target="_blank"
				rel="noreferrer"
				class="nav-github">GitHub <Icon name="upright" size={13} /></a
			>
		</nav>
		<a href="#download" class="button button-small nav-download"
			>Get Triangle <Icon name="down" size={15} /></a
		>
		<button
			class="menu-toggle icon-button"
			type="button"
			aria-label={menuOpen ? 'Close menu' : 'Open menu'}
			aria-expanded={menuOpen}
			onclick={() => (menuOpen = !menuOpen)}><Icon name={menuOpen ? 'close' : 'menu'} /></button
		>
	</div>
</header>
<main id="main">
	<section class="hero" aria-labelledby="hero-heading">
		<div class="hero-atmosphere" aria-hidden="true">
			<div></div>
			<div></div>
		</div>
		<div class="hero-content container">
			<a class="release-note" href={releases} target="_blank" rel="noreferrer"
				><span class="status-dot"></span> A little triangle. A whole new possibility. <Icon
					name="arrow"
					size={14}
				/></a
			>
			<h1 id="hero-heading">Your world.<br /><span class="ice-text">One conversation.</span></h1>
			<p class="hero-description">
				Your chats, your apps, your AI. Finally, together.<br class="desktop-break" /> Meet the personal
				workspace that makes room for more.
			</p>
			<div class="hero-actions">
				<a class="button button-primary" href="#download"
					><Icon name="android" size={19} /> Get Triangle for Android <Icon
						name="down"
						size={16}
					/></a
				><a class="text-link" href="#features"
					>Find your possibilities <Icon name="arrow" size={17} /></a
				>
			</div>
			<div class="hero-footnote">
				<span>Bring your own AI</span><span class="tiny-dot"></span><span>Built in the open</span
				><span class="tiny-dot"></span><span>Made to be yours</span>
			</div>
		</div>
		<div class="hero-product" style={`--hero-shift: ${heroShift}px`}>
			<svg class="hero-triangle" viewBox="0 0 1000 700" fill="none" aria-hidden="true"
				><path
					d="M500 36 950 650H50L500 36Z"
					stroke="url(#triangle-gradient)"
					stroke-width="1"
				/><path d="m500 90 410 560H90L500 90Z" stroke="#5188ff" stroke-opacity="0.07" /><defs
					><linearGradient
						id="triangle-gradient"
						x1="500"
						y1="36"
						x2="500"
						y2="700"
						gradientUnits="userSpaceOnUse"
						><stop stop-color="#81adff" stop-opacity="0.5" /><stop
							offset="1"
							stop-color="#3975f6"
							stop-opacity="0"
						/></linearGradient
					></defs
				></svg
			>
			<div class="hero-phone hero-phone-left">
				<Phone
					screen="watches"
					alt="Triangle watch update summarizing a design team's launch progress — fictional demo conversation"
					eager
				/>
			</div>
			<div class="hero-phone hero-phone-right">
				<Phone
					screen="brief"
					alt="Triangle morning brief with a priority-ordered rundown of the day — fictional demo content"
					eager
				/>
			</div>
			<div class="hero-phone hero-phone-center">
				<Phone
					screen="assistant"
					alt="Triangle AI assistant catching up on messages, email, and calendar — fictional demo conversation"
					eager
				/>
			</div>
			<div class="floating-label label-left">
				<span class="label-symbol"><Icon name="check" size={13} /></span>
				<div><strong>A little more caught up.</strong><span>A lot less catching up.</span></div>
			</div>
			<div class="floating-label label-right">
				<span class="label-symbol blue-symbol"><Icon name="sparkles" size={15} /></span>
				<div><strong>All the right connections.</strong><span>One place to make them.</span></div>
			</div>
			<div class="product-fade" aria-hidden="true"></div>
		</div>
		<div class="hero-bottom container">
			<span><span class="status-dot"></span> Thoughtfully connected. Entirely yours.</span><a
				href="#features"
				class="scroll-cue">A little look around <Icon name="down" size={14} /></a
			>
		</div>
	</section>
	<section class="integration-strip container" aria-label="Connect your favorite apps">
		<p>Good company for the apps you love.</p>
		<div class="brand-row">
			{#each apps as app}<div class="brand-item">
					<BrandIcon name={app} size={23} /><span>{app === 'Drive' ? 'Google Drive' : app}</span>
				</div>{/each}
		</div>
	</section>
	<section class="workspace section container" id="features" aria-labelledby="workspace-heading">
		<div class="section-heading" data-reveal>
			<span class="eyebrow"><span></span> NOT JUST ANOTHER CHAT WINDOW</span>
			<h2 id="workspace-heading">
				Less app hopping.<br /><span class="muted-heading">More of what matters.</span>
			</h2>
			<p>Life doesn’t happen in one app. Now, getting things done can.</p>
		</div>
		<div
			class="workspace-tabs"
			role="tablist"
			aria-label="Explore Triangle's capabilities"
			data-reveal
		>
			{#each tabs as tab, index}<button
					type="button"
					role="tab"
					id={`tab-${index}`}
					aria-selected={selectedTab === index}
					aria-controls="workspace-panel"
					tabindex={selectedTab === index ? 0 : -1}
					class:active={selectedTab === index}
					onclick={() => (selectedTab = index)}
					onkeydown={(event) => {
						if (['ArrowRight', 'ArrowLeft', 'Home', 'End'].includes(event.key)) {
							event.preventDefault();
							selectedTab =
								event.key === 'Home'
									? 0
									: event.key === 'End'
										? tabs.length - 1
										: (selectedTab + (event.key === 'ArrowRight' ? 1 : -1) + tabs.length) %
											tabs.length;
							document.getElementById(`tab-${selectedTab}`)?.focus();
						}
					}}><Icon name={tab.icon} size={18} /><span>{tab.name}</span></button
				>{/each}
		</div>
		<div
			class="workspace-panel"
			id="workspace-panel"
			role="tabpanel"
			aria-labelledby={`tab-${selectedTab}`}
			tabindex="0"
			data-reveal
		>
			{#key selectedTab}<div class="workspace-copy panel-transition">
					<span class="eyebrow small-eyebrow">{example.label}</span>
					<h3>{example.title}</h3>
					<p>{example.text}</p>
					<a href="#download" class="text-link"
						>Make it part of your day <Icon name="arrow" size={17} /></a
					>
					<div class="workspace-note">
						<Logo size={15} /> A capable assistant. A calmer headspace.
					</div>
				</div>
				<div class="demo-window panel-transition">
					<div class="demo-topbar">
						<div class="demo-window-brand"><Logo size={19} /> triangle</div>
						<span class="demo-label">AN EVERYDAY EXAMPLE</span><Icon name="plus" size={16} />
					</div>
					<div class="demo-body">
						<div class="demo-user">{example.prompt}</div>
						<div class="demo-tools">
							{#each example.tools as tool}<div>
									<Icon name="check" size={12} /><span>{tool}</span>
								</div>{/each}
						</div>
						<div class="demo-answer">
							<Logo size={20} />
							<div>
								<h4>{example.answer}</h4>
								{#each example.details as detail}<p>{detail}</p>{/each}
								<div class="source-chips">
									{#each example.tags as tag}<span><span class="source-dot"></span>{tag}</span
										>{/each}
								</div>
							</div>
						</div>
					</div>
					<div class="demo-composer">
						<Icon name="plus" size={17} /><span>And then, just ask.</span><Icon
							name="mic"
							size={16}
						/><span class="demo-send"><Icon name="arrow" size={15} /></span>
					</div>
				</div>{/key}
		</div>
	</section>
	<section class="connected-section" id="connected" aria-labelledby="connected-heading">
		<div class="connected-inner container">
			<div class="connected-copy" data-reveal>
				<span class="eyebrow"><span></span> YOUR WORLD, WELL CONNECTED</span>
				<h2 id="connected-heading">
					All your apps.<br />Finally on<br /><span class="blue-text">speaking terms.</span>
				</h2>
				<p>
					Your inbox has context. Your calendar has plans. Your chats have the details. Triangle
					brings them into the same conversation.
				</p>
				<div class="connection-points">
					<span><Icon name="check" size={15} /> Connect only what you want</span><span
						><Icon name="check" size={15} /> Read, find, and take action across apps</span
					><span><Icon name="check" size={15} /> Add more connections as you go</span>
				</div>
				<a href={github + '#apps-cloud-and-code'} target="_blank" rel="noreferrer" class="text-link"
					>Explore the connections <Icon name="upright" size={16} /></a
				>
			</div>
			<div class="connection-universe" data-reveal>
				<div class="orbit orbit-outer"></div>
				<div class="orbit orbit-middle"></div>
				<div class="orbit orbit-inner"></div>
				<svg class="connection-lines" viewBox="0 0 560 560" aria-hidden="true"
					><path
						d="M280 280 280 64M280 280 432 128M280 280 496 280M280 280 432 432M280 280 280 496M280 280 128 432M280 280 64 280M280 280 128 128"
						fill="none"
						stroke="#83a9d7"
						stroke-width="1"
						stroke-dasharray="3 7"
					/></svg
				>
				<div class="universe-center">
					<Logo size={53} /><span>triangle</span><span class="center-halo"></span>
				</div>
				{#each orbitApps as app, index}<div class={`orbit-app orbit-app-${index}`}>
						<div class="orbit-app-icon"><BrandIcon name={app} size={31} /></div>
						<span>{app}</span>
					</div>{/each}<span class="universe-caption"
					><span class="status-dot"></span> Your apps. One thoughtful connection.</span
				>
			</div>
		</div>
	</section>
	<section class="capabilities section container" aria-labelledby="capabilities-heading">
		<div class="section-heading heading-split" data-reveal>
			<div>
				<span class="eyebrow"><span></span> A LITTLE MORE IS BUILT IN</span>
				<h2 id="capabilities-heading">
					A remarkably capable<br /><span class="muted-heading">little triangle.</span>
				</h2>
			</div>
			<p>For the everyday things.<br />And the “can it do that, too?” things.</p>
		</div>
		<div class="capability-grid">
			{#each capabilities as feature, index}<article
					class={`capability-card ${feature.class}`}
					data-reveal
					style={`--reveal-delay: ${(index % 3) * 70}ms`}
				>
					<div class="capability-art" aria-hidden="true">
						{#if index === 0}<div class="mini-search">
								<Icon name="search" size={18} /><span>That idea from last week…</span><kbd>↵</kbd>
							</div>
							<div class="mini-search-results">
								<span><Icon name="message" size={13} /> Your conversations</span><span
									><Icon name="mail" size={13} /> Your inbox</span
								><span><Icon name="globe" size={13} /> The web</span>
							</div>
						{:else if index === 1}<div class="waveform">
								{#each Array.from({ length: 32 }) as _, i}<span
										style={`--bar-height: ${12 + ((Math.sin(i * 0.8) + 1) * 22 + (i % 3) * 7)}px; --bar-delay: ${i * -0.075}s`}
									></span>{/each}
							</div>
							<span class="waveform-caption"
								><Icon name="mic" size={12} /> Listening…</span
							>
						{:else if index === 2}<div class="canvas-stack">
								<div>
									<Icon name="book" size={16} /><span>A good read for later</span><span
										class="file-tag">LINK</span
									>
								</div>
								<div>
									<Icon name="image" size={16} /><span>A spark of inspiration</span><span
										class="file-tag">IMAGE</span
									>
								</div>
								<div>
									<Icon name="mail" size={16} /><span>Something to come back to</span><span
										class="file-tag">EMAIL</span
									>
								</div>
							</div>
						{:else if index === 3}<div class="device-pills">
								<span><Icon name="sun" size={18} /> Alarm set for 7:00</span><span
									><Icon name="phone" size={18} /> A call away</span
								><span><Icon name="bell" size={18} /> A gentle reminder</span>
							</div>
						{:else if index === 4}<div class="mini-terminal">
								<span class="terminal-title"
									><span></span><span></span><span></span><b>your next idea.py</b></span
								><code
									><span class="code-purple">from</span> possibility
									<span class="code-purple">import</span>
									idea<br /><br />idea.<span class="code-blue">make_it_happen</span>()<br /><span
										class="code-comment"># A little help goes a long way.</span
									></code
								>
							</div>
						{:else}<div class="appearance-preview">
								<Logo size={39} /><span>A space that feels like you.</span>
								<div class="color-swatches"><i></i><i></i><i></i><i></i><i></i><i></i></div>
							</div>{/if}
					</div>
					<div class="capability-copy">
						<span class="eyebrow small-eyebrow">{feature.label}</span>
						<h3>{feature.title}</h3>
						<p>{feature.text}</p>
					</div>
				</article>{/each}
		</div>
		<div class="telegram-note" data-reveal>
			<div class="telegram-note-icon"><BrandIcon name="Telegram" size={30} /></div>
			<p>
				<strong>And yes. A whole Telegram client, too.</strong><span
					>Chats, channels, folders, files, stickers, voice notes. All right where you need them.</span
				>
			</p>
			<span class="telegram-note-badge">Your account. Your conversations.</span>
		</div>
	</section>
	<section class="control-section section container" id="control" aria-labelledby="control-heading">
		<div class="control-visual" data-reveal>
			<div class="control-glow" aria-hidden="true"></div>
			<div class="approval-window">
				<div class="approval-top">
					<span class="approval-shield"><Icon name="shield" size={19} /></span><span
						>A MOMENT FOR YOUR OKAY</span
					><span class="approval-status"
						><span class="status-dot"></span>
						{approval === 'pending' ? 'Your call' : 'Your choice'}</span
					>
				</div>
				<div class="approval-content">
					<span class="approval-service"
						><BrandIcon name="Telegram" size={18} /> Telegram <Icon name="chevron" size={12} /> Launch
						team</span
					>
					<h3>Send this reply?</h3>
					<div class="approval-message">
						“The designs look great. Let’s make it happen on Friday. Thanks, everyone!”
					</div>
					<div class="approval-detail">
						<span>To</span><strong>Launch team</strong><span>Action</span><strong
							>Send a message</strong
						>
					</div>
					<div class="approval-actions" aria-live="polite">
						{#if approval === 'pending'}<button
								type="button"
								class="button button-approve"
								onclick={() => (approval = 'approved')}
								><Icon name="check" size={16} /> Approve</button
							><button
								type="button"
								class="button button-dismiss"
								onclick={() => (approval = 'dismissed')}>Dismiss</button
							>{:else}<div class="approval-result">
								<Icon name={approval === 'approved' ? 'check' : 'shield'} size={18} /><span
									>{approval === 'approved'
										? 'That’s how you give the go-ahead.'
										: 'Your choice. The action stops here.'}</span
								>
							</div>
							<button
								class="reset-demo"
								type="button"
								onclick={() => (approval = 'pending')}
								aria-label="Reset approval example"><Icon name="refresh" size={17} /></button
							>{/if}
					</div>
				</div>
				<p class="approval-disclaimer">Try it. This is a demo; no message will be sent.</p>
			</div>
			<div class="control-caption">
				<Icon name="lock" size={13} /> Capable by default. Accountable by design.
			</div>
		</div>
		<div class="control-copy" data-reveal>
			<span class="eyebrow"><span></span> THE FINAL SAY IS ALWAYS YOURS</span>
			<h2 id="control-heading">
				Powerful by nature.<br /><span class="muted-heading">Careful by design.</span>
			</h2>
			<p>
				An assistant should make life easier and leave you in charge. Triangle brings the next step
				to you, so you can look it over before it happens.
			</p>
			<div class="control-principles">
				<div>
					<Icon name="shield" size={19} />
					<p>
						<strong>Your approval comes first.</strong><span
							>Review sends and changes before giving the go-ahead.</span
						>
					</p>
				</div>
				<div>
					<Icon name="key" size={19} />
					<p>
						<strong>Your keys stay on your device.</strong><span
							>Connect your own AI providers. Choose your own models.</span
						>
					</p>
				</div>
				<div>
					<Icon name="sliders" size={19} />
					<p>
						<strong>Your boundaries, built in.</strong><span
							>Choose tools individually, or switch to read-only mode.</span
						>
					</p>
				</div>
			</div>
		</div>
	</section>
	<section class="screens-section section" aria-labelledby="screens-heading">
		<div class="container">
			<div class="section-heading centered" data-reveal>
				<span class="eyebrow"><span></span> THOUGHT THROUGH, DOWN TO THE TAP</span>
				<h2 id="screens-heading">
					A little less friction.<br /><span class="muted-heading">A lot more flow.</span>
				</h2>
				<p>A quiet interface for a beautifully busy world.</p>
			</div>
			<div class="screenshot-gallery">
				{#each screenshots as item, index}<button
						type="button"
						class={`screenshot-item screenshot-item-${index}`}
						onclick={() => showScreenshot(item)}
						aria-label={`Enlarge app screenshot: ${item.title}`}
						data-reveal
						style={`--reveal-delay: ${index * 100}ms`}
						><div class="gallery-phone">
							<Phone
								screen={item.screen}
								alt={item.title + ' Triangle app screenshot with fictional sample content.'}
							/><span class="enlarge-hint"><Icon name="plus" size={17} /> Take a closer look</span>
						</div>
						<h3>{item.title}</h3>
						<p>{item.text}</p></button
					>{/each}
			</div>
			<p class="screenshot-note">A glimpse of Triangle. Screenshots use fictional conversations.</p>
		</div>
	</section>
	<section class="getting-started section container" aria-labelledby="start-heading">
		<div class="section-heading centered" data-reveal>
			<span class="eyebrow"><span></span> A SMALL START TO SOMETHING GOOD</span>
			<h2 id="start-heading">Make yourself at home.</h2>
			<p>A few minutes, and a world of possibilities.</p>
		</div>
		<div class="setup-steps" data-reveal>
			<article>
				<span class="step-number">01</span>
				<h3>Meet your little triangle.</h3>
				<p>Download the Android APK from the latest GitHub release and install it on your phone.</p>
				<a href={releases} target="_blank" rel="noreferrer"
					>Find your download <Icon name="upright" size={14} /></a
				>
			</article>
			<article>
				<span class="step-number">02</span>
				<h3>Bring your world along.</h3>
				<p>
					Add an AI provider key and connect the apps you use. Telegram can join whenever you’re
					ready.
				</p>
				<span class="step-detail">Only the connections you choose.</span>
			</article>
			<article>
				<span class="step-number">03</span>
				<h3>Start with a conversation.</h3>
				<p>
					Ask a question. Make something. Set a watch. There’s no perfect prompt—just start with
					what you need.
				</p>
				<span class="step-detail">“Catch me up on my day.”</span>
			</article>
		</div>
	</section>
	<section class="faq-section section container" aria-labelledby="faq-heading">
		<div class="faq-heading" data-reveal>
			<span class="eyebrow"><span></span> A FEW GOOD QUESTIONS</span>
			<h2 id="faq-heading">
				Wondering<br />{' '}<span class="muted-heading">about anything?</span>
			</h2>
			<p>Here’s a little more to go on.</p>
			<a href={github + '/issues'} target="_blank" rel="noreferrer" class="text-link"
				>Let’s talk on GitHub <Icon name="upright" size={16} /></a
			>
		</div>
		<div class="faq-list" data-reveal>
			{#each questions as question}<details name="triangle-faq">
					<summary>{question.question}<span><Icon name="plus" size={18} /></span></summary>
					<p>{question.answer}</p>
				</details>{/each}
		</div>
	</section>
	<section class="download-section" id="download" aria-labelledby="download-heading">
		<div class="download-atmosphere" aria-hidden="true"></div>
		<svg class="download-triangle" viewBox="0 0 600 520" fill="none" aria-hidden="true"
			><path d="M300 12 590 510H10L300 12Z" stroke="currentColor" stroke-width="1" /><path
				d="m300 85 245 425H55L300 85Z"
				stroke="currentColor"
				stroke-width="1"
			/></svg
		>
		<div class="download-inner container" data-reveal>
			<div class="download-logo"><Logo size={36} /></div>
			<span class="eyebrow">A LITTLE TRIANGLE. A LITTLE MORE POSSIBILITY.</span>
			<h2 id="download-heading">Make room for<br /><span class="ice-text">what matters.</span></h2>
			<p>Your world is waiting. Bring it together.</p>
			<a
				class="button button-primary download-button"
				href={releases}
				target="_blank"
				rel="noreferrer"
				><Icon name="android" size={21} /> Download Triangle <Icon name="download" size={18} /></a
			>
			<div class="download-meta">
				<span>For Android</span><span class="tiny-dot"></span><span>Your AI, your keys</span><span
					class="tiny-dot"
				></span><span>Available on GitHub</span>
			</div>
			<a href={github} class="source-link" target="_blank" rel="noreferrer"
				><BrandIcon name="GitHub" size={16} /> Curious how it works? See the source. <Icon
					name="upright"
					size={13}
				/></a
			>
		</div>
	</section>
</main>
<footer class="container">
	<div class="footer-top">
		<a class="wordmark" href="#main" aria-label="Triangle home"
			><Logo size={25} /><span>triangle<span class="wordmark-period">.</span></span></a
		><span>A small shape. An open world.</span>
		<div class="footer-links">
			<a href={github} target="_blank" rel="noreferrer">GitHub <Icon name="upright" size={13} /></a
			><a href={releases} target="_blank" rel="noreferrer"
				>Releases <Icon name="upright" size={13} /></a
			><a href={github + '/issues'} target="_blank" rel="noreferrer"
				>Say hello <Icon name="upright" size={13} /></a
			>
		</div>
	</div>
	<div class="footer-bottom">
		<span
			>Made with intention by <a
				href="https://github.com/dagmawibabi"
				target="_blank"
				rel="noreferrer">Dagmawi Babi</a
			>.</span
		><span>Independent. Thoughtful. A little different.</span><a href="#main"
			>Back to the top <Icon name="down" size={12} /></a
		>
	</div>
</footer>
<dialog
	bind:this={screenshotDialog}
	class="screenshot-dialog"
	aria-labelledby="screenshot-dialog-title"
>
	<div class="dialog-heading">
		<div>
			<span class="eyebrow small-eyebrow">A CLOSER LOOK AT TRIANGLE</span>
			<h2 id="screenshot-dialog-title">{activeScreenshot.title}</h2>
		</div>
		<button
			type="button"
			class="icon-button"
			onclick={() => screenshotDialog.close()}
			aria-label="Close screenshot"><Icon name="close" size={24} /></button
		>
	</div>
	<img
		src={`/screenshots/${activeScreenshot.screen}.png`}
		alt={activeScreenshot.title + ' Enlarged Triangle screenshot with fictional sample content.'}
		width="780"
		height="1640"
	/>
	<p>App preview · Sample conversations</p>
</dialog>
