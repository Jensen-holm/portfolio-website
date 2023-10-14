<script lang="ts">
  import { Card } from "flowbite-svelte";
  import { onMount } from "svelte";

  export let readmeUrl: string = "";
  let readmeContent;

  async function fetchReadme() {
    try {
      const response = await fetch(
        `https://git-read-md.onrender.com/?readme_url=${readmeUrl}`
      );
      if (response.ok) {
        readmeContent = await response.text();
      } else {
        readmeContent = null;
      }
    } catch (error) {
      readmeContent = null;
    }
  }

  onMount(fetchReadme);
</script>

{#if readmeContent}
  <div class="p-10">
    <Card class="max-w-none">
      <div class="renderedHTML markdown-container">
        {@html `<div>${readmeContent}</div>`}
      </div>
    </Card>
  </div>
{/if}

<style>
  .markdown-container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    font-family: Arial, sans-serif;
    border-radius: 5px;
  }
</style>
