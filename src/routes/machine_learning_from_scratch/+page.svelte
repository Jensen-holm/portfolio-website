<script lang="ts">
  import {
    Label,
    Range,
    Select,
    GradientButton,
    Img,
    Spinner,
    ImagePlaceholder,
    P,
    Heading,
  } from "flowbite-svelte";
  import { ArrowRightOutline } from "flowbite-svelte-icons";
  // import mushroom from "../../static/sample_datasets/mushrooms.csv";
  // import iris from "../../static/sample_datasets/iris.csv";
  let stepValue = 2.5;

  interface trainingResult {}

  let activation = "tanh";
  let activationFuncs = [
    { value: "tanh", name: "tanh" },
    { value: "relu", name: "relu" },
    { value: "sigmoid", name: "sigmoid" },
  ];

  let epochs = 100;
  let learningRate = 0.01;
  let hiddenSize = 8;

  function trainNeuralNet() {}
</script>

<div>
  <div class="flex justify-center items-center pt-20 pb-20">
    <Heading tag="h1" class="text-center">Neural Network</Heading>
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
