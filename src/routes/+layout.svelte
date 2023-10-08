<script>
  // import { DarkMode } from "flowbite-svelte";
  import "../app.postcss";
  import Navbar from "../components/navbar.svelte";
</script>

<Navbar />
<div class="pt-20 pb-30">
  <!-- <div class="flex justify-center items-center"> -->
  <!-- <DarkMode class="" /> -->
  <!-- </div> -->
  <slot />
</div>
