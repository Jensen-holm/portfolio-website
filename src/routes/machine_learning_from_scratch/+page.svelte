<script>
  import { Heading } from "flowbite-svelte";
  import Readme from "../../components/general/readme.svelte";
  import NeuralNetworkForm from "../../components/machine_learning/neural_network/form.svelte";
</script>

<div class="flex justify-center items-center pt-20 pb-10">
  <Heading tag="h1" class="text-center">Neural Network Classification</Heading>
</div>

<NeuralNetworkForm />

<div class="flex justify-center items-center">
  <div>
    <Readme
      readmeUrl={"https://raw.githubusercontent.com/Jensen-holm/ml-from-scratch/main/README.md"}
    />
  </div>
</div>
