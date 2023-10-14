<script lang="ts">
  import { onMount } from "svelte";
  import { Img, Spinner } from "flowbite-svelte";
  // this is where we get the plot from the ml-vis api
  export let responseData: string;
  let isLoading: boolean = false;
  let pltData: Blob | null = null;

  async function plotResult() {
    try {
      isLoading = true;
      const response = await fetch(
        "https://ml-vis.onrender.com/neural-network",
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(responseData),
        }
      );

      if (response.ok) {
        const data = await response.blob();
        pltData = data;
        isLoading = false;
      } else {
        console.error("Error:", response.text());
        isLoading = false;
      }
    } catch (error) {
      console.error("API Request Error:", error);
    } finally {
      isLoading = false;
    }
  }

  onMount(plotResult);
</script>

<div class="flex justify-center items-center">
  {#if pltData}
    <Img src={URL.createObjectURL(pltData)} />
  {:else if isLoading}
    <Spinner />
  {/if}
</div>
