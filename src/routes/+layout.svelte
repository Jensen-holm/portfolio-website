<script>
  import { DarkMode } from "flowbite-svelte";
  import "../app.postcss";
  import Navbar from "../components/general/navbar.svelte";
</script>

<Navbar />
<div class="pt-20 pb-30">
  <div class="flex justify-center items-center pt-10">
    <DarkMode />
  </div>
  <slot />
</div>
