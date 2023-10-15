<script lang="ts">
  import {
    Label,
    Range,
    Select,
    Dropdown,
    Checkbox,
    GradientButton,
    Fileupload,
    Helper,
    Spinner,
    Skeleton,
  } from "flowbite-svelte";
  import { ChevronDownSolid, ArrowRightOutline } from "flowbite-svelte-icons";
  // import Result from "./result.svelte";

  let selectedFeatures: string[] = [];
  let selectedTarget: string | null = null;
  let csvData: string | null | ArrayBuffer = null;
  let pltData: Blob | null = null;

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

  let columnNames: string[] = [];
  function handleFileChange(event: Event) {
    const file = event.target.files?.[0];

    if (file) {
      const reader = new FileReader();
      reader.onload = (e) => {
        if (e.target && e.target.result) {
          csvData = e.target.result;
          // Extract column names from the first row of the CSV
          const csvLines = csvData.split("\n");
          if (csvLines.length > 0) {
            columnNames = csvLines[0].split(",");
          }
        }
      };
      reader.readAsText(file);
    }
  }

  function handleSubmit() {
    requestArgs.activation = activation;
    requestArgs.epochs = epochs;
    requestArgs.learning_rate = learningRate;
    requestArgs.hidden_size = hiddenSize;
    requestArgs.features = selectedFeatures;
    requestArgs.target = selectedTarget;
    requestArgs.data = csvData;
  }

  async function plotResult(responseData) {
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

  let responseData: trainingResult = null;
  let isLoading = false;
  async function trainNeuralNet() {
    try {
      handleSubmit();
      isLoading = true;
      const response = await fetch(
        "https://machine-learning-from-scratch-jensen.onrender.com/neural-network",
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
        plotResult(responseData);
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
  <div class="flex justify-center items-center p-5">
    <div>
      <Fileupload
        class="max-w-[800px]"
        id="upload_csv"
        on:change={handleFileChange}
        on:dragover={(event) => {
          event.preventDefault();
        }}
        accept=".csv"
      />
      <Helper>CSV (MAX. 50MB).</Helper>
    </div>
  </div>

  <div class="flex justify-center items-center">
    <div class="flex justify-center items-center p-5">
      <GradientButton
        >Select Target<ChevronDownSolid
          class="w-3 h-3 ml-2 text-white dark:text-white"
        /></GradientButton
      >
      <Dropdown>
        {#each columnNames as columnName}
          <div class="flex items-center">
            <li class="rounded p-2 hover:bg-gray-100 dark:hover:bg-gray-600">
              <label>
                <input
                  type="radio"
                  bind:group={selectedTarget}
                  value={columnName}
                />
                {columnName}
              </label>
            </li>
          </div>
        {/each}
      </Dropdown>
    </div>
    <div class="flex justify-center items-center">
      <GradientButton
        >Select Features<ChevronDownSolid
          class="w-3 h-3 ml-2 text-white dark:text-white"
        /></GradientButton
      >
      <Dropdown>
        {#each columnNames as columnName}
          <div class="flex items-center">
            <li class="rounded p-2 hover:bg-gray-100 dark:hover:bg-gray-600">
              <Checkbox bind:group={selectedFeatures} value={columnName}>
                {columnName}
              </Checkbox>
            </li>
          </div>
        {/each}
      </Dropdown>
    </div>
  </div>

  <!-- form input -->
  <div class="flex justify-center items-center">
    <div class="grid gap-5 grid-cols-1">
      <Label>
        Select an Activation Function
        <Select class="mt-2" items={activationFuncs} bind:value={activation} />
      </Label>

      <Label>
        Epochs {epochs}
        <Range id="epochs" min="50" max="1000" bind:value={epochs} step="50" />
      </Label>

      <Label>
        Learning Rate {learningRate}
        <Range
          id="learning_rate"
          min="0.001"
          max="1.5"
          bind:value={learningRate}
          step="0.01"
        />
      </Label>

      <Label>
        Hidden Size {hiddenSize}
        <Range
          id="hidden_size"
          min="2"
          max="14"
          bind:value={hiddenSize}
          step="2"
        />
      </Label>
    </div>
  </div>
</div>

<div class="flex justify-center items-center pt-10 pb-20">
  <GradientButton on:click={trainNeuralNet} color="red" class="w-fit">
    {#if isLoading}
      Training ...
    {:else}
      Train Neural Network
    {/if}
    <ArrowRightOutline class="w-3.5 h-3.5 ml-2 text-white" />
  </GradientButton>
</div>

<!-- <Result {responseData} /> -->
<div class="flex justify-center items-center">
  {#if isLoading}
    <Spinner />
    <Skeleton />
  {:else if pltData}
    <img
      src={URL.createObjectURL(pltData)}
      alt="trained neural network classification result plots"
    />
  {/if}
</div>
