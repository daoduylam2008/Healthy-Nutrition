<script>
    import Apple from "$lib/components/icons/Apple.svelte";
    import Android from "$lib/components/icons/Android.svelte";
</script>

<header class="fixed top-0 flex h-16 w-full items-center justify-between bg-black px-10 text-xl">
	<h1 class="font-semibold">Healthy Nutrient</h1>
	<nav class="flex gap-8">
		<a href="/product" class="text-sm">Product</a>
		<a href="/pricing" class="text-sm">Pricing</a>
	</nav>
</header>

<main class="overflow-scroll">
	<div class="flex h-[calc(100vh-4rem)] flex-col text-center items-center justify-center bg-black">
		<h2 class="text-7xl w-5xl font-bold">Get Healthier <strong class="text-cyan-300">Lazily</strong> With Nutrient Expert</h2>
		<p class="text-xl mt-12">Track your diet and gain your goal weight</p>
		<p class="text-xl mt-2">Identify 5000+ foods (even offline)</p>
        <nav class="flex gap-4 mt-12">
            <a href="/"><Apple/></a>
            <a href="/"><Android/></a>
        </nav>
	</div>

	<footer class="h-96 bg-[#2C2C2C]"></footer>
</main>
