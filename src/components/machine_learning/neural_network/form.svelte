<script lang="ts">
  import {
    Label,
    Range,
    Select,
    Dropdown,
    Checkbox,
    GradientButton,
    Heading,
    Dropzone,
  } from "flowbite-svelte";
  import { ChevronDownSolid, ArrowRightOutline } from "flowbite-svelte-icons";

  let selectedFeatures: string[] = [];
  let selectedTarget: string = "";
  let csvData: string = "";

  let activation = "tanh";
  let activationFuncs = [
    { value: "tanh", name: "tanh" },
    { value: "relu", name: "relu" },
    { value: "sigmoid", name: "sigmoid" },
  ];

  let epochs = 100;
  let learningRate = 0.01;
  let hiddenSize = 8;

  let requestArgs = {
    epochs: 100,
    hidden_size: 8,
    learning_rate: 0.01,
    test_size: 0.2,
    activation: "relu",
    features: selectedFeatures,
    target: "",
    data: "",
  };

  // Function to handle file input change
  function handleFileChange(event: Event & { target: HTMLInputElement }) {
    const file: File | undefined = event.target.files?.[0];

    if (file) {
      const reader: FileReader = new FileReader();

      reader.onload = (e: ProgressEvent<FileReader>) => {
        if (e.target && e.target.result) {
          csvData = e.target.result as string;
        }
      };
      reader.readAsText(file);
    }
  }

  // Function to handle form submission
  function handleSubmit() {
    // Update the requestArgs object with the form data
    requestArgs.activation = activation;
    requestArgs.epochs = epochs;
    requestArgs.learning_rate = learningRate;
    requestArgs.hidden_size = hiddenSize;
    requestArgs.features = selectedFeatures;
    requestArgs.target = selectedTarget;
    requestArgs.data = csvData;
  }

  let responseData: TrainedNN | null = null; // Adjust this type based on the expected response from your API
  interface TrainedNN {
    loss_hist: number[];
    log_loss: number;
    accuracy: number;
  }

  let isLoading: boolean = false;
  async function trainNeuralNet() {
    try {
      handleSubmit();
      isLoading = true;
      const response = await fetch(
        "https://ml-from-scratch-v2.onrender.com/neural-network",
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(requestArgs),
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

<div>
  <div class="flex justify-center items-center pt-20 pb-10">
    <Heading tag="h1" class="text-center">Neural Network</Heading>
  </div>

  <div class="flex justify-center items-center p-10">
    <Dropzone
      class="max-w-[600px]"
      on:drop{handleFileChange}
      on:change{handleFileChange}
      bind:value={csvData}
      accept=".csv"
    >
      <svg
        aria-hidden="true"
        class="mb-3 w-10 h-10 text-gray-400"
        fill="none"
        stroke="currentColor"
        viewBox="0 0 24 24"
        xmlns="http://www.w3.org/2000/svg"
        ><path
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-width="2"
          d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"
        /></svg
      >
      <p class="mb-2 text-sm text-gray-500 dark:text-gray-400">
        <span class="font-semibold">Click to upload</span> or drag and drop
      </p>
      <p class="text-xs text-gray-500 dark:text-gray-400">CSV (MAX. 100MB)</p>
    </Dropzone>
  </div>

  <!-- form input -->
  <div class="flex justify-center items-center">
    <div class="grid gap-5 sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-2">
      <Label>
        Select an Activation Function
        <Select class="mt-2" items={activationFuncs} bind:value={activation} />
      </Label>

      <Label>
        Epochs {epochs}
        <Range id="epochs" min="50" max="500" bind:value={epochs} step="50" />
      </Label>

      <Label>
        Learning Rate {learningRate}
        <Range
          id="learning_rate"
          min="0.01"
          max="1.5"
          bind:value={learningRate}
          step="0.01"
        />
      </Label>

      <Label>
        Hidden Size {hiddenSize}
        <Range
          id="range-steps"
          min="2"
          max="14"
          bind:value={hiddenSize}
          step="2"
        />
      </Label>

      <GradientButton
        >Select Features<ChevronDownSolid
          class="w-3 h-3 ml-2 text-white dark:text-white"
        /></GradientButton
      >
      <Dropdown class="overflow-y-auto px-3 pb-3 text-sm h-44">
        <li class="rounded p-2 hover:bg-gray-100 dark:hover:bg-gray-600">
          <Checkbox>Robert Gouth</Checkbox>
        </li>
        <li class="rounded p-2 hover:bg-gray-100 dark:hover:bg-gray-600">
          <Checkbox>Jese Leos</Checkbox>
        </li>
      </Dropdown>

      <Label>
        Select an Activation Function
        <Select class="mt-2" items={activationFuncs} bind:value={activation} />
      </Label>
    </div>
  </div>
</div>

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

{#if csvData}
  <div class="mt-5">
    <Label>
      CSV Data
      <textarea
        rows="5"
        class="border rounded p-2"
        readonly
        bind:value={csvData}
      />
    </Label>
  </div>
{/if}
