<script>
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

  let selectedFeatures = [];
  let selectedTarget = null;
  let csvData = null;

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

  let columnNames = [];
  function handleFileChange(event) {
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
            console.log(columnNames);
          }
        }
      };
      reader.readAsText(file);
    }
  }

  // // Function to handle file input change
  // function handleFileChange(event: Event & { target: HTMLInputElement }) {
  //   const file: File | undefined = event.target.files?.[0];

  //   if (file) {
  //     const reader: FileReader = new FileReader();

  //     reader.onload = (e: ProgressEvent<FileReader>) => {
  //       if (e.target && e.target.result) {
  //         csvData = e.target.result as string;
  //       }
  //     };
  //     reader.readAsText(file);
  //   }
  // }

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

  let responseData = null; // Adjust this type based on the expected response from your API
  // interface TrainedNN {
  //   loss_hist: number[];
  //   log_loss: number;
  //   accuracy: number;
  // }

  let isLoading = false;
  async function trainNeuralNet() {
    try {
      handleSubmit();
      isLoading = true;
      const response = await fetch("http://127.0.0.1:5000/neural-network", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(requestArgs),
      });

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
      id="dropzone"
      on:change={handleFileChange}
      on:dragover={(event) => {
        event.preventDefault();
      }}
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
      <!-- 
      <div class="grid grid-cols-2 gap-2 mt-2">
        <GradientButton
          >Select Target<ChevronDownSolid
            class="w-3 h-3 ml-2 text-white dark:text-white"
          /></GradientButton
        > -->
      <!-- <Dropdown>
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
      </div> -->

      <div class="grid grid-cols-2 gap-2 mt-2">
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
