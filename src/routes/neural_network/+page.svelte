<script lang="ts">
  import {
    Label,
    Select,
    GradientButton,
    Img,
    Spinner,
    ImagePlaceholder,
    P,
    Heading,
    List,
    Li,
  } from "flowbite-svelte";
  import { ArrowRightOutline } from "flowbite-svelte-icons";

  interface trainingResult {
    learning_rate: number;
    epochs: number;
    plt_data: string;
    hidden_size: number;
    activation_func: string;
    mse: number;
  }

  let results: trainingResult[] = [];

  let activation = "tanh";
  let activationFuncs = [
    { value: "tanh", name: "tanh" },
    { value: "sinh", name: "sinh" },
    { value: "relu", name: "relu" },
  ];

  let epochs = 100;
  let epochValues = [
    { value: 100, name: 100 },
    { value: 500, name: 500 },
    { value: 1000, name: 1000 },
    { value: 1200, name: 1200 },
    { value: 1500, name: 1500 },
  ];

  let learningRate = 0.01;
  let leraningRateValues = [
    { value: 0.001, name: 0.001 },
    { value: 0.01, name: 0.01 },
    { value: 0.1, name: 0.1 },
    { value: 0.5, name: 0.5 },
    { value: 1.0, name: 1.0 },
  ];

  let hiddenSize = 8;
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

  let responseData: trainingResult | null = null;
  const headers = {
    "Content-Type": "application/json",
  };

  let isLoading = false;
  async function trainNeuralNet() {
    isLoading = true;
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
        if (modelData) {
          responseData = modelData;
          results.push(modelData);
          console.log(results);
        }
        isLoading = false;
      })
      .catch((error) => {
        console.error("Error:", error);
        isLoading = false;
      });
  }
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

{#if isLoading}
  <div class="flex justify-center items-center">
    <Spinner size="10" />
  </div>
  <div class="flex justify-center items-center pt-20 pb-20">
    <ImagePlaceholder />
  </div>
{/if}

{#if responseData && responseData.plt_data && !isLoading}
  <div class="flex justify-center items-center">
    <P size="3xl">Mean Squared Error: {responseData.mse.toFixed(4)}</P>
  </div>
  <div class="flex justify-center items-center pt-10 pb-20">
    <Img src={`data:image/png;base64,${responseData.plt_data}`} alt="Plot" />
  </div>
{/if}

<div class="flex justify-center items-center p-10 m-10">
  <div class="max-w-[700px]">
    <div class="flex justify-center items-center pb-5">
      <Heading tag="h4" class="text-center">Parameters</Heading>
    </div>
    <div class="flex justify-center items-center">
      <List list="none">
        <Li>
          <Heading tag="h5" class="text-left" size="3xl">Epochs</Heading>
          <P class="pb-10 text-left"
            >Think of epochs as rounds of training for your neural network. Each
            epoch means the network has gone through the entire dataset once,
            learning and adjusting its parameters. More epochs can lead to
            better accuracy, but too many can also overfit the model to your
            training data.
          </P>
        </Li>

        <Li>
          <Heading tag="h5" class="text-left" size="3xl"
            >Activation Function</Heading
          >
          <P class="pb-10 text-left">
            Activation functions introduce non-linearity to your neural network,
            allowing it to model complex relationships in data. The choice of
            activation function (like sigmoid, ReLU, or tanh) affects how the
            network processes and passes information between its layers.
          </P>
        </Li>

        <Li>
          <Heading tag="h5" class="text-left" size="3xl">Hidden Size</Heading>
          <P class="pb-10 text-left">
            This refers to the number of neurons or units in the hidden layer(s)
            of your neural network. More hidden units can make the network more
            capable of learning complex patterns, but it can also make training
            slower and increase the risk of overfitting.
          </P>
        </Li>

        <Li>
          <Heading tag="h5" class="text-left" size="3xl">Learning Rate</Heading>
          <P class="pb-10 text-left">
            Imagine this as the step size your neural network takes during
            training. It determines how much the network's parameters are
            updated based on the error it observes. A higher learning rate means
            bigger steps but can lead to overshooting the optimal values, while
            a smaller learning rate may take longer to converge or find the best
            values.</P
          >
        </Li>
      </List>
    </div>

    <div class="flex justify-center items-center pb-5">
      <Heading tag="h4" class="text-left text-2xl font-semibold"
        >The Iris Dataset</Heading
      >
    </div>
    <div class="flex justify-center items-center mb-10">
      <List list="none">
        <Li>
          <Heading tag="h5" class="text-lg text-left font-semibold mb-2"
            >Features</Heading
          >
          <P>
            The dataset consists of measurements from 150 iris flowers from
            three different species: setosa, versicolor, and virginica. Each
            sample has four features, making it a 4-dimensional dataset. The
            features are:
          </P>
          <List list="none">
            <Li>
              <P class="text-center mt-5">Sepal length(in centimeters)</P>
            </Li>
            <Li>
              <P class="text-center">Sepal Width (in centimeters)</P>
            </Li>
            <Li>
              <P class="text-center">Petal Length (in centimeters)</P>
            </Li>
            <Li>
              <P class="text-center">Petal Width (in centimeters)</P>
            </Li>
          </List>
        </Li>
      </List>
    </div>

    <div class="flex justify-center items-center pb-5">
      <Heading tag="h4" class="text-center text-2xl font-semibold"
        >Results</Heading
      >
    </div>
    <div class="flex justify-center items-center text-left">
      <List list="none">
        <Li>
          <Heading tag="h5" class="text-lg font-semibold mb-2"
            >Mean Squared Error (MSE)</Heading
          >
          <P class="text-left">
            MSE is calculated by taking the average of the squared differences
            between the predicted values and the actual values in your dataset.
            Mathematically, it can be expressed as:
          </P>
          <P class="text-sm mt-5 text-center mb-5"
            >MSE = Σ(y_actual - y_predicted)² / n</P
          >
          <P>Where:</P>
        </Li>
        <Li />
        <List list="none" class="list-inside pl-4 mt-2">
          <Li>
            <P size="sm">
              "y_actual" represents the actual values (the correct flower
              species in your case) from your dataset.
            </P>
          </Li>
          <Li>
            <P size="sm">
              "y_predicted" represents the predicted values (the species
              predicted by your neural network) for the same data points.
            </P>
          </Li>
          <Li>
            <P size="sm">
              "Σ" denotes summation, meaning you add up the squared differences
              for all data points.
            </P>
          </Li>
          <Li>
            <P class="mb-5" size="sm"
              >"n" is the number of data points in your dataset.</P
            >
          </Li>
        </List>
        <Li class="mb-8">
          <Heading tag="h6" class="text-lg font-semibold"
            >Interpretation</Heading
          >
          <P>
            MSE provides a measure of how well your neural network's predictions
            match the actual values. The lower the MSE, the better your model is
            at making accurate predictions. In other words, a lower MSE
            indicates that the predicted flower species are closer to the actual
            species in your dataset.
          </P>
        </Li>
      </List>
    </div>
  </div>
</div>
