<script lang="ts">
  import { Label, Select, GradientButton } from "flowbite-svelte";
  import { ArrowRightOutline } from "flowbite-svelte-icons";

  let activation: string = "tanh";
  let activationFuncs = [
    { value: "tanh", name: "tanh" },
    { value: "sinh", name: "sinh" },
    { value: "relu", name: "relu" },
  ];

  let epochs: number = 100;
  let epochValues = [
    { value: 100, name: 100 },
    { value: 500, name: 500 },
    { value: 1000, name: 1000 },
    { value: 1200, name: 1200 },
    { value: 1500, name: 1500 },
  ];

  let learningRate: number = 0.01;
  let leraningRateValues = [
    { value: 0.001, name: 0.001 },
    { value: 0.01, name: 0.01 },
    { value: 0.1, name: 0.1 },
    { value: 0.5, name: 0.5 },
    { value: 1.0, name: 1.0 },
  ];

  let hiddenSize: number = 8;
  const hiddenSizes = [
    { value: 2, name: 2 },
    { value: 4, name: 4 },
    { value: 6, name: 6 },
    { value: 8, name: 8 },
    { value: 12, name: 12 },
    { value: 14, name: 14 },
  ];

  const requestParams = {
    arguments: {
      epochs: epochs,
      activation_func: activation,
      hidden_size: hiddenSize,
      learning_rate: learningRate,
    },
  };

  let responseData: JSON | null = null;
  const headers = {
    "Content-Type": "application/json",
  };

  function trainNeuralNet() {
    fetch(
      "https://machine-learning-from-scratch-jensen.onrender.com/neural-network",
      {
        method: "POST",
        headers: headers,
        body: JSON.stringify(requestParams),
      }
    )
      .then((response) => response.json())
      .then((modelData) => {
        responseData = modelData;
        console.log(modelData);
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  }
</script>

<div>
  <!-- form input -->
  <div class="flex justify-center items-center">
    <div class="grid gap-5 sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-2">
      <Label>
        Select an Activation Function
        <Select class="mt-2" items={activationFuncs} bind:value={activation} />
      </Label>

      <Label>
        Select Number of Epochs
        <Select class="mt-2" items={epochValues} bind:value={epochs} />
      </Label>

      <Label>
        Select Learning Rate
        <Select
          class="mt-2"
          items={leraningRateValues}
          bind:value={learningRate}
        />
      </Label>

      <Label>
        Select Hidden Network Size
        <Select class="mt-2" items={hiddenSizes} bind:value={hiddenSize} />
      </Label>
    </div>
  </div>
</div>

<div class="flex justify-center items-center pt-10 pb-20">
  <GradientButton on:click={trainNeuralNet} color="pinkToOrange" class="w-fit">
    Train Neural Network<ArrowRightOutline
      class="w-3.5 h-3.5 ml-2 text-white"
    />
  </GradientButton>
</div>

<!-- Display the image -->
{#if responseData && responseData.plt_data}
  <img src={`data:image/png;base64,${responseData.plt_data}`} alt="Plot" />
{/if}
