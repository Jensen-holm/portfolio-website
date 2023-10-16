<script>
  import { DarkMode } from "flowbite-svelte";
  import "../app.postcss";
  import Navbar from "../components/general/navbar.svelte";
</script>

<Navbar />
<div class="p-10">
  <div class="flex justify-center items-center pt-20">
    <DarkMode />
  </div>
  <slot />
</div>
