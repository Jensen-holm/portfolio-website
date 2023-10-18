<script>
  import { Alert, DarkMode } from "flowbite-svelte";
  import "../app.postcss";
  import Navbar from "../components/general/navbar.svelte";
  import { InfoCircleSolid } from "flowbite-svelte-icons";
</script>

<Navbar />
<div class="p-10">
  <div class="flex justify-center items-center pt-10">
    <Alert color="red" class="text-center">
      <InfoCircleSolid slot="icon" />
      <span class="font-medium">Warning!</span>
      The backend for this app is currently being hosted using the
      <a class="underline" href="https://onrender.com">render cloud platform's</a> free instances. <br>
      This means that content and functionality may 'fall asleep', and may be slow to wake up.
    </Alert>
  </div>

  <div class="flex justify-center items-center pt-10">
    <DarkMode />
  </div>
  <slot />
</div>
