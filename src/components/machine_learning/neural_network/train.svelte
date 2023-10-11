<script lang="ts">
  import { GradientButton } from "flowbite-svelte";
  import { ArrowRightOutline } from "flowbite-svelte-icons";
  export let args: {
    epochs: number;
    hidden_size: number;
    learning_rate: number;
    test_size: number;
    activation: string;
    features: string[];
    target: string;
    data: string; // csv string
  };

  let responseData: TrainedNN | null = null; // Adjust this type based on the expected response from your API
  interface TrainedNN {
    loss_hist: number[];
    log_loss: number;
    accuracy: number;
  }

  let isLoading: boolean = false;
  async function trainNeuralNet() {
    try {
      isLoading = true;
      const response = await fetch(
        "https://ml-from-scratch-v2.onrender.com/neural-network",
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(args),
        }
      );

      if (response.ok) {
        const data = await response.json();
        responseData = data;
        console.log(data); // You can log the data received from the API
      } else {
        console.error("Error:", response.status);
      }
    } catch (error) {
      console.error("API Request Error:", error);
    } finally {
      isLoading = false;
    }
  }
</script>

<div class="flex justify-center items-center pt-10 pb-20">
  <GradientButton on:click={trainNeuralNet} color="red" class="w-fit">
    {#if isLoading}
      Loading...
    {:else if responseData}
      {JSON.stringify(responseData)}
    {:else}
      Train Neural Network
    {/if}
    <ArrowRightOutline class="w-3.5 h-3.5 ml-2 text-white" />
  </GradientButton>
</div>

<div>
  {#if responseData}
    {responseData.log_loss}
    {responseData.accuracy}
  {/if}
</div>
