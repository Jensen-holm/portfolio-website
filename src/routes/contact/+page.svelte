<script>
  import { Heading, P, Alert } from "flowbite-svelte";
  import { InfoCircleSolid } from "flowbite-svelte-icons";

  let copied = false;
  function copyToClipboard() {
    const email = "holmj@mail.gvsu.edu";
    navigator.clipboard.writeText(email);
    copied = true;

    setTimeout(() => {
      copied = false;
    }, 1000);
  }

  function openEmailApp() {
    const email = "holmj@mail.gvsu.edu";
    window.location.href = `mailto:${email}`;
  }
</script>

<div class="flex justify-center items-center text-center">
  <div class="p-10">
    <Heading tag="h6">Email:</Heading>
    <P class="text-center">holmj@mail.gvsu.edu</P>

    <div class="p-10">
      <button
        on:click={copyToClipboard}
        type="button"
        class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800"
        >Copy Email</button
      >

      <button
        on:click={openEmailApp}
        type="button"
        class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800"
        >Open in app</button
      >
    </div>
    {#if copied}
      <Alert dismissable>
        <InfoCircleSolid slot="icon" class="w-4 h-4" />
        email address copied to clipboard.
      </Alert>
    {/if}
  </div>
</div>
