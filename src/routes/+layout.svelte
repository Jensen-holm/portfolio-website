<script>
	import '../app.postcss';
	import Footer from '../components/footer.svelte';
	import Navbar from '../components/navbar.svelte';
</script>

<Navbar />
<div class="pt-20">
	<slot />
</div>
<Footer />
