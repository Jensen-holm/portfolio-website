<script lang="ts">
  import { GradientButton } from "flowbite-svelte";
  import { ArrowRightOutline } from "flowbite-svelte-icons";
  export let args;

  let isLoading = false;
  let responseData = null;
  const headers = {
    "Content-Type": "application/json",
  };

  function trainNeuralNet() {
    console.log(args);
  }
</script>

<div class="flex justify-center items-center pt-10 pb-20">
  <GradientButton on:click={trainNeuralNet} color="red" class="w-fit">
    Train Neural Network<ArrowRightOutline
      class="w-3.5 h-3.5 ml-2 text-white"
    />
  </GradientButton>
</div>
