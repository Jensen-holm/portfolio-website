<script>
  import { Card, Button } from "flowbite-svelte";
  import { ArrowRightOutline } from "flowbite-svelte-icons";
</script>

<div>
  <div class="pt-20 pb-10">
    <h1 class="text-4xl font-bold text-center">Projects</h1>
  </div>

  <div class="h-screen flex justify-center items-center">
    <div class="mx-5">
      <Card class="pt-4">
        <h5
          class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white"
        >
          Reversing Audio Files
        </h5>
        <p
          class="mb-3 font-normal text-gray-700 dark:text-gray-400 leading-tight"
        >
          Reversing audio files and listening them in reverse can be fun. Try it
          and see if you find any hidden messages in any .wav files you have ...
        </p>
        <Button class="w-fit" href="/audio_reverse">
          Try it<ArrowRightOutline class="w-3.5 h-3.5 ml-2 text-white" />
        </Button>
      </Card>
    </div>
    <div class="mx-5">
      <Card class="pt-4">
        <h5
          class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white"
        >
          Neural Network from scratch
        </h5>
        <p
          class="mb-3 font-normal text-gray-700 dark:text-gray-400 leading-tight"
        >
          I implemented algorithms to build a neural network from scratch. Do
          some hyper parameter tuning with this neural network on the iris
          dataset.
        </p>
        <Button class="w-fit" href="/audio_reverse">
          Try it<ArrowRightOutline class="w-3.5 h-3.5 ml-2 text-white" />
        </Button>
      </Card>
    </div>
    <div class="mx-5">
      <Card class="pt-4">
        <h5
          class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white"
        >
          G3N Graphics Library Wrapper
        </h5>
        <p
          class="mb-3 font-normal text-gray-700 dark:text-gray-400 leading-tight"
        >
          I am working on a wrapper for the G3N graphics engine library with a
          built in physics engine. Written in Go
        </p>
        <Button class="w-fit" href="https://github.com/Jensen-holm/g3n-wrapper">
          Source Code<ArrowRightOutline class="w-3.5 h-3.5 ml-2 text-white" />
        </Button>
      </Card>
    </div>
  </div>
</div>
