<script lang="ts">
  import { Card, Spinner } from "flowbite-svelte";
  import { onMount } from "svelte";

  export let readmeUrl: string = "";
  let readmeContent: string | null;
  let isLoading: boolean = true;

  async function fetchReadme() {
    try {
      isLoading = true;
      const response = await fetch(
        `https://git-read-md.onrender.com/?readme_url=${readmeUrl}`
      );
      if (response.ok) {
        readmeContent = await response.text();
        isLoading = false;
      } else {
        readmeContent = null;
        isLoading = false;
      }
    } catch (error) {
      readmeContent = null;
      isLoading = false;
    }
  }

  onMount(fetchReadme);
</script>

<div class="pt-10 pb-10">
  <Card class="max-w-none">
    {#if readmeContent}
      <div class="renderedHTML markdown-container">
        {@html `${readmeContent}`}
      </div>
    {:else}
      <Spinner size="10" />
    {/if}
  </Card>
</div>

<style>
  .markdown-container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    font-family: Arial, sans-serif;
    border-radius: 5px;
  }
</style>
