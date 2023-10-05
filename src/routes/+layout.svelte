<script>
  import "../app.postcss";
  import Navbar from "../components/navbar.svelte";
</script>

<Navbar />
<div class="pt-20 pb-30">
  <slot />
</div>
