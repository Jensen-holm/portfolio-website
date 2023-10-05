<script>
  import { Card, GradientButton, Heading } from "flowbite-svelte";
  import { ArrowRightOutline } from "flowbite-svelte-icons";
</script>

<div>
  <div class="pt-10 pb-5">
    <div class="text-center">
      <Heading
        tag="h2"
        class="mb-4"
        customSize="text-4xl font-extrabold  md:text-5xl lg:text-6xl"
        >Projects</Heading
      >
    </div>
  </div>

  <div
    class="h-screen grid grid-cols-2 gap-x-0 gap-y-0 justify-items-center items-center mt-10 mb-10 mx-auto w-6/12"
  >
    <div class="">
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
        <GradientButton class="w-fit" href="/audio_reverse">
          Try it<ArrowRightOutline class="w-3.5 h-3.5 ml-2 text-white" />
        </GradientButton>
      </Card>
    </div>
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
        <GradientButton class="w-fit" href="/audio_reverse">
          Try it<ArrowRightOutline class="w-3.5 h-3.5 ml-2 text-white" />
        </GradientButton>
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
        <GradientButton class="w-fit" href="/audio_reverse">
          Try it<ArrowRightOutline class="w-3.5 h-3.5 ml-2 text-white" />
        </GradientButton>
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
        <GradientButton
          class="w-fit"
          href="https://github.com/Jensen-holm/g3n-wrapper"
        >
          Source Code<ArrowRightOutline class="w-3.5 h-3.5 ml-2 text-white" />
        </GradientButton>
      </Card>
    </div>
  </div>
</div>
